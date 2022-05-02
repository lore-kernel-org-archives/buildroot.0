Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3978DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 18:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 990A260F87;
	Mon,  2 May 2022 18:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NEb6Mq0JV0k1; Mon,  2 May 2022 18:55:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1FB960F0E;
	Mon,  2 May 2022 18:55:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6EE11BF30C
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 18:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3CA782521
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 18:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DvHxAqPpAthn for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 18:55:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 785C9824A4
 for <buildroot@buildroot.org>; Mon,  2 May 2022 18:55:25 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.167.166])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6DE90B00565;
 Mon,  2 May 2022 20:55:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1651517721;
 bh=mFYUXDlYRjTbfBd2+W69YzBV8v3IIbrqfffFphBjC8U=;
 h=From:To:Cc:Subject:Date:From;
 b=R2XMQxL2JCdU7o0/cQQw0jsrNYUCwOhwQn/WS0DDUD0sOCKks5eEtPQ9dD5ycZ2Id
 T7Y7KikhcMpYLGi6x7cTfRkTl8xuQWB0o6Gp5roXzuTr18KTePwej2DePlNyv3+lGg
 24S+HySugcpDmrbdqhgoee0z3wbeZRhT0GzBqWOy/bkObMzcCgiUfjXVwGKH6cm3oZ
 Xv/av8j8/E743FHqcYLoRH3Qtq1q9e47kYDkZ+BQbAeZkGyOJuA3c17eFGNOzJd2yz
 ZPmqmcrYQSydbfMWyeCu5JuYNtV+UOME91J38WrJF88uGiGsD4zM9qyHtb3mErf8PM
 u5G4LLKT0u3mQ==
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 20:55:06 +0200
Message-Id: <20220502185506.34664-1-ju.o@free.fr>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.2.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log since v2.2.6, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.7

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Package tested with:

   make check-package
   ...
   0 warnings generated

   ./utils/test-pkg -a -p fluidsynth
   ...
   45 builds, 7 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 20eb9ec49f..12e67404fa 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ca90fe675cacd9a7b442662783c4e7fa0e1fd638b28d64105a4e3fe0f618d20f  fluidsynth-2.2.6.tar.gz
+sha256  460d86d8d687f567dc4780890b72538c7ff6b2082080ef2f9359d41670a309cf  fluidsynth-2.2.7.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index d7c72ed059..c4c9883102 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.6
+FLUIDSYNTH_VERSION = 2.2.7
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.36.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

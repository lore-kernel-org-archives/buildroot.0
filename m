Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A58ECAAA1
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 18:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A082D40895;
	Thu, 15 Sep 2022 18:28:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A082D40895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lgx3PsZB-aCi; Thu, 15 Sep 2022 18:28:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA74E410CC;
	Thu, 15 Sep 2022 18:28:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA74E410CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D0491BF5AA
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 18:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id ECF6240895
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 18:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECF6240895
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16gfrBopqRYH for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 18:28:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84CFC40359
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84CFC40359
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 18:28:31 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.96.174])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id CA6A5780313;
 Thu, 15 Sep 2022 20:28:26 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 20:28:20 +0200
Message-Id: <20220915182820.674274-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663266508;
 bh=g7bEUaK9QdiJLQhHgOUkB4mEKkheo0lZotwu0XFhK7U=;
 h=From:To:Cc:Subject:Date:From;
 b=hhTB7eG4KXZYgr8nBMQv0JcXJqMHij2/cS+RI+HbtLgGvYQO0H2OT02+ceUIUpnnI
 I+XLzbPTlsMWI6N2wI9uqSelb56t/vXPzXNNw25R+xUgbXkg22zoFvakhL4/7Pud8Q
 +9kBSOkYZQ6fAtisDDeva1FnWmskrzsWbr2nm666lIC0jbrAAufYxLR/qcb71qrTAL
 pQQ1ZusoaRG9ELH1V0b6XeORXF1FKZqGUXYYf5DV3XlXQBoq2y6Wc6q7G8GQ2GATly
 1JvD29C4HfncHXBXiENqzyvEtrrzxER6xZ/kls9zMTX504Drfzu6+3hI3rcU5NipyZ
 J6f5bfUoHzdXw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=hhTB7eG4
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.2.9
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

For change log since v2.2.8, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.9

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested on commit 24261a1 with:

    make check-package
    ...
    0 warnings generated

    ./utils/test-pkg -p fluidsynth
    ...
    6 builds, 2 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
---
 package/fluidsynth/fluidsynth.hash | 2 +-
 package/fluidsynth/fluidsynth.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fluidsynth/fluidsynth.hash b/package/fluidsynth/fluidsynth.hash
index 25f9c4f07e..b1e9f08bbf 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7c29a5cb7a2755c8012d941d1335da7bda957bbb0a86b7c59215d26773bb51fe  fluidsynth-2.2.8.tar.gz
+sha256  bc62494ec2554fdcfc01512a2580f12fc1e1b01ce37a18b370dd7902af7a8159  fluidsynth-2.2.9.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index 3ae005f85f..32fb88144e 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.8
+FLUIDSYNTH_VERSION = 2.2.9
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.37.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

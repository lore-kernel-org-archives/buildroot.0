Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF0BC43334
	for <buildroot@archiver.kernel.org>; Wed, 13 Jul 2022 21:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9305941625;
	Wed, 13 Jul 2022 21:23:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9305941625
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id el84oGHwXSWI; Wed, 13 Jul 2022 21:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8E7684014A;
	Wed, 13 Jul 2022 21:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E7684014A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 034291BF348
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 21:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF9AA83F6E
 for <buildroot@lists.busybox.net>; Wed, 13 Jul 2022 21:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF9AA83F6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JM_yyX17Bgzu for <buildroot@lists.busybox.net>;
 Wed, 13 Jul 2022 21:23:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53FFC83F66
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53FFC83F66
 for <buildroot@buildroot.org>; Wed, 13 Jul 2022 21:23:01 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.164.33.223])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6AC4AB00710;
 Wed, 13 Jul 2022 23:22:54 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 13 Jul 2022 23:22:35 +0200
Message-Id: <20220713212235.717229-1-ju.o@free.fr>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1657747377;
 bh=rX33Bb6YU/iEgpb6vZapRDZ2/yq4vufCiIvL44FRDNw=;
 h=From:To:Cc:Subject:Date:From;
 b=GsNUJRpHwFGobW/F/vp9F8nXm5QuNfXCTswOmPS20ShVh88ZYxjRbyqWdOI7fkLuQ
 GDEAsVVscJwegaqcVJt5oB/7lxYDDV//bgH2YkEUk3Piy92PovbWlxJZbsNENaHukb
 6OFTtcN2eSyjwkVpnurBwj92iDcybuocx8fqdC4q/jwPanSfwxvuwbuRKoy5W0Uxop
 Iv69vHcqO6YVng8ROeTXEDBoUny7lWINKWscUQfso7AifdvJwoM8qTZ4aRWgbQPqgf
 W0mCXn/iLKs0wEwwUxdiwcSZWCbUQenywF4GPlyPvToZXIyZUaAgkO48fU8JKBRTgV
 MdEKxGE6Iqrfw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GsNUJRpH
Subject: [Buildroot] [PATCH 1/1] package/fluidsynth: bump to version 2.2.8
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

For change log since v2.2.7, see:
- https://github.com/FluidSynth/fluidsynth/releases/tag/v2.2.8

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Tested with:

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
index 12e67404fa..25f9c4f07e 100644
--- a/package/fluidsynth/fluidsynth.hash
+++ b/package/fluidsynth/fluidsynth.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  460d86d8d687f567dc4780890b72538c7ff6b2082080ef2f9359d41670a309cf  fluidsynth-2.2.7.tar.gz
+sha256  7c29a5cb7a2755c8012d941d1335da7bda957bbb0a86b7c59215d26773bb51fe  fluidsynth-2.2.8.tar.gz
 sha256  9b872a8a070b8ad329c4bd380fb1bf0000f564c75023ec8e1e6803f15364b9e9  LICENSE
diff --git a/package/fluidsynth/fluidsynth.mk b/package/fluidsynth/fluidsynth.mk
index c4c9883102..3ae005f85f 100644
--- a/package/fluidsynth/fluidsynth.mk
+++ b/package/fluidsynth/fluidsynth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FLUIDSYNTH_VERSION = 2.2.7
+FLUIDSYNTH_VERSION = 2.2.8
 FLUIDSYNTH_SITE = $(call github,FluidSynth,fluidsynth,v$(FLUIDSYNTH_VERSION))
 FLUIDSYNTH_LICENSE = LGPL-2.1+
 FLUIDSYNTH_LICENSE_FILES = LICENSE
-- 
2.37.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

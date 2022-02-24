Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30B82C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 21:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3D8083E6F;
	Thu, 24 Feb 2022 21:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id osxfx_xAvzoT; Thu, 24 Feb 2022 21:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1948C83E58;
	Thu, 24 Feb 2022 21:36:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B5091BF31E
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 21:36:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89D8083E58
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 21:36:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CM2vo9pMkF-j for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 21:36:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98A3A83E52
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 21:36:42 +0000 (UTC)
Date: Thu, 24 Feb 2022 21:36:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
 s=protonmail3; t=1645738599;
 bh=oGfjugONMn/Tb6LxvWWJfo06IiNkDziGS5RPnCjupY8=;
 h=Date:To:From:Cc:Reply-To:Subject:Message-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID;
 b=ZbV6iH+wldMNp0yCxQrZGJeL2Fwjp/FmgTNgV1Umyr5vUGXTZju6m1JhaM5bNjrwV
 IBvYdTFd1PXKkGb/KaACc6QzBWrustLapzw2r936a9r4faJ0mupWhXinRb2pLOZbw/
 EyH0VEEBAZVPVqZhq9ofIXYmcnyj6tG1eAFlz8tFruojBmuG8qQEbdP2iTDLT317sL
 QsgaKzNcPWZwPlTXlXeUJshuMiCQ4Jqu8BuPhM4qR1Q174g99gF9v/mSmbI8DS3GWq
 n/a4klBv+AUh6w4MN6utCNyC/C4B55mi4Eei22KYyfA7Gdy2Z4xLUHtf2cBwP76zNZ
 EfiKcXLiA6nkQ==
To: buildroot@buildroot.org
Message-ID: <20220224213620.5899-1-andrei.gherghescu@protonmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/directfb: change upstream site
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
From: Andrei Gherghescu via buildroot <buildroot@buildroot.org>
Reply-To: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
Cc: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The http://www.directfb.org/ has been down since 2015.
Use the Buildroot backup download site.

Fixes:
   - https://bugs.busybox.net/show_bug.cgi?id=13731

Signed-off-by: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
---
 package/directfb-examples/Config.in            | 6 ++++--
 package/directfb-examples/directfb-examples.mk | 2 +-
 package/directfb/directfb.mk                   | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/directfb-examples/Config.in b/package/directfb-examples/Config.in
index 216e036577..4d5de03068 100644
--- a/package/directfb-examples/Config.in
+++ b/package/directfb-examples/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_DIRECTFB_EXAMPLES
 	help
 	  The DirectFB-examples package contains a set of simple
 	  DirectFB applications that can be used to test and demonstrate
-	  various DirectFB features.
+	  various DirectFB features. As of 4 October 2015, DirectFB's
+	  website http://www.directfb.org/ is down. See alternative site
+	  listed below.

-	  http://directfb.org/downloads/Extras/README.DirectFB-examples
+	  http://elinux.org/DirectFB
diff --git a/package/directfb-examples/directfb-examples.mk b/package/directfb-examples/directfb-examples.mk
index 46263da733..c8d09b3e33 100644
--- a/package/directfb-examples/directfb-examples.mk
+++ b/package/directfb-examples/directfb-examples.mk
@@ -5,7 +5,7 @@
 ################################################################################

 DIRECTFB_EXAMPLES_VERSION = 1.7.0
-DIRECTFB_EXAMPLES_SITE = http://www.directfb.org/downloads/Extras
+DIRECTFB_EXAMPLES_SITE = http://sources.buildroot.net/directfb-examples
 DIRECTFB_EXAMPLES_SOURCE = DirectFB-examples-$(DIRECTFB_EXAMPLES_VERSION).tar.gz
 DIRECTFB_EXAMPLES_LICENSE = MIT
 DIRECTFB_EXAMPLES_LICENSE_FILES = COPYING
diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 0b32162d8f..56a396ab99 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -6,7 +6,7 @@

 DIRECTFB_VERSION_MAJOR = 1.7
 DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).7
-DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
+DIRECTFB_SITE = http://sources.buildroot.net/directfb
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPL-2.1+
 DIRECTFB_LICENSE_FILES = COPYING
--
2.35.1


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

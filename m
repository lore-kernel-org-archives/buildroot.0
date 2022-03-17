Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15974C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Mar 2022 12:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC33940319;
	Thu, 17 Mar 2022 12:20:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N8IJJi3ToDmY; Thu, 17 Mar 2022 12:20:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D501A40305;
	Thu, 17 Mar 2022 12:20:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BC1491BF36E
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ABB9340305
 for <buildroot@lists.busybox.net>; Thu, 17 Mar 2022 12:19:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w4HRdLH-08R7 for <buildroot@lists.busybox.net>;
 Thu, 17 Mar 2022 12:19:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D37B440308
 for <buildroot@buildroot.org>; Thu, 17 Mar 2022 12:19:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 46F5984398; Thu, 17 Mar 2022 12:11:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 17 Mar 2022 13:11:21 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fe61f3e1db154bd37a44bcc9b050075e1d400a90
X-Git-Newrev: ead853e5b7c8371c65f32bcaf0507ab5cc05af6a
X-Patchwork-Hint: ignore
Message-Id: <20220317121107.46F5984398@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/directfb: change
 upstream site
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ead853e5b7c8371c65f32bcaf0507ab5cc05af6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

The http://www.directfb.org/ has been down since 2015.
Use the Buildroot backup download site.

Fixes:
   - https://bugs.busybox.net/show_bug.cgi?id=13126

Signed-off-by: Andrei Gherghescu <andrei.gherghescu@protonmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 89ab2a5a3f4588891ab1e9e76feb8c3f69402d5c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

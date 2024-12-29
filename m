Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56448C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05CC848F48;
	Fri, 28 Feb 2025 16:33:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id feVV3SEO3J1R; Fri, 28 Feb 2025 16:33:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A82124EF80
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A82124EF80;
	Fri, 28 Feb 2025 16:33:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 24EE7711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 156E840AED
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1qltQRzzSi0H for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D863F40469
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D863F40469
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D315B81099; Fri, 28 Feb 2025 16:29:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Dec 2024 19:24:29 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4378f30da3a7beaad9417714268ca5a55cf81e93
X-Git-Newrev: 56bc9cb2b7abd620587e32d640595d52e35cd2df
X-Patchwork-Hint: ignore
Message-Id: <20250228162951.D315B81099@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/lite: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=56bc9cb2b7abd620587e32d640595d52e35cd2df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As we're about to remove DirectFB due to it no longer being
maintained, we need to first remove Lite, a toolbox based on DirectFB.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                 |  3 ---
 Config.in.legacy                    |  7 +++++
 package/Config.in                   |  1 -
 package/lite/0001-dfbspy-stat.patch | 53 -------------------------------------
 package/lite/0002-no-tests.patch    | 11 --------
 package/lite/0003-pkg-config.patch  | 22 ---------------
 package/lite/Config.in              | 11 --------
 package/lite/lite.hash              |  3 ---
 package/lite/lite.mk                | 27 -------------------
 9 files changed, 7 insertions(+), 131 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index a91e1c8526..b17ed1b7fb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -767,9 +767,6 @@ package/linuxptp/S66phc2sys Shellcheck lib_sysv.Indent
 package/lirc-tools/0001-plugins-devinput.c-fix-build-with-musl-1.2.0.patch lib_patch.Upstream
 package/lirc-tools/0002-configure-add-disable-doc-option.patch lib_patch.Upstream
 package/lirc-tools/S25lircd lib_sysv.Indent lib_sysv.Variables
-package/lite/0001-dfbspy-stat.patch lib_patch.Sob lib_patch.Upstream
-package/lite/0002-no-tests.patch lib_patch.Sob lib_patch.Upstream
-package/lite/0003-pkg-config.patch lib_patch.Sob lib_patch.Upstream
 package/live555/0001-Add-a-pkg-config-file-for-the-shared-libraries.patch lib_patch.Upstream
 package/lldpd/S60lldpd Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/llvm-project/clang/0001-lib-Driver-ToolChains-Gnu-Use-GCC_INSTALL_PREFIX-in-.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 5ee8fb27d9..c4c52c64d0 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_LITE
+	bool "lite has been removed"
+	select BR2_LEGACY
+	help
+	  This package was no longer maintained upstream, so it was
+	  dropped from Buildroot.
+
 config BR2_PACKAGE_LINUX_FUSION
 	bool "linux-fusion has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 4b0467f3b1..becfc32d80 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -356,7 +356,6 @@ comment "Graphic libraries"
 	source "package/graphicsmagick/Config.in"
 	source "package/imagemagick/Config.in"
 	source "package/libglvnd/Config.in"
-	source "package/lite/Config.in"
 	source "package/mesa3d/Config.in"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
diff --git a/package/lite/0001-dfbspy-stat.patch b/package/lite/0001-dfbspy-stat.patch
deleted file mode 100644
index 5ca73691ed..0000000000
--- a/package/lite/0001-dfbspy-stat.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From upstream git (git://git.directfb.org/git/directfb/libs/LiTE.git)
-
-From ffe0ce78327a63ddb1265328ea9b5b03acdca019 Mon Sep 17 00:00:00 2001
-From: Denis Oliver Kropp <dok@directfb.org>
-Date: Fri, 1 Apr 2011 20:20:26 +0200
-Subject: [PATCH] dfbspy: Build fix for dfbspy example.
-
----
- examples/dfbspy.c |   20 ++++++++++----------
- 1 files changed, 10 insertions(+), 10 deletions(-)
-
-diff --git a/examples/dfbspy.c b/examples/dfbspy.c
-index 5f36f0b..c7f9725 100644
---- a/examples/dfbspy.c
-+++ b/examples/dfbspy.c
-@@ -89,9 +89,9 @@ read_stat( FusionStat *stat, int world )
- 
- /**************************************************************************************************/
- 
--#define CALC(x)     stat.x = (int)(((s.x - last_stat.x) * 1000 / (float) diff) + 0.5f)
-+#define CALC(x)     stats.x = (int)(((s.x - last_stat.x) * 1000 / (float) diff) + 0.5f)
- 
--static FusionStat last_stat, stat;
-+static FusionStat last_stat, stats;
- static long long  last_millis;
- 
- static int
-@@ -145,14 +145,14 @@ static const struct {
-      void          (*update)( LiteLabel *label, void *ctx );
-      void           *ctx;
- } list[] = {
--     { "lease/purchase", update_number, &stat.lease_purchase },
--     { "cede",           update_number, &stat.cede },
--     { "attach",         update_number, &stat.attach },
--     { "detach",         update_number, &stat.detach },
--     { "ref up",         update_number, &stat.ref_up },
--     { "ref down",       update_number, &stat.ref_down },
--     { "prevail/swoop",  update_number, &stat.prevail_swoop },
--     { "dismiss",        update_number, &stat.dismiss }
-+     { "lease/purchase", update_number, &stats.lease_purchase },
-+     { "cede",           update_number, &stats.cede },
-+     { "attach",         update_number, &stats.attach },
-+     { "detach",         update_number, &stats.detach },
-+     { "ref up",         update_number, &stats.ref_up },
-+     { "ref down",       update_number, &stats.ref_down },
-+     { "prevail/swoop",  update_number, &stats.prevail_swoop },
-+     { "dismiss",        update_number, &stats.dismiss }
- };
- 
- #define NUM_LIST    (sizeof(list)/sizeof(list[0]))
--- 
-1.7.6.3
-
diff --git a/package/lite/0002-no-tests.patch b/package/lite/0002-no-tests.patch
deleted file mode 100644
index 3a47186512..0000000000
--- a/package/lite/0002-no-tests.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/Makefile.in.orig	2008-07-07 13:07:12.000000000 +0200
-+++ b/Makefile.in	2008-07-07 13:07:05.000000000 +0200
-@@ -202,7 +202,7 @@
- target_vendor = @target_vendor@
- top_builddir = @top_builddir@
- top_srcdir = @top_srcdir@
--SUBDIRS = data fonts lite leck examples tests
-+SUBDIRS = data fonts lite leck examples
- EXTRA_DIST = TODO lite.pc.in leck.pc.in
- pkgconfigdir = $(libdir)/pkgconfig
- pkgconfig_DATA = lite.pc leck.pc
diff --git a/package/lite/0003-pkg-config.patch b/package/lite/0003-pkg-config.patch
deleted file mode 100644
index cdd24162c7..0000000000
--- a/package/lite/0003-pkg-config.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 7982cccbb6ad58f3802bb266467290200d130a48 Mon Sep 17 00:00:00 2001
-From: Ville Syrjala <syrjala@sci.fi>
-Date: Sat, 27 Nov 2010 01:14:25 +0200
-Subject: [PATCH] Too many '\' characters in the .pc file
-
----
- lite.pc.in |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/lite.pc.in b/lite.pc.in
-index 48eb969..3a21eaa 100644
---- a/lite.pc.in
-+++ b/lite.pc.in
-@@ -9,4 +9,4 @@ Description: "LiTE" is a Toolkit Engine
- Requires: directfb >= @DFB_REQUIRED_VERSION@
- Version: @VERSION@
- Libs: -L${libdir} -llite
--Cflags: -I${includedir} -DLITEFONTDIR=\\\"@LITEFONTDIR@\\\"
-+Cflags: -I${includedir} -DLITEFONTDIR=\"@LITEFONTDIR@\"
---
-1.7.1
-
diff --git a/package/lite/Config.in b/package/lite/Config.in
deleted file mode 100644
index 62cd21e53d..0000000000
--- a/package/lite/Config.in
+++ /dev/null
@@ -1,11 +0,0 @@
-config BR2_PACKAGE_LITE
-	bool "LiTE (toolbox engine)"
-	depends on BR2_PACKAGE_DIRECTFB
-	help
-	  LiTE stands for LiTE is a Toolbox Engine.
-	  Its role is to facilitate the functions of DirectFB so that a
-	  toolbox could be written on top of DirectFB with less effort.
-	  As such LiTE has abstractions for the underlying graphics and
-	  event systems.
-
-	  See http://www.directfb.org/wiki/index.php/LiTE:Architecture
diff --git a/package/lite/lite.hash b/package/lite/lite.hash
deleted file mode 100644
index 13a494b714..0000000000
--- a/package/lite/lite.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  1b784cf595c3d5313e3705db210119f77d48826dbc7fcf6328af83a1270c2264  LiTE-0.8.10.tar.gz
-sha256  512d2d21b6b3384ba64781abb0208a1b87740bc31e2df48e2b206ddb7e4d5779  COPYING
diff --git a/package/lite/lite.mk b/package/lite/lite.mk
deleted file mode 100644
index ddb55d46be..0000000000
--- a/package/lite/lite.mk
+++ /dev/null
@@ -1,27 +0,0 @@
-################################################################################
-#
-# lite
-#
-################################################################################
-
-LITE_VERSION = 0.8.10
-LITE_SOURCE = LiTE-$(LITE_VERSION).tar.gz
-LITE_SITE = http://www.directfb.org/downloads/Libs
-LITE_INSTALL_STAGING = YES
-LITE_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
-LITE_CONF_ENV = DFB_CFLAGS=-I$(STAGING_DIR)/usr/include/directfb
-LITE_DEPENDENCIES = directfb
-LITE_LICENSE = LGPL-2.1+
-LITE_LICENSE_FILES = COPYING
-
-define LITE_FINALIZE_INSTALL
-	$(INSTALL) -d $(TARGET_DIR)/usr/share/LiTE/examples/
-	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/truetype/
-	$(INSTALL) -m0644 $(@D)/data/*.png $(TARGET_DIR)/usr/share/LiTE/
-	$(INSTALL) -m0644 $(@D)/examples/*.png $(TARGET_DIR)/usr/share/LiTE/examples/
-	$(INSTALL) -m0644 $(@D)/fonts/*.ttf $(TARGET_DIR)/usr/share/fonts/truetype/
-endef
-
-LITE_POST_INSTALL_TARGET_HOOKS += LITE_FINALIZE_INSTALL
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

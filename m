Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F3BEC77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF3C383BED;
	Sun,  7 May 2023 12:08:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF3C383BED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id No4hnQs9savI; Sun,  7 May 2023 12:08:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF48883B32;
	Sun,  7 May 2023 12:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF48883B32
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50CF41BF2FA
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0574060BDD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0574060BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VN9o6CkozrBj for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:04:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E58060C07
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:04:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E58060C07
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C9F285EE9; Sun,  7 May 2023 12:04:39 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 13:59:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 458c85990e5b364ffcb48c14a917a8157ee5e399
X-Git-Newrev: 9aa67d7409e0c33cdbc9a6b5103f287bc87b4be5
X-Patchwork-Hint: ignore
Message-Id: <20230507120439.0C9F285EE9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-video-savage:
 bump version to 2.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9aa67d7409e0c33cdbc9a6b5103f287bc87b4be5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.x.org/archives/xorg-announce/2023-April/003381.html

Removed all patches due to upstream commits:
https://gitlab.freedesktop.org/xorg/driver/xf86-video-savage/-/commit/2ec88355123b1def99d8c79769f396ac97bc5008
https://gitlab.freedesktop.org/xorg/driver/xf86-video-savage/-/commit/0ece556daa8a88771b669d8104396abd9166d2d0

and update .checkpackageignore

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore                                |  2 --
 .../0001-cross-compile.patch                       | 27 ----------------------
 .../0002-xorg-xserver120.patch                     | 23 ------------------
 .../xdriver_xf86-video-savage.hash                 |  5 ++--
 .../xdriver_xf86-video-savage.mk                   |  7 +++---
 5 files changed, 6 insertions(+), 58 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fa35f2d391..e80e2a845f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1708,8 +1708,6 @@ package/x11r7/xdriver_xf86-video-imx/0005-xf86-video-imxfb-fix-m4-hardcodded-pat
 package/x11r7/xdriver_xf86-video-imx/0006-xserver-1.14-compat.patch Upstream
 package/x11r7/xdriver_xf86-video-mach64/0001-cross-compile.patch Sob Upstream
 package/x11r7/xdriver_xf86-video-nouveau/0001-nouveau-fixup-driver-for-new-X-server-ABI.patch Upstream
-package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch Sob Upstream
-package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch Upstream
 package/x11r7/xdriver_xf86-video-tdfx/0001-cross.patch Sob Upstream
 package/x11r7/xserver_xorg-server/0001-include-misc.h-fix-uClibc-build.patch Upstream
 package/x11r7/xserver_xorg-server/S40xorg Shellcheck Variables
diff --git a/package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch b/package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch
deleted file mode 100644
index b9c296b6b5..0000000000
--- a/package/x11r7/xdriver_xf86-video-savage/0001-cross-compile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
---- a/configure.ac	2008-05-21 16:04:23.000000000 -0400
-+++ b/configure.ac	2008-06-23 11:41:50.000000000 -0400
-@@ -68,12 +68,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
--        AC_CHECK_FILE([${sdkdir}/dri.h],
--                      [have_dri_h="yes"], [have_dri_h="no"])
--        AC_CHECK_FILE([${sdkdir}/sarea.h],
--                      [have_sarea_h="yes"], [have_sarea_h="no"])
--        AC_CHECK_FILE([${sdkdir}/dristruct.h],
--                      [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+  	if test "$cross_compiling" = "no" ; then
-+ 		AC_CHECK_FILE([${sdkdir}/dri.h],
-+                        [have_dri_h="yes"], [have_dri_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/sarea.h],
-+                        [have_sarea_h="yes"], [have_sarea_h="no"])
-+ 		AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+                        [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+  	else
-+  		have_dri_h="yes"
-+  		have_sarea_h="yes"
-+  		have_dristruct_h="yes"
-+  	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch b/package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch
deleted file mode 100644
index 4c695960d1..0000000000
--- a/package/x11r7/xdriver_xf86-video-savage/0002-xorg-xserver120.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-Fix build with modular-xorg-server-1.20
-
-Downloaded from
-http://cvsweb.netbsd.org/bsdweb.cgi/pkgsrc/x11/xf86-video-savage/patches/patch-src_savage__driver.c?rev=1.3&content-type=text/x-cvsweb-markup
-
-Patch was sent upstream by Thomas Klausner <wiz@netbsd.org>:
-https://lists.x.org/archives/xorg-devel/2018-May/056952.html
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
---- a/src/savage_driver.c.orig	2017-01-17 22:43:40.000000000 +0000
-+++ b/src/savage_driver.c
-@@ -2034,8 +2034,10 @@ static Bool SavagePreInit(ScrnInfoPtr pS
-     xf86DrvMsg(pScrn->scrnIndex, X_PROBED, "Detected current MCLK value of %1.3f MHz\n",
- 	       mclk / 1000.0);
- 
-+#if 0
-     pScrn->maxHValue = 2048 << 3;	/* 11 bits of h_total 8-pixel units */
-     pScrn->maxVValue = 2048;		/* 11 bits of v_total */
-+#endif
-     pScrn->virtualX = pScrn->display->virtualX;
-     pScrn->virtualY = pScrn->display->virtualY;
- 
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
index 661c8749f2..4482ff5991 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.hash
@@ -1,4 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2017-January/002760.html
-sha256  2c93c4db1f71e725dda0caee5821253129d4b52d7aa0fd720593e7769bceec86  xf86-video-savage-2.3.9.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2023-April/003381.html
+sha256  b36cf02cfdd08a39423bb977c45397fbca5813267c727f0fd3c963ac38b601fd  xf86-video-savage-2.4.0.tar.xz
+sha512  a4db097c200f1430887e4c52bbe14aeaaa2c73dfc392beeed104c682114bd067f89b69994d649829cdc5d188cdbe7a41b22c82b0b49e3a02cdf366013ebbc161  xf86-video-savage-2.4.0.tar.xz
 # Locally calculated
 sha256  611f4020815e3d5011a39a58f0958262715cd3becd9cb1ef14cc166fd84ec5a6  COPYING
diff --git a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
index 9e5bf61997..03983d5cdc 100644
--- a/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
+++ b/package/x11r7/xdriver_xf86-video-savage/xdriver_xf86-video-savage.mk
@@ -4,12 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.3.9
-XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_SAVAGE_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_VIDEO_SAVAGE_VERSION = 2.4.0
+XDRIVER_XF86_VIDEO_SAVAGE_SOURCE = xf86-video-savage-$(XDRIVER_XF86_VIDEO_SAVAGE_VERSION).tar.xz
+XDRIVER_XF86_VIDEO_SAVAGE_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE = MIT
 XDRIVER_XF86_VIDEO_SAVAGE_LICENSE_FILES = COPYING
-XDRIVER_XF86_VIDEO_SAVAGE_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_SAVAGE_DEPENDENCIES = xserver_xorg-server libdrm xorgproto
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

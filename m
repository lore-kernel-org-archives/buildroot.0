Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EEBD30CC4
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94A3D8406E;
	Tue, 13 Jan 2026 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W23fiP9K3rNa; Tue, 13 Jan 2026 21:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF7C08405A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768338033;
	bh=oWvm4HfjD2pJjsFRsLR/bNrWJtMuIflBD7t8iFPTuQc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ETFh4y9NzI82FwiPbU1VCd68EjYn+BHkVG8YpGojiIhiVSLdKRnck/l7CyHSAxxNj
	 M4go4SjzVkEnsKRV0wr0uOSYWzHEXo57wLXmCr4o/w/Gc5wbEOSiR1EWXOAdsFw7lc
	 fwiyOyd3WdRJAmRSawdGIFcR3PpLAuSHWpEBdn9wIFEbL1LrGS3joJybMc/vfVyQk5
	 8WBu0ATmgys9J+Rs9IRF97iuoldJ2XMfDfsZCsAjDatd9rvjIPwZvjM+9b706O8xoY
	 KwE6tQBn3pnx/VwtP5NdF2vFR/Rm4EbRxGTQCOGxPBwFb33EoWE51vbyVnmpY4/do2
	 jpyHUU5xbEbow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF7C08405A;
	Tue, 13 Jan 2026 21:00:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A59E231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 21:00:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EF74407CB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FY9-DEX6I_ZC for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D5E7440790
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5E7440790
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D49FC81124; Tue, 13 Jan 2026 20:58:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab8fdd0b909f4af229f5650a6fca11214707c523
X-Git-Newrev: 63a49b514d9077aab7416bbc7e9d62604f462e3b
X-Patchwork-Hint: ignore
Message-Id: <20260113205850.D49FC81124@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-mouse:
 remove package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=63a49b514d9077aab7416bbc7e9d62604f462e3b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In version 2.0.0 Linux support was removed:
https://lists.x.org/archives/xorg-announce/2025-August/003624.html

"This mouse driver is primarily used with BSD, GNU Hurd, illumos, &
 Solaris systems. Linux systems should instead use either xf86-input-
 libinput or xf86-input-evdev.

 While versions 1.9.5 and earlier had rudimentary support for Linux as
 well, that has been removed in this release."

Alternative packages can not be selected due to udev dependencies.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add extra info in Config.in.legacy comment]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 Config.in.legacy                                   |  8 +++
 package/x11r7/Config.in                            |  1 -
 .../0001-build-get-rid-of-sdkdir.patch             | 81 ----------------------
 package/x11r7/xdriver_xf86-input-mouse/Config.in   |  5 --
 .../xdriver_xf86-input-mouse.hash                  |  5 --
 .../xdriver_xf86-input-mouse.mk                    | 15 ----
 7 files changed, 8 insertions(+), 108 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index e5706e2afa..a7c9fab430 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1040,7 +1040,6 @@ package/x11r7/xcursor-transparent-theme/0001-fix-symlink.patch lib_patch.Upstrea
 package/x11r7/xdriver_xf86-input-evdev/0001-build-get-rid-of-sdkdir.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-input-joystick/0001-build-get-rid-of-sdkdir.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-input-libinput/0001-build-get-rid-of-sdkdir.patch lib_patch.Upstream
-package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-input-synaptics/0001-build-get-rid-of-sdkdir.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-fbturbo/0001-sunxi_x_g2d-drop-unused-dri2-include.patch lib_patch.Upstream
 package/x11r7/xdriver_xf86-video-fbturbo/0002-Use-own-thunk-functions-instead-of-fbdevHW-Weak.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index ce7a475838..b2d618fc2e 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
+	bool "xf86-input-mouse removed"
+	select BR2_LEGACY
+	help
+	  Linux support was removed upstream in version
+	  2.0.0. Upstream recommends to switch to xf86-input-evdev or
+	  xf86-input-libinput.
+
 config BR2_PACKAGE_HOST_JSMIN
 	bool "host-jsmin has been removed"
 	select BR2_LEGACY
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 0002dfe598..efa25988c9 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -152,7 +152,6 @@ if BR2_PACKAGE_XORG7
 		source "package/x11r7/xdriver_xf86-input-evdev/Config.in"
 		source "package/x11r7/xdriver_xf86-input-joystick/Config.in"
 		source "package/x11r7/xdriver_xf86-input-libinput/Config.in"
-		source "package/x11r7/xdriver_xf86-input-mouse/Config.in"
 		source "package/x11r7/xdriver_xf86-input-synaptics/Config.in"
 		source "package/x11r7/xdriver_xf86-input-tslib/Config.in"
 		source "package/x11r7/xdriver_xf86-input-vmmouse/Config.in"
diff --git a/package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch b/package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch
deleted file mode 100644
index d5f97f98c1..0000000000
--- a/package/x11r7/xdriver_xf86-input-mouse/0001-build-get-rid-of-sdkdir.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-From aef3d9bca4d77db833f71d50b1c84b16c69d7deb Mon Sep 17 00:00:00 2001
-From: "Yann E. MORIN" <yann.morin.1998@free.fr>
-Date: Sun, 23 Oct 2016 22:53:21 +0200
-Subject: [PATCH] build: get rid of sdkdir
-
-Use of sdkdir causes problems during cross-compilation, where the full
-path is then appended to the DESTDIR, leading to host paths being
-appended in the target:
-    https://bugs.busybox.net/show_bug.cgi?id=8696
-
-Other drivers (e.g. keyboard) got rid of sdkdir. Do the same.
-
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
----
- Makefile.am         |  3 ---
- configure.ac        | 10 ----------
- include/Makefile.am |  4 +++-
- xorg-mouse.pc.in    |  3 +--
- 4 files changed, 4 insertions(+), 16 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 7142485..efe66cb 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -34,9 +34,6 @@ ChangeLog:
- 
- dist-hook: ChangeLog INSTALL
- 
--# Provide an sdk location that is writable by this module
--DISTCHECK_CONFIGURE_FLAGS = --with-sdkdir='$${includedir}/xorg'
--
- if LINT
- # Check source code with tools like lint & sparse
- lint:
-diff --git a/configure.ac b/configure.ac
-index 15d9047..515681d 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -60,16 +60,6 @@ AC_ARG_WITH(xorg-module-dir,
- inputdir=${moduledir}/input
- AC_SUBST(inputdir)
- 
--# X Server SDK location is required to install xf86-mouse-properties.h
--# This location is also relayed in the xorg-mouse.pc file
--sdkdir=`$PKG_CONFIG --variable=sdkdir xorg-server`
--
--# Workaround overriding sdkdir to be able to create a tarball when user has no
--# write permission in sdkdir. See DISTCHECK_CONFIGURE_FLAGS in Makefile.am
--AC_ARG_WITH([sdkdir], [], [sdkdir="$withval"])
--AC_SUBST([sdkdir])
--
--
- # Work out which OS mouse driver we need to build
- case $host_os in
-   linux*)
-diff --git a/include/Makefile.am b/include/Makefile.am
-index 27ce0fb..2b85e4e 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -1 +1,3 @@
--sdk_HEADERS = xf86-mouse-properties.h
-+# Location formerly known as 'sdkdir'
-+xorgincludedir = $(includedir)/xorg
-+xorginclude_HEADERS = xf86-mouse-properties.h
-diff --git a/xorg-mouse.pc.in b/xorg-mouse.pc.in
-index 57df596..8355e61 100644
---- a/xorg-mouse.pc.in
-+++ b/xorg-mouse.pc.in
-@@ -1,6 +1,7 @@ prefix=@prefix@
--sdkdir=@sdkdir@
-+prefix=@prefix@
-+includedir=@includedir@
- 
- Name: xorg-mouse
- Description: X.Org mouse input driver for non-evdev OS'es
- Version: @PACKAGE_VERSION@
--Cflags: -I${sdkdir}
-+Cflags: -I${includedir}/xorg
--- 
-2.7.4
-
diff --git a/package/x11r7/xdriver_xf86-input-mouse/Config.in b/package/x11r7/xdriver_xf86-input-mouse/Config.in
deleted file mode 100644
index efa181e556..0000000000
--- a/package/x11r7/xdriver_xf86-input-mouse/Config.in
+++ /dev/null
@@ -1,5 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_INPUT_MOUSE
-	bool "xf86-input-mouse"
-	select BR2_PACKAGE_XORGPROTO
-	help
-	  X.Org driver for mouse input devices
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
deleted file mode 100644
index d654c362a9..0000000000
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# From https://lists.x.org/archives/xorg-announce/2023-May/003392.html
-sha256  4fde8ae9b44352e2a208584c36528ee3ed13cf5fe4417208a9785daccefd9968  xf86-input-mouse-1.9.5.tar.xz
-sha512  ed9bd9cb9a05dac0ff1bfb4e4704cb2e94117afb400aa9e0b7ccdbb102bc6db1b0d3af7cb6f99d0892f8fc306f1643286291c0fa7114af8e65864412bd6c1afa  xf86-input-mouse-1.9.5.tar.xz
-# Locally computed
-sha256  5b066654bdb61a1ef41f38cceda752897bbddb6e60e20f5889cab436a9b7b813  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk b/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
deleted file mode 100644
index 25e25ab93d..0000000000
--- a/package/x11r7/xdriver_xf86-input-mouse/xdriver_xf86-input-mouse.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-input-mouse
-#
-################################################################################
-
-XDRIVER_XF86_INPUT_MOUSE_VERSION = 1.9.5
-XDRIVER_XF86_INPUT_MOUSE_SOURCE = xf86-input-mouse-$(XDRIVER_XF86_INPUT_MOUSE_VERSION).tar.xz
-XDRIVER_XF86_INPUT_MOUSE_SITE = https://xorg.freedesktop.org/archive/individual/driver
-XDRIVER_XF86_INPUT_MOUSE_LICENSE = MIT
-XDRIVER_XF86_INPUT_MOUSE_LICENSE_FILES = COPYING
-XDRIVER_XF86_INPUT_MOUSE_DEPENDENCIES = xserver_xorg-server xorgproto
-XDRIVER_XF86_INPUT_MOUSE_AUTORECONF = YES
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

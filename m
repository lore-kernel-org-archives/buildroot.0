Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102D5C05027
	for <buildroot@archiver.kernel.org>; Sun, 19 Feb 2023 17:33:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1E3D41712;
	Sun, 19 Feb 2023 17:33:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A1E3D41712
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E8IBKn4V7EWy; Sun, 19 Feb 2023 17:33:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABFFF41769;
	Sun, 19 Feb 2023 17:32:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABFFF41769
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CC3621BF423
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:32:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4000140B86
 for <buildroot@lists.busybox.net>; Sun, 19 Feb 2023 17:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4000140B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 31XbirnwiIaG for <buildroot@lists.busybox.net>;
 Sun, 19 Feb 2023 17:32:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CA4B4049D
 for <buildroot@buildroot.org>; Sun, 19 Feb 2023 17:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CA4B4049D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15D2D8607C; Sun, 19 Feb 2023 17:32:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 19 Feb 2023 17:57:32 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 364511933811d76d4b866fe3aa04adff449cf94b
X-Git-Newrev: 05c3177493aa8447d5cb568c8c13e0c09eded18b
X-Patchwork-Hint: ignore
Message-Id: <20230219173225.15D2D8607C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xwayland: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=05c3177493aa8447d5cb568c8c13e0c09eded18b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

XServer to run X clients under wayland

This XServer is required to run the X clients under Wayland compositor,
for example weston or wlroots based compositors.

Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                           |  1 +
 package/x11r7/Config.in              |  1 +
 package/x11r7/xwayland/Config.in     | 26 ++++++++++
 package/x11r7/xwayland/xwayland.hash |  6 +++
 package/x11r7/xwayland/xwayland.mk   | 94 ++++++++++++++++++++++++++++++++++++
 5 files changed, 128 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7894b10e38..a7a0bb14d1 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2426,6 +2426,7 @@ F:	support/testing/tests/package/test_python_s3transfer.py
 N:	Raphael Pavlidis <raphael.pavlidis@gmail.com>
 F:	package/slirp4netns/
 F:	package/sway/
+F:	package/x11r7/xwayland/
 
 N:	Refik Tuzakli <tuzakli.refik@gmail.com>
 F:	package/freescale-imx/
diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 365de34c98..4de8922e0d 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -12,6 +12,7 @@ menuconfig BR2_PACKAGE_XORG7
 if BR2_PACKAGE_XORG7
 	menu "X11R7 Servers"
 		source package/x11r7/xserver_xorg-server/Config.in
+		source package/x11r7/xwayland/Config.in
 	endmenu
 	menu "X11R7 Libraries"
 		source package/x11r7/libxcb/Config.in
diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
new file mode 100644
index 0000000000..4f14f2cc36
--- /dev/null
+++ b/package/x11r7/xwayland/Config.in
@@ -0,0 +1,26 @@
+config BR2_PACKAGE_XWAYLAND
+	bool "xwayland server"
+	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS # wayland
+	depends on BR2_TOOLCHAIN_HAS_THREADS # wayland
+	# We need a SHA1 implementation. If either openssl or
+	# libgcrypt are already part of the build, we'll use one of
+	# them, otherwise, use the small libsha1 library.
+	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
+	select BR2_PACKAGE_PIXMAN
+	select BR2_PACKAGE_WAYLAND
+	select BR2_PACKAGE_WAYLAND_PROTOCOLS
+	select BR2_PACKAGE_XLIB_LIBXCVT
+	select BR2_PACKAGE_XLIB_LIBXFONT2
+	select BR2_PACKAGE_XLIB_LIBXKBFILE
+	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_XTRANS
+	select BR2_PACKAGE_XORGPROTO
+	help
+	  X.Org X server to run X clients under wayland
+
+	  http://xorg.freedesktop.org
+
+comment "xwayland needs a toolchain w/ threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/x11r7/xwayland/xwayland.hash b/package/x11r7/xwayland/xwayland.hash
new file mode 100644
index 0000000000..0c476f3183
--- /dev/null
+++ b/package/x11r7/xwayland/xwayland.hash
@@ -0,0 +1,6 @@
+# From https://lists.x.org/archives/xorg-announce/2023-February/003322.html
+sha256  d11eeee73290b88ea8da42a7d9350dedfaba856ce4ae44e58c045ad9ecaa2f73  xwayland-22.1.8.tar.xz
+sha512  f52c6f99d8ef7605bc1c651d5ee5e306c12af30649a2d712b1c4c3cf4c7c80246ae24bd9ac39461d47aafc78f5d659446a459cd6259e05ef3128b204981d114a  xwayland-22.1.8.tar.xz
+
+# Locally calculated
+sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
new file mode 100644
index 0000000000..174b440b07
--- /dev/null
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -0,0 +1,94 @@
+################################################################################
+#
+# xwayland
+#
+################################################################################
+
+XWAYLAND_VERSION = 22.1.8
+XWAYLAND_SOURCE = xwayland-$(XWAYLAND_VERSION).tar.xz
+XWAYLAND_SITE = https://xorg.freedesktop.org/archive/individual/xserver
+XWAYLAND_LICENSE = MIT
+XWAYLAND_LICENSE_FILES = COPYING
+XWAYLAND_INSTALL_STAGING = YES
+XWAYLAND_DEPENDENCIES = \
+	pixman \
+	wayland \
+	wayland-protocols \
+	xlib_libxcvt \
+	xlib_libXfont2 \
+	xlib_libxkbfile \
+	xlib_libXrandr \
+	xlib_xtrans \
+	xorgproto
+XWAYLAND_CONF_OPTS = \
+	-Dxwayland_eglstream=false \
+	-Dxvfb=false \
+	-Ddefault_font_path=/usr/share/fonts/X11/ \
+	-Ddtrace=false \
+	-Ddocs=false
+
+ifeq ($(BR2_PACKAGE_LIBDRM)$(BR2_PACKAGE_LIBEPOXY),yy)
+XWAYLAND_CONF_OPTS += -Dglamor=true
+XWAYLAND_DEPENDENCIES += libdrm libepoxy
+else
+XWAYLAND_CONF_OPTS += -Dglamor=false
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+XWAYLAND_CONF_OPTS += -Dglx=true
+XWAYLAND_DEPENDENCIES += libgl
+else
+XWAYLAND_CONF_OPTS += -Dglx=false
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXDMCP),y)
+XWAYLAND_CONF_OPTS += \
+	-Dxdmcp=true \
+	-Dxdm-auth-1=true
+XWAYLAND_DEPENDENCIES += xlib_libXdmcp
+else
+XWAYLAND_CONF_OPTS += \
+	-Dxdmcp=false \
+	-Dxdm-auth-1=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
+XWAYLAND_CONF_OPTS += -Dsecure-rpc=true
+XWAYLAND_DEPENDENCIES += libtirpc
+else
+XWAYLAND_CONF_OPTS += -Dsecure-rpc=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBSELINUX)$(BR2_PACKAGE_AUDIT),yy)
+XWAYLAND_CONF_OPTS += -Dxselinux=true
+XWAYLAND_DEPENDENCIES += libselinux audit
+else
+XWAYLAND_CONF_OPTS += -Dxselinux=false
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libcrypto
+XWAYLAND_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
+XWAYLAND_CONF_OPTS += -Dsha1=libgcrypt
+XWAYLAND_DEPENDENCIES += libgcrypt
+else
+XWAYLAND_CONF_OPTS += -Dsha1=libsha1
+XWAYLAND_DEPENDENCIES += libsha1
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_LIBDRM),yy)
+XWAYLAND_CONF_OPTS += -Ddri3=true
+XWAYLAND_DEPENDENCIES += xlib_libxshmfence libdrm
+else
+XWAYLAND_CONF_OPTS += -Ddri3=false
+endif
+
+ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
+XWAYLAND_CONF_OPTS += -Dlibunwind=true
+XWAYLAND_DEPENDENCIES += libunwind
+else
+XWAYLAND_CONF_OPTS += -Dlibunwind=false
+endif
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

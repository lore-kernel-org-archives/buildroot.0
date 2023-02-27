Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2949C64ED8
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 14:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C18C61062;
	Mon, 27 Feb 2023 14:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C18C61062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iAuwkw-ESI4K; Mon, 27 Feb 2023 14:58:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B945161040;
	Mon, 27 Feb 2023 14:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B945161040
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DCBC1BF2A2
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7859680C1E
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7859680C1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yTpmEy3ZFQJ6 for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92E4B80C33
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92E4B80C33
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80B4A86BF1; Mon, 27 Feb 2023 14:58:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 27 Feb 2023 15:39:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93f5ba38533edb66e9446086266da6f9be904a80
X-Git-Newrev: daf01a38be705ada7ce3e083f096d424ead5544c
X-Patchwork-Hint: ignore
Message-Id: <20230227145800.80B4A86BF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xwayland: xlib_libxshmfence
 is mandatory
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

commit: https://git.buildroot.net/buildroot/commit/?id=daf01a38be705ada7ce3e083f096d424ead5544c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

xlib_libxshmfence is mandatory, not optional, since the addition of the
package in commit 05c3177493aa8447d5cb568c8c13e0c09eded18b:

../miext/sync/misyncshm.c:36:10: fatal error: X11/xshmfence.h: No such file or directory
   36 | #include <X11/xshmfence.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/cccc8f97d452ed2adbcbc4624f159a00287a3d38

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/Config.in           | 4 ++++
 package/wlroots/Config.in          | 4 ++++
 package/x11r7/xwayland/Config.in   | 5 +++++
 package/x11r7/xwayland/xwayland.mk | 5 +++--
 4 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/weston/Config.in b/package/weston/Config.in
index 09119edaaa..d5dbf27bbd 100644
--- a/package/weston/Config.in
+++ b/package/weston/Config.in
@@ -114,6 +114,8 @@ config BR2_PACKAGE_WESTON_XWAYLAND
 	depends on BR2_USE_MMU # xwayland
 	depends on !BR2_STATIC_LIBS # xwayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
+	depends on !BR2_RISCV_32 # xwayland -> xlib_libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xwayland -> xlib_libxshmfence
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -125,6 +127,8 @@ comment "XWayland support needs libepoxy and X.org enabled"
 
 comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_RISCV_32
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 # Weston needs at least one shell; this can be one of the bundled ones,
diff --git a/package/wlroots/Config.in b/package/wlroots/Config.in
index b2d3f3c3b1..fb23e9069c 100644
--- a/package/wlroots/Config.in
+++ b/package/wlroots/Config.in
@@ -47,6 +47,8 @@ config BR2_PACKAGE_WLROOTS_XWAYLAND
 	depends on BR2_USE_MMU # xwayland
 	depends on !BR2_STATIC_LIBS # xwayland
 	depends on BR2_TOOLCHAIN_HAS_THREADS # xwayland
+	depends on !BR2_RISCV_32 # xwayland -> xlib_libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xwayland -> xlib_libxshmfence
 	select BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XCB_UTIL_WM
 	select BR2_PACKAGE_XWAYLAND
@@ -58,6 +60,8 @@ comment "XWayland support needs X.org enabled"
 
 comment "XWayland support needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_RISCV_32
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
 
 endif
diff --git a/package/x11r7/xwayland/Config.in b/package/x11r7/xwayland/Config.in
index 4f14f2cc36..241ab73ad3 100644
--- a/package/x11r7/xwayland/Config.in
+++ b/package/x11r7/xwayland/Config.in
@@ -6,6 +6,8 @@ config BR2_PACKAGE_XWAYLAND
 	# We need a SHA1 implementation. If either openssl or
 	# libgcrypt are already part of the build, we'll use one of
 	# them, otherwise, use the small libsha1 library.
+	depends on !BR2_RISCV_32 # xlib_libxshmfence
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # xlib_libxshmfence
 	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
 	select BR2_PACKAGE_PIXMAN
 	select BR2_PACKAGE_WAYLAND
@@ -14,6 +16,7 @@ config BR2_PACKAGE_XWAYLAND
 	select BR2_PACKAGE_XLIB_LIBXFONT2
 	select BR2_PACKAGE_XLIB_LIBXKBFILE
 	select BR2_PACKAGE_XLIB_LIBXRANDR
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	select BR2_PACKAGE_XLIB_XTRANS
 	select BR2_PACKAGE_XORGPROTO
 	help
@@ -23,4 +26,6 @@ config BR2_PACKAGE_XWAYLAND
 
 comment "xwayland needs a toolchain w/ threads, dynamic library"
 	depends on BR2_USE_MMU
+	depends on !BR2_RISCV_32
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/x11r7/xwayland/xwayland.mk b/package/x11r7/xwayland/xwayland.mk
index 174b440b07..7aef1156d3 100644
--- a/package/x11r7/xwayland/xwayland.mk
+++ b/package/x11r7/xwayland/xwayland.mk
@@ -18,6 +18,7 @@ XWAYLAND_DEPENDENCIES = \
 	xlib_libXfont2 \
 	xlib_libxkbfile \
 	xlib_libXrandr \
+	xlib_libxshmfence \
 	xlib_xtrans \
 	xorgproto
 XWAYLAND_CONF_OPTS = \
@@ -77,9 +78,9 @@ XWAYLAND_CONF_OPTS += -Dsha1=libsha1
 XWAYLAND_DEPENDENCIES += libsha1
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXSHMFENCE)$(BR2_PACKAGE_LIBDRM),yy)
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
 XWAYLAND_CONF_OPTS += -Ddri3=true
-XWAYLAND_DEPENDENCIES += xlib_libxshmfence libdrm
+XWAYLAND_DEPENDENCIES +=  libdrm
 else
 XWAYLAND_CONF_OPTS += -Ddri3=false
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

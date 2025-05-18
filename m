Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D1C6C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:05:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A8C84A55;
	Mon, 19 May 2025 11:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nmvba2--grNj; Mon, 19 May 2025 11:05:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45DD784A50
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45DD784A50;
	Mon, 19 May 2025 11:05:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66547E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9B5242393
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5032zkAJakEe for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CBC2423C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4CBC2423C8
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 44AB882A2E; Mon, 19 May 2025 10:40:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 15:39:21 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 323aaa9f547f4925135874162f31323e88b0768f
X-Git-Newrev: 11dcd7bd5329608f85036dd65fe9c706c54ea8cb
X-Patchwork-Hint: ignore
Message-Id: <20250519104010.44AB882A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/webkitgtk: add libgtk4
 support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=11dcd7bd5329608f85036dd65fe9c706c54ea8cb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

WebKitGTK defaults on GTK4 since version 2.44 [1],
and the libgtk4 package was added in commit faf2a1d,
so start using it. Note that webkitgtk-6.0 is the new API
if compile with GTK4 [2].

[1] https://webkitgtk.org/2024/03/27/webkigit-2.44.html
[2] https://webkitgtk.org/reference/webkitgtk/stable/migrating-to-webkitgtk-6.0.html

Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/webkitgtk/Config.in    | 33 +++++++++++++++++++++++++--------
 package/webkitgtk/webkitgtk.mk | 21 +++++++++++++++++----
 2 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index bcb4b12fa3..7827dc6218 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -16,11 +16,12 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-comment "webkitgtk needs libgtk3 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
+comment "webkitgtk needs libgtk3 or libgtk4 and a toolchain w/ C++, wchar, NPTL, dynamic library, gcc >= 11, host gcc >= 4.9"
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on !BR2_BINFMT_FLAT
-	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
+	depends on (!BR2_PACKAGE_LIBGTK3 && !BR2_PACKAGE_LIBGTK4) || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_11 || \
 		!BR2_HOST_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
@@ -35,7 +36,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	depends on BR2_USE_WCHAR # icu, libsoup3
-	depends on BR2_PACKAGE_LIBGTK3
+	depends on BR2_PACKAGE_LIBGTK3 || BR2_PACKAGE_LIBGTK4
 	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
@@ -55,10 +56,10 @@ config BR2_PACKAGE_WEBKITGTK
 	select BR2_PACKAGE_WEBP_DEMUX
 	select BR2_PACKAGE_WEBP_MUX
 	select BR2_PACKAGE_WOFF2
-	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_LIBGTK3_X11
-	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_LIBGTK3_X11
-	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_LIBGTK3_X11
-	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_LIBGTK3_X11
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE if BR2_PACKAGE_WEBKITGTK_X11
+	select BR2_PACKAGE_XLIB_LIBXDAMAGE if BR2_PACKAGE_WEBKITGTK_X11
+	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_WEBKITGTK_X11
+	select BR2_PACKAGE_XLIB_LIBXT if BR2_PACKAGE_WEBKITGTK_X11
 	help
 	  WebKit is an open source, standards compliant web browser
 	  engine.
@@ -67,6 +68,22 @@ config BR2_PACKAGE_WEBKITGTK
 
 if BR2_PACKAGE_WEBKITGTK
 
+comment "webkitgtk X11 target needs the X11 GDK backend"
+	depends on !BR2_PACKAGE_LIBGTK3_X11 && !BR2_PACKAGE_LIBGTK4_X11
+
+config BR2_PACKAGE_WEBKITGTK_X11
+	bool "enable x11 target"
+	default y
+	depends on BR2_PACKAGE_LIBGTK3_X11 || BR2_PACKAGE_LIBGTK4_X11
+
+comment "webkitgtk Wayland target needs the Wayland GDK backend"
+	depends on !BR2_PACKAGE_LIBGTK3_WAYLAND && !BR2_PACKAGE_LIBGTK4_WAYLAND
+
+config BR2_PACKAGE_WEBKITGTK_WAYLAND
+	bool "enable wayland target"
+	default y
+	depends on BR2_PACKAGE_LIBGTK3_WAYLAND || BR2_PACKAGE_LIBGTK4_WAYLAND
+
 config BR2_PACKAGE_WEBKITGTK_SANDBOX
 	bool "sandboxing support"
 	depends on BR2_PACKAGE_LIBSECCOMP_ARCH_SUPPORTS # libseccomp
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 2c22bfb607..d139108126 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -14,7 +14,7 @@ WEBKITGTK_LICENSE_FILES = \
 	Source/WebCore/LICENSE-LGPL-2.1
 WEBKITGTK_CPE_ID_VENDOR = webkitgtk
 WEBKITGTK_DEPENDENCIES = host-ruby host-python3 host-gperf host-unifdef \
-	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libgtk3 libsecret \
+	enchant harfbuzz icu jpeg libegl libepoxy libgcrypt libsecret \
 	libsoup3 libtasn1 libxml2 libxslt sqlite webp woff2
 
 WEBKITGTK_CMAKE_BACKEND = ninja
@@ -28,12 +28,19 @@ WEBKITGTK_CONF_OPTS = \
 	-DENABLE_WEB_RTC=OFF \
 	-DPORT=GTK \
 	-DUSE_AVIF=OFF \
-	-DUSE_GTK4=OFF \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_SKIA=OFF \
 	-DUSE_SYSTEM_SYSPROF_CAPTURE=OFF \
 	-DUSE_WOFF2=ON
 
+ifeq ($(BR2_PACKAGE_LIBGTK4),y)
+WEBKITGTK_CONF_OPTS += -DUSE_GTK4=ON
+WEBKITGTK_DEPENDENCIES += libgtk4
+else
+WEBKITGTK_CONF_OPTS += -DUSE_GTK4=OFF
+WEBKITGTK_DEPENDENCIES += libgtk3
+endif
+
 ifeq ($(BR2_PACKAGE_WEBKITGTK_SANDBOX),y)
 WEBKITGTK_CONF_OPTS += \
 	-DENABLE_BUBBLEWRAP_SANDBOX=ON \
@@ -64,9 +71,15 @@ WEBKITGTK_CONF_OPTS += -DENABLE_WEBDRIVER=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_WEBKITGTK_MINIBROWSER),y)
+ifeq ($(BR2_PACKAGE_LIBGTK4),y)
+define WEBKITGTK_INSTALL_MINIBROWSER_SYMLINK
+	ln -sf ../libexec/webkitgtk-6.0/MiniBrowser $(TARGET_DIR)/usr/bin/MiniBrowser
+endef
+else
 define WEBKITGTK_INSTALL_MINIBROWSER_SYMLINK
 	ln -sf ../libexec/webkit2gtk-4.1/MiniBrowser $(TARGET_DIR)/usr/bin/MiniBrowser
 endef
+endif
 WEBKITGTK_POST_INSTALL_TARGET_HOOKS += WEBKITGTK_INSTALL_MINIBROWSER_SYMLINK
 WEBKITGTK_CONF_OPTS += -DENABLE_MINIBROWSER=ON
 else
@@ -129,7 +142,7 @@ else
 WEBKITGTK_CONF_OPTS += -DUSE_GBM=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
+ifeq ($(BR2_PACKAGE_WEBKITGTK_X11),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=ON
 WEBKITGTK_DEPENDENCIES += libgl \
 	xlib_libXcomposite xlib_libXdamage xlib_libXrender xlib_libXt
@@ -137,7 +150,7 @@ else
 WEBKITGTK_CONF_OPTS += -DENABLE_X11_TARGET=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LIBGTK3_WAYLAND),y)
+ifeq ($(BR2_PACKAGE_WEBKITGTK_WAYLAND),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=ON
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_WAYLAND_TARGET=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EE5C433F5
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:31:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE5A140428;
	Mon,  6 Dec 2021 18:31:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0XPZwN86gZ6; Mon,  6 Dec 2021 18:31:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65C11405F3;
	Mon,  6 Dec 2021 18:31:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4422C1BF983
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:13:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3862560D63
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MB7YH6liGrBr for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90F9360D69
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2D6C781503; Mon,  6 Dec 2021 18:07:42 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 22:09:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ebc0d88434174b58f32183d7f74dbd9149170eb7
X-Git-Newrev: 6861933d22006fbe8c961a41506beac826881f33
X-Patchwork-Hint: ignore
Message-Id: <20211206180742.2D6C781503@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/harfbuzz: bump to version 3.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=6861933d22006fbe8c961a41506beac826881f33
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump to version 3.1.2 by:
- requiring BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 instead of _4_8 in this
package taking care of reverse dependencies, since now harfbuzz requires
gcc 4.9 to be built successfully.
- local patch is still necessary since upstream harfbuzz points the problem
to meson itself.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cwiid/Config.in                        |  2 +-
 package/enlightenment/Config.in                |  6 +++---
 package/gstreamer1/gst1-plugins-bad/Config.in  | 12 ++++++------
 package/gstreamer1/gst1-plugins-base/Config.in |  6 +++---
 package/harfbuzz/Config.in                     |  6 +++---
 package/harfbuzz/harfbuzz.hash                 |  2 +-
 package/harfbuzz/harfbuzz.mk                   |  2 +-
 package/libass/Config.in                       |  6 +++---
 package/libfm/Config.in                        |  6 +++---
 package/libgtk2/Config.in                      |  6 +++---
 package/libgtk3/Config.in                      |  6 +++---
 package/librsvg/Config.in                      |  6 +++---
 package/mupdf/Config.in                        |  6 +++---
 package/openbox/Config.in                      |  6 +++---
 package/pango/Config.in                        |  6 +++---
 package/pcmanfm/Config.in                      |  6 +++---
 package/pinentry/Config.in                     |  6 +++---
 package/python-pymupdf/Config.in               |  6 +++---
 package/qt5/qt5base/Config.in                  |  2 +-
 package/rrdtool/Config.in                      |  6 +++---
 package/supertuxkart/Config.in                 |  2 +-
 package/xscreensaver/Config.in                 |  6 +++---
 22 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index e03248c722..6ae2ac9405 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -18,7 +18,7 @@ if BR2_PACKAGE_CWIID
 config BR2_PACKAGE_CWIID_WMGUI
 	bool "wmgui"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_PACKAGE_XORG7 # libgtk2
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index 91cdd896f6..cd2b8cfe54 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_PACKAGE_XORG7
 	# libevas-generic-loaders-svg -> librsvg -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
@@ -29,10 +29,10 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.8"
+comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index 1204a65681..d678e7eb14 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -328,13 +328,13 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 	bool "assrender"
 	depends on BR2_INSTALL_LIBSTDCPP # libass -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libass -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libass -> harfbuzz
 	select BR2_PACKAGE_LIBASS
 
-comment "assrender plugin needs a toolchain w/ C++, gcc => 4.8"
+comment "assrender plugin needs a toolchain w/ C++, gcc => 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ
 	bool "bluez"
@@ -563,15 +563,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # librsvg -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 	help
 	  RSVG plugin library
 
-comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.8"
+comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SBC
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index ceed55890c..7ca94d7dc4 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -293,14 +293,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	select BR2_PACKAGE_PANGO
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin needs a toolchain w/ C++, gcc >= 4.8"
+comment "pango plugin needs a toolchain w/ C++, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index 8bc88f4284..2e4219ee22 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_HARFBUZZ
 	bool "harfbuzz"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
@@ -11,7 +11,7 @@ config BR2_PACKAGE_HARFBUZZ
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
 
-comment "harfbuzz needs a toolchain w/ C++, gcc >= 4.8"
+comment "harfbuzz needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index 97fc5a2c5f..d5a376830a 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  036b0ee118451539783ec7864148bb4106be42a2eb964df4e83e6703ec46f3d9  harfbuzz-3.0.0.tar.xz
+sha256  4056b1541dd8bbd8ec29207fe30e568805c0705515632d7fec53a94399bc7945  harfbuzz-3.1.2.tar.xz
 sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 4534d166ef..97b28ce236 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 3.0.0
+HARFBUZZ_VERSION = 3.1.2
 HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
 HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
diff --git a/package/libass/Config.in b/package/libass/Config.in
index 803f6b4438..d7725d5e1b 100644
--- a/package/libass/Config.in
+++ b/package/libass/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBASS
 	bool "libass"
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_LIBFRIBIDI
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBASS
 
 	  https://github.com/libass/libass
 
-comment "libass needs a toolchain w/ C++, gcc >= 4.8"
+comment "libass needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index 16676fbf25..e78bc99b76 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBFM
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
@@ -22,9 +22,9 @@ config BR2_PACKAGE_LIBFM
 
 	  http://wiki.lxde.org/en/Libfm
 
-comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index 7c5762a585..c75c37fb63 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
@@ -34,10 +34,10 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 
 endif
 
-comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index 093aacac51..bc8cacd9f5 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -1,9 +1,9 @@
-comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "libgtk3 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
 
 comment "libgtk3 needs an OpenGL or an OpenGL-EGL/wayland backend"
@@ -20,7 +20,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_ATK
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 3272ecd773..270b524b37 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBRSVG
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_CAIRO_SCRIPT
@@ -21,10 +21,10 @@ config BR2_PACKAGE_LIBRSVG
 
 	  https://wiki.gnome.org/Projects/LibRsvg
 
-comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
index ff176f4b99..cf97711160 100644
--- a/package/mupdf/Config.in
+++ b/package/mupdf/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MUPDF
 	bool "mupdf"
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GUMBO_PARSER
@@ -18,7 +18,7 @@ config BR2_PACKAGE_MUPDF
 
 	  https://www.mupdf.com/index.html
 
-comment "mupdf needs a toolchain w/ C++, gcc >= 4.8"
+comment "mupdf needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/openbox/Config.in b/package/openbox/Config.in
index fe6e886865..e042ed2b48 100644
--- a/package/openbox/Config.in
+++ b/package/openbox/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_OPENBOX
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
@@ -20,10 +20,10 @@ config BR2_PACKAGE_OPENBOX
 
 	  http://openbox.org
 
-comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 4.8"
+comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/pango/Config.in b/package/pango/Config.in
index cf5170c8f3..e2b2e7fe2b 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_PANGO
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_EXPAT
@@ -24,9 +24,9 @@ config BR2_PACKAGE_PANGO
 
 	  https://pango.gnome.org/
 
-comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index f281599637..73b8c7c04c 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBFM
 	select BR2_PACKAGE_MENU_CACHE
 	select BR2_PACKAGE_LIBGLIB2
@@ -18,10 +18,10 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 684e4eed4a..3f005f8c58 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -54,17 +54,17 @@ config BR2_PACKAGE_PINENTRY_GTK2
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The pinentry-gtk2 tool
 
-comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PINENTRY_QT5
diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
index 65221d3e51..0ecb288922 100644
--- a/package/python-pymupdf/Config.in
+++ b/package/python-pymupdf/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	bool "python-pymupdf"
 	depends on BR2_INSTALL_LIBSTDCPP # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # mupdf -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # mupdf -> harfbuzz
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_FREETYPE
@@ -18,8 +18,8 @@ comment "python-pymupdf needs Xorg"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_XORG7
 
-comment "python-pymupdf needs a toolchain w/ C++, gcc >= 4.8"
+comment "python-pymupdf needs a toolchain w/ C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index e93b2dec38..a328190a98 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -237,7 +237,7 @@ config BR2_PACKAGE_QT5BASE_HARFBUZZ
 	bool "harfbuzz support"
 	select BR2_PACKAGE_HARFBUZZ if \
 		BR2_TOOLCHAIN_HAS_SYNC_4 && \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  This option enables HarfBuzz support (either system harfbuzz
 	  if the toolchain supports __sync for 4 bytes, or the qt
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index 5451353140..5ffdc92618 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	bool "rrd_graph"
 	default y
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PDF
@@ -28,9 +28,9 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	  This enables the graphing capabilities ('rrdgraph').
 	  Without this it will only act as a database backend.
 
-comment "rrd_graph support needs a toolchain w/ C++, gcc >= 4.8"
+comment "rrd_graph support needs a toolchain w/ C++, gcc >= 4.9"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 endif
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index 8af006d632..a18b9c1a0a 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz, openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
 	depends on BR2_PACKAGE_HAS_LIBGL
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index d773c69913..787c3130ae 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_USE_WCHAR # gdk-pixbuf, libgtk2 -> glib2
 	depends on BR2_USE_MMU # gdk-pixbuf, libgtk2 -> glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGTK2
@@ -25,10 +25,10 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.8"
+comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

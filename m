Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CB7CCFA1A
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 17:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C06460855;
	Sun,  9 Nov 2025 17:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pwf3m8sAkrRC; Sun,  9 Nov 2025 17:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E895D6084F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E895D6084F;
	Sun,  9 Nov 2025 17:35:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 648DE25D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40E0C81186
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:35:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOmiR0O5TFx2 for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 17:35:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C9A38117C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C9A38117C
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 17:35:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0619384008; Sun,  9 Nov 2025 17:35:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Nov 2025 18:18:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7085d1c48b55b2ff85e82be35a8a6a22755e9758
X-Git-Newrev: 34a03bdba426a22c7efbbf33b68e836a88ab1740
X-Patchwork-Hint: ignore
Message-Id: <20251109173540.0619384008@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xscreensaver: bump version to 6.12
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

commit: https://git.buildroot.net/buildroot/commit/?id=34a03bdba426a22c7efbbf33b68e836a88ab1740
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Added two patches from Debian to fix configure errors.

Switched from libgtk2 to libgtk3 and adjusted dependencies.
Added dependency to libxcrypt.

Fixed broken include path for gl.h, inspired by Gentoo:
https://gitweb.gentoo.org/repo/gentoo.git/tree/x11-misc/xscreensaver/xscreensaver-6.12-r2.ebuild#n172

Removed dependency to gdk-pixbuf-xlib, not needed since version 6.05:
https://gitweb.gentoo.org/repo/gentoo.git/commit/x11-misc/xscreensaver?id=3d6bc3a216196c795de6e0932f74055548beb9bb

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: replace the sed substitute separator with '%']
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-allow_unrecognized_conf_opts.patch        | 28 +++++++++++++++++
 .../0002-configure_allow_warnings.patch            | 35 ++++++++++++++++++++++
 package/xscreensaver/Config.in                     | 18 ++++++-----
 package/xscreensaver/xscreensaver.hash             |  2 +-
 package/xscreensaver/xscreensaver.mk               | 14 +++++++--
 5 files changed, 85 insertions(+), 12 deletions(-)

diff --git a/package/xscreensaver/0001-allow_unrecognized_conf_opts.patch b/package/xscreensaver/0001-allow_unrecognized_conf_opts.patch
new file mode 100644
index 0000000000..d9e9367d05
--- /dev/null
+++ b/package/xscreensaver/0001-allow_unrecognized_conf_opts.patch
@@ -0,0 +1,28 @@
+Description: Allow unrecognized configure options
+ Fix an oddity in upstream-generated configure.
+ Our dh_auto_configure will add several unrecognized options.
+Forwarded: not-needed
+Author: Tormod Volden <debian.tormod@gmail.com>
+
+Downloaded from
+https://sources.debian.org/data/main/x/xscreensaver/6.09%2Bdfsg1-1/debian/patches/94_allow_unrecognized_conf_opts.patch
+
+Upstream: not applicable
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: xscreensaver-git/configure
+===================================================================
+--- xscreensaver-git.orig/configure
++++ xscreensaver-git/configure
+@@ -2856,8 +2856,8 @@ echo "current directory: `pwd`"
+ echo "command line was: $0 $@"
+ 
+ if ! test -z "$ac_unrecognized_opts" ; then
+-  echo "" >&2
+-  exit 2
++  echo "ignored options $ac_unrecognized_opts" >&2
++  #exit 2
+ fi
+ 
+ ###############################################################################
diff --git a/package/xscreensaver/0002-configure_allow_warnings.patch b/package/xscreensaver/0002-configure_allow_warnings.patch
new file mode 100644
index 0000000000..bd9a47207f
--- /dev/null
+++ b/package/xscreensaver/0002-configure_allow_warnings.patch
@@ -0,0 +1,35 @@
+Description: Allow warnings from configure
+ Since 6.03 the original configure script returns non-zero if a
+ warning about configuration options versus detected capabilities
+ has been issued, presumably to increase awareness of the warnings.
+ To allow building on all architectures, while relying on the
+ resulting HAVE_XX flags as usual, return with success at the end
+ of the script.
+Forwarded: not-needed
+Author: Tormod Volden <debian.tormod@gmail.com>
+
+Downloaded from
+https://sources.debian.org/src/xscreensaver/6.09%2Bdfsg1-1/debian/patches/100_configure_allow_warnings.patch
+
+Upstream: not applicable
+
+[Bernd: s/Debian/buildroot]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+Index: xscreensaver-git/configure
+===================================================================
+--- xscreensaver-git.orig/configure
++++ xscreensaver-git/configure
+@@ -23273,5 +23273,11 @@ echo "             Extra Fonts:   ${FONT
+ echo "             App Defaults:  ${APPDEFAULTS}/$addir_err"
+ echo ""
+ 
+-exit $CONF_STATUS
++if test "$CONF_STATUS" != 0; then
++	echo ""
++	echo "Warning: Buildroot build will proceed regardless of above warnings"
++	echo ""
++fi
++
++exit 0
+ 
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index ba259274d1..2bed8f4765 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -2,16 +2,17 @@ config BR2_PACKAGE_XSCREENSAVER
 	bool "xscreensaver"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_HAS_LIBGL # libglu
-	depends on BR2_INSTALL_LIBSTDCPP # libgtk2 -> pango
-	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf, libgtk2 -> glib2
-	depends on BR2_USE_WCHAR # gdk-pixbuf, libgtk2 -> glib2
-	depends on BR2_USE_MMU # gdk-pixbuf, libgtk2 -> glib2
-	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # libgtk3
+	depends on BR2_USE_WCHAR # libgtk3, libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk3, libglib2
+	depends on BR2_USE_MMU # libgtk3, libglib2
+	depends on BR2_INSTALL_LIBSTDCPP # libgtk3
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk3
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk3
 	select BR2_PACKAGE_GDK_PIXBUF
-	select BR2_PACKAGE_GDK_PIXBUF_XLIB
 	select BR2_PACKAGE_LIBGLU
-	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_LIBGTK3
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_XLIB_LIBX11
@@ -31,6 +32,7 @@ config BR2_PACKAGE_XSCREENSAVER
 
 comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9, OpenGL backend"
 	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
diff --git a/package/xscreensaver/xscreensaver.hash b/package/xscreensaver/xscreensaver.hash
index 27ef7d8f00..b8a27a0515 100644
--- a/package/xscreensaver/xscreensaver.hash
+++ b/package/xscreensaver/xscreensaver.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  328d51797352acf58ca5bab49e76fbf26034e7cad785f651ea11ce7b43fba25a  xscreensaver-6.03.tar.gz
+sha256  4ff6798217e3bbbc3c7336beeda7e83eafbf03301ac29b2236da66a0f1317643  xscreensaver-6.12.tar.gz
 sha256  8a03451ba5c4c9af669b53e47e50c38c149b9e152d3d627809b962da7b760bbd  hacks/screenhack.h
 sha256  56db580415bb313a4a82c5e08f106304904d15d42faf8e6ab14b34e14e2087a5  hacks/glx/chessmodels.h
diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 466d309940..f9e28e4551 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSCREENSAVER_VERSION = 6.03
+XSCREENSAVER_VERSION = 6.12
 XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 
 # N.B. GPL-2.0+ code (in the hacks/glx subdirectory) is not currently built.
@@ -13,13 +13,17 @@ XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 XSCREENSAVER_CPE_ID_VALID = YES
 XSCREENSAVER_SELINUX_MODULES = xdg xscreensaver xserver
 
+define XSCREENSAVER_FIX_INCLUDE_GL
+	$(SED) 's%OpenGL/gl.h%GL/gl.h%' $(@D)/driver/subprocs.c
+endef
+XSCREENSAVER_POST_EXTRACT_HOOKS = XSCREENSAVER_FIX_INCLUDE_GL
+
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
-	gdk-pixbuf-xlib \
 	jpeg \
 	libgl \
 	libglu \
-	libgtk2 \
+	libgtk3 \
 	libxml2 \
 	xlib_libX11 \
 	xlib_libXft \
@@ -42,6 +46,10 @@ else
 XSCREENSAVER_CONF_OPTS += --with-png=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+XSCREENSAVER_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 XSCREENSAVER_CONF_OPTS += --with-systemd=yes
 XSCREENSAVER_DEPENDENCIES += systemd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

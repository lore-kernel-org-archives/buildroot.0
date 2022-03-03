Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AA7EC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Mar 2022 22:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 272FD409DC;
	Thu,  3 Mar 2022 22:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IvxInNgTm0bR; Thu,  3 Mar 2022 22:10:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F20C840363;
	Thu,  3 Mar 2022 22:10:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 534A71C1135
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 22:10:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EFAC83FB6
 for <buildroot@lists.busybox.net>; Thu,  3 Mar 2022 22:10:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Rxf0-Mp253Lf for <buildroot@lists.busybox.net>;
 Thu,  3 Mar 2022 22:10:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8152B83F25
 for <buildroot@buildroot.org>; Thu,  3 Mar 2022 22:10:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B764C819DE; Thu,  3 Mar 2022 22:02:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 3 Mar 2022 23:03:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5dc3cfbff11934a3b29f8b2b98aed22ec01e7c42
X-Git-Newrev: 559df4ef2888efda8a0142a9b61a1206e6ab0fff
X-Patchwork-Hint: ignore
Message-Id: <20220303220221.B764C819DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gdk-pixbuf-xlib: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=559df4ef2888efda8a0142a9b61a1206e6ab0fff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Deprecated Xlib integration for GdkPixbuf.

gdk-pixbuf-xlib has been deprecated and split off of gdk-pixbuf since
version 2.42.0 and
https://gitlab.gnome.org/GNOME/gdk-pixbuf/-/commit/3362e94c2595440f322798dc4d15f1ed24a4c52c
resulting in the following "hidden" warnings with xscreensaver since
commit a7b51ed3013c919b293deb95299e33363fb9df70:

   Warning: GTK version 2.24.33 was found, but at least one supporting
            library (gdk-pixbuf-xlib-2.0) was not, so GTK can't be used.
            Perhaps some of the development packages are not installed?

   Warning: The GTK libraries do not seem to be available; the
            `xscreensaver-demo' program requires them.

   Warning: The GDK-Pixbuf library was not found.

            The PNG library is being used instead.

            Some of the demos will not use images as much as they could.
            You should consider installing GDK-Pixbuf and re-running
            configure.

https://gitlab.gnome.org/Archive/gdk-pixbuf-xlib

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/gdk-pixbuf-xlib/Config.in            | 17 +++++++++++++++++
 package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash |  5 +++++
 package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk   | 16 ++++++++++++++++
 5 files changed, 40 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index ac702d8d0f..b7a7c8771c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -877,6 +877,7 @@ F:	package/duktape/
 F:	package/expat/
 F:	package/flatbuffers/
 F:	package/freeipmi/
+F:	package/gdk-pixbuf-xlib/
 F:	package/gerbera/
 F:	package/gtksourceview/
 F:	package/gssdp/
diff --git a/package/Config.in b/package/Config.in
index 10209d84d7..8d2d550a64 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1492,6 +1492,7 @@ menu "Graphics"
 	source "package/freetype/Config.in"
 	source "package/gd/Config.in"
 	source "package/gdk-pixbuf/Config.in"
+	source "package/gdk-pixbuf-xlib/Config.in"
 	source "package/giblib/Config.in"
 	source "package/giflib/Config.in"
 	source "package/granite/Config.in"
diff --git a/package/gdk-pixbuf-xlib/Config.in b/package/gdk-pixbuf-xlib/Config.in
new file mode 100644
index 0000000000..2efc5d4d66
--- /dev/null
+++ b/package/gdk-pixbuf-xlib/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GDK_PIXBUF_XLIB
+	bool "gdk-pixbuf-xlib"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU # gdk-pixbuf -> glib2
+	depends on BR2_USE_WCHAR # gdk-pixbuf -> glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # gdk-pixbuf -> glib2
+	select BR2_PACKAGE_GDK_PIXBUF
+	select BR2_PACKAGE_XLIB_LIBX11
+	help
+	  Deprecated Xlib integration for GdkPixbuf.
+
+	  https://gitlab.gnome.org/Archive/gdk-pixbuf-xlib
+
+comment "gdk-pixbuf-xlib needs a toolchain w/ wchar, threads"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
new file mode 100644
index 0000000000..e7f74e2b4b
--- /dev/null
+++ b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.hash
@@ -0,0 +1,5 @@
+# From https://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf-xlib/2.40/gdk-pixbuf-xlib-2.40.2.sha256sum
+sha256  8b8e1c270ec16a06f665ea841f8e4e167eaa0118d0cbfeeade43745f09198ff7  gdk-pixbuf-xlib-2.40.2.tar.xz
+
+# Hash for license file
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk
new file mode 100644
index 0000000000..3e61373b3a
--- /dev/null
+++ b/package/gdk-pixbuf-xlib/gdk-pixbuf-xlib.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# gdk-pixbuf-xlib
+#
+################################################################################
+
+GDK_PIXBUF_XLIB_VERSION_MAJOR = 2.40
+GDK_PIXBUF_XLIB_VERSION = $(GDK_PIXBUF_XLIB_VERSION_MAJOR).2
+GDK_PIXBUF_XLIB_SOURCE = gdk-pixbuf-xlib-$(GDK_PIXBUF_XLIB_VERSION).tar.xz
+GDK_PIXBUF_XLIB_SITE = http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf-xlib/$(GDK_PIXBUF_XLIB_VERSION_MAJOR)
+GDK_PIXBUF_XLIB_LICENSE = LGPL-2.1+
+GDK_PIXBUF_XLIB_LICENSE_FILES = COPYING
+GDK_PIXBUF_XLIB_INSTALL_STAGING = YES
+GDK_PIXBUF_XLIB_DEPENDENCIES = gdk-pixbuf xlib_libX11
+
+$(eval $(meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

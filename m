Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0BDC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 21:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D862240114;
	Tue, 26 Dec 2023 21:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D862240114
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S6LufxAOnEUJ; Tue, 26 Dec 2023 21:38:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3804409DD;
	Tue, 26 Dec 2023 21:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3804409DD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE761BF36A
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DB60E60F8C
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 21:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DB60E60F8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dtEE7e1-5WRQ for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 21:38:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D19B660B1E
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 21:38:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D19B660B1E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BBE06805F1; Tue, 26 Dec 2023 21:38:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 22:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d8c7aecbb28f1703b8eec1ffb6f555c1b422b31
X-Git-Newrev: f93380ab1a36bdd019cfbc651a9df5904096e189
X-Patchwork-Hint: ignore
Message-Id: <20231226213852.BBE06805F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gmpc: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=f93380ab1a36bdd019cfbc651a9df5904096e189
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is unmaintained upstream:

- The URL in our Config.in,
  http://gmpcwiki.sarine.nl/index.php?title=GMPC, no longer works

- https://github.com/DaveDavenport/gmpc says it's unmaintained

- The official lists of MPD clients at
  https://www.musicpd.org/clients/ says it's maintained, and points at
  http://gmpclient.org/, which is no longer owned by the developers of
  GMPC.

- It still uses libsoup (2) which we want to get rid of at some
  point.

- It was added by Gustavo Zacarias, and no version bumped occurred
  since 2011.

So let's kill this package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy       |  7 +++++++
 package/Config.in      |  1 -
 package/gmpc/Config.in | 26 --------------------------
 package/gmpc/gmpc.hash |  3 ---
 package/gmpc/gmpc.mk   | 18 ------------------
 5 files changed, 7 insertions(+), 48 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e5822eec24..58b40e5bac 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2023.11"
 
+config BR2_PACKAGE_GMPC
+	bool "gmpc package was removed"
+	select BR2_LEGACY
+	help
+	  The gmpc package was removed because it was unmaintained,
+	  and still using the old libsoup2 library.
+
 config BR2_PACKAGE_FLICKCURL
 	bool "flickcurl package was removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 14af880cb8..c7debd6f10 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -405,7 +405,6 @@ comment "X applications"
 	source "package/dillo/Config.in"
 	source "package/docker/Config.in"
 	source "package/feh/Config.in"
-	source "package/gmpc/Config.in"
 	source "package/gtkperf/Config.in"
 	source "package/leafpad/Config.in"
 	source "package/mupdf/Config.in"
diff --git a/package/gmpc/Config.in b/package/gmpc/Config.in
deleted file mode 100644
index 1aa74251f0..0000000000
--- a/package/gmpc/Config.in
+++ /dev/null
@@ -1,26 +0,0 @@
-config BR2_PACKAGE_GMPC
-	bool "gmpc"
-	depends on BR2_PACKAGE_LIBGTK2
-	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
-	depends on BR2_USE_MMU # glib2
-	depends on BR2_PACKAGE_XORG7
-	select BR2_PACKAGE_LIBGLIB2
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
-	select BR2_PACKAGE_LIBMPD
-	select BR2_PACKAGE_LIBSOUP
-	select BR2_PACKAGE_LIBXML2
-	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_XLIB_LIBICE
-	select BR2_PACKAGE_XLIB_LIBSM
-	select BR2_PACKAGE_XLIB_LIBX11
-	help
-	  Gnome Music Player Client is a GNOME/GTK2.2 client for
-	  Music Player Daemon.
-
-	  http://gmpcwiki.sarine.nl/index.php?title=GMPC
-
-comment "gmpc needs a toolchain w/ wchar, threads"
-	depends on BR2_USE_MMU
-	depends on BR2_PACKAGE_XORG7 && BR2_PACKAGE_LIBGTK2
-	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gmpc/gmpc.hash b/package/gmpc/gmpc.hash
deleted file mode 100644
index 66de8b6226..0000000000
--- a/package/gmpc/gmpc.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256  a69414f35396846733632ca9619921d7acda537ffd6d49bd84b444945cb76b2c  gmpc-11.8.16.tar.gz
-sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/gmpc/gmpc.mk b/package/gmpc/gmpc.mk
deleted file mode 100644
index 40b77eb189..0000000000
--- a/package/gmpc/gmpc.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# gmpc
-#
-################################################################################
-
-GMPC_VERSION = 11.8.16
-GMPC_SITE = http://download.sarine.nl/Programs/gmpc/$(GMPC_VERSION)
-GMPC_CONF_ENV = ac_cv_path_GOB2=$(GOB2_HOST_BINARY)
-GMPC_CONF_OPTS = --disable-mmkeys --disable-unique
-GMPC_LICENSE = GPL-2.0+
-GMPC_LICENSE_FILES = COPYING
-GMPC_DEPENDENCIES = host-gob2 host-intltool host-pkgconf host-vala \
-	libglib2 libgtk2 libmpd libsoup sqlite \
-	xlib_libICE xlib_libSM xlib_libX11 \
-	$(TARGET_NLS_DEPENDENCIES)
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

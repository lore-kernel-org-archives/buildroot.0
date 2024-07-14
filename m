Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E4EC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CAC94010D;
	Sun, 14 Jul 2024 16:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SHpf27Xpgms; Sun, 14 Jul 2024 16:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6CD540242
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C6CD540242;
	Sun, 14 Jul 2024 16:51:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80B1D1BF32B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:51:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7AE10605BA
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:51:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCqWKVfhk6yT for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:51:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76A85605AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76A85605AF
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:51:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6B19586794; Sun, 14 Jul 2024 16:51:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Jul 2024 18:50:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7dcc56a50c35c9397b369678834a9d31c3b500ee
X-Git-Newrev: fab48302865e5c0c98d91b696bc90e75e38189bb
X-Patchwork-Hint: ignore
Message-Id: <20240714165113.6B19586794@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gtkiostream: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fab48302865e5c0c98d91b696bc90e75e38189bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package provides many useful software engineering and signal
processing libraries.

Signed-off-by: Matt Flax <flatmax@flatmax.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  4 ++
 package/Config.in                                  |  1 +
 ...-configure.ac-add-option-to-disable-tests.patch | 54 +++++++++++++++++
 package/gtkiostream/Config.in                      | 17 ++++++
 package/gtkiostream/gtkiostream.hash               |  3 +
 package/gtkiostream/gtkiostream.mk                 | 68 ++++++++++++++++++++++
 6 files changed, 147 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 466dcd4826..e3804db1cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -201,6 +201,7 @@ F:	package/cups-filters/
 F:	package/cutekeyboard/
 F:	package/fail2ban/
 F:	package/grep/
+F:	package/gtkiostream/
 F:	package/htpdate/
 F:	package/i2c-tools/
 F:	package/jq/
@@ -2241,6 +2242,9 @@ N:	Masahiro Yamada <yamada.masahiro@socionext.com>
 F:	board/arm/foundation-v8/
 F:	configs/arm_foundationv8_defconfig
 
+N:	Matt Flax <flatmax@flatmax.org>
+F:	package/gtkiostream/
+
 N:	Matt Silva <dev@matt-silva.com>
 F:	package/rlwrap/
 
diff --git a/package/Config.in b/package/Config.in
index c40dc34ae7..f42762140a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1478,6 +1478,7 @@ menu "Audio/Sound"
 	source "package/bcg729/Config.in"
 	source "package/caps/Config.in"
 	source "package/fdk-aac/Config.in"
+	source "package/gtkiostream/Config.in"
 	source "package/libao/Config.in"
 	source "package/libbroadvoice/Config.in"
 	source "package/libcanberra/Config.in"
diff --git a/package/gtkiostream/0001-configure.ac-add-option-to-disable-tests.patch b/package/gtkiostream/0001-configure.ac-add-option-to-disable-tests.patch
new file mode 100644
index 0000000000..4c7fb6010f
--- /dev/null
+++ b/package/gtkiostream/0001-configure.ac-add-option-to-disable-tests.patch
@@ -0,0 +1,54 @@
+From 864d67d5cb4334f106c1ae055f0260b44f0dbb3b Mon Sep 17 00:00:00 2001
+From: Angelo Compagnucci <angelo@amarulasolutions.com>
+Date: Wed, 8 Feb 2023 10:58:20 +0100
+Subject: [PATCH] configure.ac: add option to disable tests
+
+This commit adds an option that allows to disable building tests,
+which are not useful in some situations.
+
+Upstream: https://github.com/flatmax/gtkiostream/pull/25
+Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
+[Thomas: improved with a configuration option]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+---
+ Makefile.am  | 7 ++++++-
+ configure.ac | 5 +++++
+ 2 files changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile.am b/Makefile.am
+index 3cc0944..cd5d9e4 100644
+--- a/Makefile.am
++++ b/Makefile.am
+@@ -20,7 +20,12 @@ AUTOMAKE_OPTIONS = foreign subdir-objects
+ SUBDIRS = src api include
+ 
+ if !HAVE_EMSCRIPTEN
+-SUBDIRS += applications test
++SUBDIRS += applications
++
++if HAVE_TESTS
++SUBDIRS += test
++endif
++
+ endif
+ 
+ ACLOCAL_AMFLAGS = -I m4
+diff --git a/configure.ac b/configure.ac
+index 4557858..7950bf2 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -68,6 +68,11 @@ fi
+ # Checks for documentation
+ AM_CONDITIONAL([HAVE_DOXYGEN],[test -n "$DOXYGEN"])AM_COND_IF([HAVE_DOXYGEN], [AC_CONFIG_FILES([api/Doxyfile])])
+ 
++AC_ARG_ENABLE(tests, AS_HELP_STRING([--disable-tests],
++	      [Disable tests (default: enabled)]),
++	      [TESTS=$enableval], [TESTS=yes])
++AM_CONDITIONAL([HAVE_TESTS],[test "x$TESTS" = xyes])
++
+ #check whether this is a cygwin system
+ AM_CONDITIONAL(CYGWIN, test "$build_os" = "cygwin")
+ 
+-- 
+2.45.2
+
diff --git a/package/gtkiostream/Config.in b/package/gtkiostream/Config.in
new file mode 100644
index 0000000000..17480b8ff8
--- /dev/null
+++ b/package/gtkiostream/Config.in
@@ -0,0 +1,17 @@
+config BR2_PACKAGE_GTKIOSTREAM
+	bool "gtkiostream"
+	depends on BR2_INSTALL_LIBSTDCPP # eigen
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_EIGEN
+	select BR2_PACKAGE_FFTW
+	select BR2_PACKAGE_FFTW_DOUBLE
+	select BR2_PACKAGE_FFTW_SINGLE
+	help
+	  This package provides many useful software engineering and
+	  signal processing includes and linkable library.
+
+	  https://github.com/flatmax/gtkiostream
+
+comment "gtkiostream needs a toolchain w/ C++, threads"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/gtkiostream/gtkiostream.hash b/package/gtkiostream/gtkiostream.hash
new file mode 100644
index 0000000000..90c754f48c
--- /dev/null
+++ b/package/gtkiostream/gtkiostream.hash
@@ -0,0 +1,3 @@
+# locally computed hash
+sha256  44e8d921d462005cd330a1c24e5bd8061175b90ae53f537dbf73f59b74f6e01b  gtkiostream-v1.8.0.tar.gz
+sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  gpl.txt
diff --git a/package/gtkiostream/gtkiostream.mk b/package/gtkiostream/gtkiostream.mk
new file mode 100644
index 0000000000..36905d7e7d
--- /dev/null
+++ b/package/gtkiostream/gtkiostream.mk
@@ -0,0 +1,68 @@
+################################################################################
+#
+# GTKIOSTREAM
+#
+################################################################################
+
+GTKIOSTREAM_VERSION = v1.8.0
+GTKIOSTREAM_SITE = $(call github,flatmax,gtkiostream,$(GTKIOSTREAM_VERSION))
+GTKIOSTREAM_LICENSE = GPL-2.0+
+GTKIOSTREAM_LICENSE_FILES = gpl.txt
+
+# configure script not available
+GTKIOSTREAM_AUTORECONF = YES
+
+GTKIOSTREAM_DEPENDENCIES = \
+	eigen \
+	fftw-double \
+	fftw-single \
+	host-pkgconf
+
+GTKIOSTREAM_CONF_OPTS = \
+	--disable-tests \
+	$(if $(BR2_TOOLCHAIN_HAS_OPENMP),--disable,--enable)-openmp
+
+ifeq ($(BR2_PACKAGE_OCTAVE),y)
+GTKIOSTREAM_DEPENDENCIES += octave
+GTKIOSTREAM_CONF_OPTS += --enable-octave
+else
+GTKIOSTREAM_CONF_OPTS += --disable-octave
+endif
+
+# For the optional packages below, there's unfortunately no
+# ./configure option to explicitly enable/disable them. They are
+# checked by the ./configure script using pkg-config.
+
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+GTKIOSTREAM_DEPENDENCIES += alsa-lib
+endif
+
+ifeq ($(BR2_PACKAGE_JACK2),y)
+GTKIOSTREAM_DEPENDENCIES += jack2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
+GTKIOSTREAM_DEPENDENCIES += libglib2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK2),y)
+GTKIOSTREAM_DEPENDENCIES += libgtk2
+endif
+
+ifeq ($(BR2_PACKAGE_LIBGTK3),y)
+GTKIOSTREAM_DEPENDENCIES += libgtk3
+endif
+
+ifeq ($(BR2_PACKAGE_LIBWEBSOCKETS),y)
+GTKIOSTREAM_DEPENDENCIES += libwebsockets
+endif
+
+ifeq ($(BR2_PACKAGE_OPENCV3),y)
+GTKIOSTREAM_DEPENDENCIES += opencv3
+endif
+
+ifeq ($(BR2_PACKAGE_SOX),y)
+GTKIOSTREAM_DEPENDENCIES += sox
+endif
+
+$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

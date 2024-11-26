Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93415E7717F
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76319607DD;
	Sun,  8 Dec 2024 13:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pNqvTsAwGuwk; Sun,  8 Dec 2024 13:08:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7D196085D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7D196085D;
	Sun,  8 Dec 2024 13:08:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0587D979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A6F260731
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id urSujFJ7O-oD for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E669C606F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E669C606F1
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E325E86B73; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 26 Nov 2024 19:34:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d0a21056dac1d248d3e05c5dc7335f7d8896ecfd
X-Git-Newrev: 20b240a9a25f5b734bd65894b714658334bd2148
X-Patchwork-Hint: ignore
Message-Id: <20241208130652.E325E86B73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libhid: drop package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=20b240a9a25f5b734bd65894b714658334bd2148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream location has been dead for 10 years and hidapi is a better
alternative nowadays, so drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  3 ---
 Config.in.legacy                                   |  8 ++++++
 package/Config.in                                  |  1 -
 .../libhid/0001-dont-fiddle-with-debug-flags.patch | 19 --------------
 package/libhid/0002-no-newline-in-ldflags.patch    | 22 ----------------
 package/libhid/0003-uclinux.patch                  | 29 ----------------------
 package/libhid/Config.in                           | 14 -----------
 package/libhid/libhid.hash                         |  3 ---
 package/libhid/libhid.mk                           | 23 -----------------
 9 files changed, 8 insertions(+), 114 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 45fb516137..281db108d3 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -682,9 +682,6 @@ package/libgsm/0001-Misc-fixes-from-Archlinux.patch lib_patch.Upstream
 package/libgtk2/0001-reduce-dependencies.patch lib_patch.Upstream
 package/libgtk3/0001-Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch lib_patch.Upstream
 package/libhdhomerun/0001-dont-strip.patch lib_patch.Upstream
-package/libhid/0001-dont-fiddle-with-debug-flags.patch lib_patch.Upstream
-package/libhid/0002-no-newline-in-ldflags.patch lib_patch.Upstream
-package/libhid/0003-uclinux.patch lib_patch.Upstream
 package/libical/0001-no-tests.patch lib_patch.Upstream
 package/libical/0002-icaltypes-c-icalreqstattype_from_string-copy-the-reqstattype.patch lib_patch.Upstream
 package/libiio/S99iiod Shellcheck lib_sysv.Variables
diff --git a/Config.in.legacy b/Config.in.legacy
index aa10573c23..3636228440 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_PACKAGE_LIBHID
+	bool "libhid has been removed"
+	select BR2_LEGACY
+	help
+	  The libhid package was removed as it is not maintained
+	  anymore and the upstream URL is gone. Consider using hidapi
+	  instead.
+
 config BR2_PACKAGE_QUAGGA
 	bool "quagga has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 83fc6c906d..d9af39b900 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1822,7 +1822,6 @@ menu "Hardware handling"
 	source "package/libgpiod/Config.in"
 	source "package/libgpiod2/Config.in"
 	source "package/libgudev/Config.in"
-	source "package/libhid/Config.in"
 	source "package/libiio/Config.in"
 	source "package/libinput/Config.in"
 	source "package/libiqrf/Config.in"
diff --git a/package/libhid/0001-dont-fiddle-with-debug-flags.patch b/package/libhid/0001-dont-fiddle-with-debug-flags.patch
deleted file mode 100644
index 44a172877a..0000000000
--- a/package/libhid/0001-dont-fiddle-with-debug-flags.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-MD_CONF_DEBUGGING changes CFLAGS and CXXFLAGS with a horrible magic so disable
-it to prevent compilation errors.
-
-downloaded from
-http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/dev-libs/libhid/files/libhid-0.2.16-gentoo.patch?revision=1.1&view=markup
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-
-diff -uNr libhid-0.2.16.org/configure.ac libhid-0.2.16/configure.ac
---- libhid-0.2.16.org/configure.ac	2007-04-01 22:32:10.000000000 +0200
-+++ libhid-0.2.16/configure.ac	2014-10-19 21:31:00.550091947 +0200
-@@ -78,7 +78,6 @@
- AC_C_BIGENDIAN
- AC_C_STRINGIZE
- 
--MD_CONF_DEBUGGING
- MD_CONF_COMPILER
- AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "linux")
- AM_CONDITIONAL(OS_BSD, test "$MD_OS" = "bsd")
diff --git a/package/libhid/0002-no-newline-in-ldflags.patch b/package/libhid/0002-no-newline-in-ldflags.patch
deleted file mode 100644
index df845ee1f5..0000000000
--- a/package/libhid/0002-no-newline-in-ldflags.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fix improper usage of macro that introduces a wrong newline
-
-The MD_CONF_FLAGS() macro was used with a final newline that
-introduces an invalid newline in the middle of the macro expansion
-when defining LDFLAGS.
-
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-
-Index: libhid-0.2.16/configure.ac
-===================================================================
---- libhid-0.2.16.orig/configure.ac	2007-04-01 22:32:10.000000000 +0200
-+++ libhid-0.2.16/configure.ac	2012-12-12 20:24:03.000000000 +0100
-@@ -102,8 +102,7 @@
-   [],
-   [$OS_CFLAGS $LIBUSB_CFLAGS],
-   [],
--  [$OS_LDFLAGS $LIBUSB_LIBS]
--)
-+  [$OS_LDFLAGS $LIBUSB_LIBS])
- 
- MD_CONF_DB2MAN
- 
diff --git a/package/libhid/0003-uclinux.patch b/package/libhid/0003-uclinux.patch
deleted file mode 100644
index 9f4502ada9..0000000000
--- a/package/libhid/0003-uclinux.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Good old 'uclinux is also linux'
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-[Dario: make the patch to be applied with fuzz factor 0]
-Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
-
-diff -Nura libhid-0.2.16.orig/configure.ac libhid-0.2.16/configure.ac
---- libhid-0.2.16.orig/configure.ac	2014-06-22 09:35:50.277261742 -0300
-+++ libhid-0.2.16/configure.ac	2014-06-22 09:36:10.688951947 -0300
-@@ -79,6 +79,7 @@
- AC_C_STRINGIZE
- 
- MD_CONF_COMPILER
-+AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "uclinux")
- AM_CONDITIONAL(OS_LINUX, test "$MD_OS" = "linux")
- AM_CONDITIONAL(OS_BSD, test "$MD_OS" = "bsd")
- AM_CONDITIONAL(OS_SOLARIS, test "$MD_OS" = "solaris")
-diff -Nura libhid-0.2.16.orig/m4/md_check_os.m4 libhid-0.2.16/m4/md_check_os.m4
---- libhid-0.2.16.orig/m4/md_check_os.m4	2014-06-22 09:35:50.275261675 -0300
-+++ libhid-0.2.16/m4/md_check_os.m4	2014-06-22 09:46:17.651475891 -0300
-@@ -3,7 +3,7 @@
-     AC_CANONICAL_HOST
-     AC_MSG_CHECKING(for target OS)
-     case $host in
--      *-linux*)
-+      *-linux*|*-uclinux*)
-         AC_DEFINE(OS_LINUX, [], [define to 1 if building for Linux])
-         AC_SUBST(OS_LINUX)
-         MD_OS=linux
diff --git a/package/libhid/Config.in b/package/libhid/Config.in
deleted file mode 100644
index abf338fdc7..0000000000
--- a/package/libhid/Config.in
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_PACKAGE_LIBHID
-	bool "libhid"
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
-	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
-	help
-	  Userspace library for accessing USB HID devices
-
-	  https://directory.fsf.org/wiki/Libhid
-
-comment "libhid needs a toolchain w/ threads, gcc >= 4.9"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/libhid/libhid.hash b/package/libhid/libhid.hash
deleted file mode 100644
index 933ba22a92..0000000000
--- a/package/libhid/libhid.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# locally computed
-sha256  f6809ab3b9c907cbb05ceba9ee6ca23a705f85fd71588518e14b3a7d9f2550e5  libhid-0.2.16.tar.gz
-sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libhid/libhid.mk b/package/libhid/libhid.mk
deleted file mode 100644
index b2e890c358..0000000000
--- a/package/libhid/libhid.mk
+++ /dev/null
@@ -1,23 +0,0 @@
-################################################################################
-#
-# libhid
-#
-################################################################################
-
-LIBHID_VERSION = 0.2.16
-LIBHID_SITE = http://sources.buildroot.net
-LIBHID_DEPENDENCIES = libusb-compat libusb
-LIBHID_INSTALL_STAGING = YES
-LIBHID_AUTORECONF = YES
-LIBHID_LICENSE = GPL-2.0
-LIBHID_LICENSE_FILES = COPYING
-# configure runs libusb-config for cflags/ldflags. Ensure it picks up
-# the target version
-LIBHID_CONF_ENV = PATH=$(STAGING_DIR)/usr/bin:$(BR_PATH)
-LIBHID_CONF_OPTS = \
-	--disable-swig \
-	--disable-werror \
-	--without-doxygen \
-	--disable-package-config
-
-$(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

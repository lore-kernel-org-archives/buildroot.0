From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2015 23:21:16 -0000
Subject: [Buildroot] [git commit] libsigc: bump to version 2.6.2
Message-ID: <20151201232116.5F0CE7FBD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36862c71a82dd29db14508b5d37c816b33f9463b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libsigc/Config.in    | 5 +++--
 package/libsigc/libsigc.hash | 4 ++--
 package/libsigc/libsigc.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
index ae984c8..41ea19e 100644
--- a/package/libsigc/Config.in
+++ b/package/libsigc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBSIGC
 	bool "libsigc++"
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  libsigc++ implements a typesafe callback system for standard C++.
@@ -9,5 +10,5 @@ config BR2_PACKAGE_LIBSIGC
 
 	  http://libsigc.sourceforge.net/
 
-comment "libsigc++ needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "libsigc++ needs a toolchain w/ C++, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
index 21c0e99..b9c99c5 100644
--- a/package/libsigc/libsigc.hash
+++ b/package/libsigc/libsigc.hash
@@ -1,2 +1,2 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.2/libsigc++-2.2.11.sha256sum
-sha256	9834045f74f56752c2c6b3cdc195c30ab8314ad22dc8e626d6f67f940f1e4957	libsigc++-2.2.11.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.6/libsigc++-2.6.2.sha256sum
+sha256	fdace7134c31de792c17570f9049ca0657909b28c4c70ec4882f91a03de54437	libsigc++-2.6.2.tar.xz
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 7c127c4..0dc5d24 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSIGC_VERSION_MAJOR = 2.2
-LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).11
+LIBSIGC_VERSION_MAJOR = 2.6
+LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).2
 LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
 LIBSIGC_DEPENDENCIES = host-m4

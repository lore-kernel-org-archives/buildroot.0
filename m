From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Jan 2011 16:23:06 +0100
Subject: [Buildroot] [git commit master 1/1] package: Add libsigc++ package
Message-ID: <20110115152657.68D878A2FB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b98e4d001cb8073fa8aefd2193fd70df0274d05e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add support for the libsigc++ library.

[Peter: Rename dir, use libtool patch, add C++ dep]
Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in          |    1 +
 package/libsigc/Config.in  |   13 +++++++++++++
 package/libsigc/libsigc.mk |   11 +++++++++++
 3 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 package/libsigc/Config.in
 create mode 100644 package/libsigc/libsigc.mk

diff --git a/package/Config.in b/package/Config.in
index 6e42a8f..48f245c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -329,6 +329,7 @@ source "package/libelf/Config.in"
 source "package/libevent/Config.in"
 source "package/libglib2/Config.in"
 source "package/liboil/Config.in"
+source "package/libsigc/Config.in"
 source "package/startup-notification/Config.in"
 endmenu
 
diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
new file mode 100644
index 0000000..93fa3f4
--- /dev/null
+++ b/package/libsigc/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBSIGC
+	bool "libsigc++"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  libsigc++ implements a typesafe callback system for standard C++.
+	  It allows you to define signals and to connect those signals to
+	  any callback function, either global or a member function,
+	  regardless of whether it is static or virtual.
+
+	  http://libsigc.sourceforge.net/
+
+comment "libsigc++ requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
new file mode 100644
index 0000000..0b1de14
--- /dev/null
+++ b/package/libsigc/libsigc.mk
@@ -0,0 +1,11 @@
+#############################################################
+#
+# libsigc++
+#
+#############################################################
+LIBSIGC_VERSION = 2.2.8
+LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
+LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
+LIBSIGC_INSTALL_STAGING = YES
+
+$(eval $(call AUTOTARGETS,package,libsigc))
-- 
1.7.3.4

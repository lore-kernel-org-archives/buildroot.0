From: Andreas Naumann <anaumann@ultratronik.de>
Date: Fri, 20 Dec 2013 16:05:23 +0100
Subject: [Buildroot] [PATCH v2 1/2] libevdev: new package
In-Reply-To: <1387551924-4824-1-git-send-email-anaumann@ultratronik.de>
References: <1387551924-4824-1-git-send-email-anaumann@ultratronik.de>
Message-ID: <1387551924-4824-2-git-send-email-anaumann@ultratronik.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
---
 package/Config.in            |  1 +
 package/libevdev/Config.in   |  6 ++++++
 package/libevdev/libevdev.mk | 18 ++++++++++++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 package/libevdev/Config.in
 create mode 100644 package/libevdev/libevdev.mk

diff --git a/package/Config.in b/package/Config.in
index 3685807..8675856 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -706,6 +706,7 @@ source "package/libdaemon/Config.in"
 source "package/libelf/Config.in"
 source "package/libev/Config.in"
 source "package/libevent/Config.in"
+source "package/libevdev/Config.in"
 source "package/libffi/Config.in"
 source "package/libglib2/Config.in"
 source "package/libical/Config.in"
diff --git a/package/libevdev/Config.in b/package/libevdev/Config.in
new file mode 100644
index 0000000..91dd9db
--- /dev/null
+++ b/package/libevdev/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LIBEVDEV
+	bool "libevdev"
+	help
+	  libevdev is a wrapper library for evdev devices
+
+	  http://freedesktop.org/wiki/Software/libevdev/
diff --git a/package/libevdev/libevdev.mk b/package/libevdev/libevdev.mk
new file mode 100644
index 0000000..8a4bb1a
--- /dev/null
+++ b/package/libevdev/libevdev.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# libevdev
+#
+################################################################################
+
+LIBEVDEV_VERSION = 0.5
+LIBEVDEV_SITE = http://cgit.freedesktop.org/libevdev/snapshot
+LIBEVDEV_LICENSE = GPLv2
+LIBEVDEV_LICENSE_FILES = COPYING
+
+# Uses PKG_CHECK_MODULES() in configure.ac
+LIBEVDEV_DEPENDENCIES = host-pkgconf
+# the package provides a autogen.sh, but we'd rather run buildroots autoreconf
+LIBEVDEV_AUTORECONF = YES
+LIBEVDEV_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.8.4.1

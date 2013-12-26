From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 26 Dec 2013 23:27:50 +0100
Subject: [Buildroot] [git commit] libevdev: new package
Message-ID: <20131226222815.C69E79C1E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=04cae175e2a11b087f0a44cf28143f816d2f147f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: fix license details, improve comment explaining why
 autoreconf is needed.]

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in            |    1 +
 package/libevdev/Config.in   |    6 ++++++
 package/libevdev/libevdev.mk |   20 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 76f8d4f..bcbaea1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -707,6 +707,7 @@ source "package/libdaemon/Config.in"
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
index 0000000..338bebd
--- /dev/null
+++ b/package/libevdev/libevdev.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# libevdev
+#
+################################################################################
+
+LIBEVDEV_VERSION = 0.5
+LIBEVDEV_SITE = http://cgit.freedesktop.org/libevdev/snapshot
+LIBEVDEV_LICENSE = X11
+LIBEVDEV_LICENSE_FILES = COPYING
+
+# Uses PKG_CHECK_MODULES() in configure.ac
+LIBEVDEV_DEPENDENCIES = host-pkgconf
+
+# package source code coming from git, so it doesn't have generated
+# configure and Makefile.in
+LIBEVDEV_AUTORECONF = YES
+LIBEVDEV_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))

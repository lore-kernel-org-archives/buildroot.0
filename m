From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 29 Aug 2012 11:01:07 +0200
Subject: [Buildroot] [PATCH 2/4] liblo: new pachage
In-Reply-To: <1346230869-4926-1-git-send-email-sho@relinux.de>
References: <1346230869-4926-1-git-send-email-sho@relinux.de>
Message-ID: <1346230869-4926-2-git-send-email-sho@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

liblo is an implementation of the Open Sound Control protocol
for POSIX systems.

http://liblo.sourceforge.net/

Signed-off-by: Stephan Hoffmann <sho@relinux.de>
---
 package/Config.in       |    1 +
 package/liblo/Config.in |    8 ++++++++
 package/liblo/liblo.mk  |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)
 create mode 100644 package/liblo/Config.in
 create mode 100644 package/liblo/liblo.mk

diff --git a/package/Config.in b/package/Config.in
index ff52e87..3da6306 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -291,6 +291,7 @@ source "package/libcdaudio/Config.in"
 source "package/libcue/Config.in"
 source "package/libcuefile/Config.in"
 source "package/libid3tag/Config.in"
+source "package/liblo/Config.in"
 source "package/libmad/Config.in"
 source "package/libmpd/Config.in"
 source "package/libreplaygain/Config.in"
diff --git a/package/liblo/Config.in b/package/liblo/Config.in
new file mode 100644
index 0000000..69848f8
--- /dev/null
+++ b/package/liblo/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBLO
+	bool "liblo"
+	help
+	  liblo is an implementation of the Open Sound Control
+	  protocol for POSIX systems
+
+	  http://liblo.sourceforge.net/
+
diff --git a/package/liblo/liblo.mk b/package/liblo/liblo.mk
new file mode 100644
index 0000000..924c3a7
--- /dev/null
+++ b/package/liblo/liblo.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# liblo
+#
+#############################################################
+LIBLO_VERSION = 0.26
+LIBLO_SOURCE = liblo-$(LIBLO_VERSION).tar.gz
+LIBLO_SITE = http://downloads.sourceforge.net/project/liblo/liblo/$(LIBLO_VERSION)
+
+LIBLO_LICENSE = LGPLv2.1+
+LIBLO_LICENSE_FILES = COPYING
+LIBLO_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
-- 
1.7.0.4

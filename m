From: Olivier Schonken <olivier.schonken@gmail.com>
Date: Sun, 22 Mar 2015 16:10:48 +0200
Subject: [Buildroot] [PATCH 7/8] package/ijs: New package ijs 0.35
In-Reply-To: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
References: <1427033449-20179-1-git-send-email-olivier.schonken@gmail.com>
Message-ID: <1427033449-20179-7-git-send-email-olivier.schonken@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
---
 package/Config.in     |  1 +
 package/ijs/Config.in |  7 +++++++
 package/ijs/ijs.hash  |  2 ++
 package/ijs/ijs.mk    | 18 ++++++++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/ijs/Config.in
 create mode 100644 package/ijs/ijs.hash
 create mode 100644 package/ijs/ijs.mk

diff --git a/package/Config.in b/package/Config.in
index c12a098..64a7655 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1126,6 +1126,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 endif
 	source "package/igh-ethercat/Config.in"
 	source "package/igmpproxy/Config.in"
+	source "package/ijs/Config.in"
 	source "package/inadyn/Config.in"
 	source "package/iodine/Config.in"
 	source "package/iperf/Config.in"
diff --git a/package/ijs/Config.in b/package/ijs/Config.in
new file mode 100644
index 0000000..924fc08
--- /dev/null
+++ b/package/ijs/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_IJS
+	bool "ijs"
+	help
+	  The IJS package contains a library which implements a protocol for
+	  transmission of raster page images.
+
+	  http://www.openprinting.org/
diff --git a/package/ijs/ijs.hash b/package/ijs/ijs.hash
new file mode 100644
index 0000000..eb15a29
--- /dev/null
+++ b/package/ijs/ijs.hash
@@ -0,0 +1,2 @@
+# Locally computed:
+md5	896fdcb7a01c586ba6eb81398ea3f6e9  ijs-0.35.tar.bz2
diff --git a/package/ijs/ijs.mk b/package/ijs/ijs.mk
new file mode 100644
index 0000000..2efd2c0
--- /dev/null
+++ b/package/ijs/ijs.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# ijs
+#
+################################################################################
+
+IJS_VERSION = 0.35
+IJS_SITE = http://www.openprinting.org/download/ijs/download
+IJS_LICENSE = MIT
+IJS_LICENSE_FILES = COPYING
+IJS_AUTORECONF = YES
+IJS_SOURCE = ijs-$(IJS_VERSION).tar.bz2
+IJS_INSTALL_STAGING = YES
+IJS_DEPENDENCIES = qpdf dbus
+
+IJS_CONF_OPTS = \
+
+$(eval $(autotools-package))
-- 
1.9.1

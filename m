From: Kamel Bouhara <kamel.bouhara@bootlin.com>
Date: Tue,  8 Jun 2021 14:32:09 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/libqb: new package
Message-ID: <20210608123210.143113-1-kamel.bouhara@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libqb is a library providing features for client-server architecture,
such as logging, tracing, inter-process communication (IPC) and polling.

see: https://github.com/ClusterLabs/libqb

Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/libqb/Config.in  |  7 +++++++
 package/libqb/libqb.hash |  3 +++
 package/libqb/libqb.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/libqb/Config.in
 create mode 100644 package/libqb/libqb.hash
 create mode 100644 package/libqb/libqb.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index a90ad1c354..94be28c43c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1492,6 +1492,7 @@ F:	package/dtach/
 N:	Kamel Bouhara <kamel.bouhara@gmail.com>
 F:	package/libodb-boost/
 F:	package/libodb-mysql/
+F:	package/libqb/
 
 N:	Karoly Kasza <kaszak@gmail.com>
 F:	package/irqbalance/
diff --git a/package/Config.in b/package/Config.in
index 82b28d2835..ad5dd1e860 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1930,6 +1930,7 @@ menu "Other"
 	source "package/libpthread-stubs/Config.in"
 	source "package/libpthsem/Config.in"
 	source "package/libpwquality/Config.in"
+	source "package/libqb/Config.in"
 	source "package/libseccomp/Config.in"
 	source "package/libsigc/Config.in"
 	source "package/libsigsegv/Config.in"
diff --git a/package/libqb/Config.in b/package/libqb/Config.in
new file mode 100644
index 0000000000..4ab010ca50
--- /dev/null
+++ b/package/libqb/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBQB
+	bool "libqb"
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Library for client-server applications
+
+	  https://github.com/ClusterLabs/libqb
diff --git a/package/libqb/libqb.hash b/package/libqb/libqb.hash
new file mode 100644
index 0000000000..0a01a9bbb5
--- /dev/null
+++ b/package/libqb/libqb.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  f72769c66479c51ac176b56837637b29d200f9dad40d23c5fdcb10f3a53ab1e4  libqb-2.0.2.tar.gz
+sha256  00a89b0d18aacd4114decf79122db87bf35bddaf2bc50e383c9c9f4c263390b2  COPYING
diff --git a/package/libqb/libqb.mk b/package/libqb/libqb.mk
new file mode 100644
index 0000000000..9da6d7f900
--- /dev/null
+++ b/package/libqb/libqb.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libqb
+#
+################################################################################
+
+LIBQB_VERSION = 2.0.2
+LIBQB_SITE = $(call github,ClusterLabs,libqb,v$(LIBQB_VERSION))
+LIBQB_LICENSE = LGPL-2.1+
+LIBQB_LICENSE_FILES = COPYING
+LIBQB_INSTALL_STAGING = YES
+LIBQB_AUTORECONF = YES
+LIBQB_DEPENDENCIES = libxml2
+
+$(eval $(autotools-package))
-- 
2.30.2

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 9 Jan 2014 17:07:45 +0000
Subject: [Buildroot] [PATCH] libnfc-llcp: rename to libllcp and bump version
Message-ID: <1389287265-1498-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package has been renamed upstream to libllcp. Also, the current
package we have in Buildroot fails to compile due to a version bump of
it's main dependence, libnfc. A version bump is required because this
package has been adapted upstream to work with libnfc-1.7.0-rc6.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/Config.in                          |    2 +-
 package/{libnfc-llcp => libllcp}/Config.in |    6 +++---
 package/libllcp/libllcp.mk                 |   15 +++++++++++++++
 package/libnfc-llcp/libnfc-llcp.mk         |   15 ---------------
 4 files changed, 19 insertions(+), 19 deletions(-)
 rename package/{libnfc-llcp => libllcp}/Config.in (56%)
 create mode 100644 package/libllcp/libllcp.mk
 delete mode 100644 package/libnfc-llcp/libnfc-llcp.mk

diff --git a/package/Config.in b/package/Config.in
index 8af6a1e..ce9a130 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -567,7 +567,7 @@ source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libmbim/Config.in"
 source "package/libnfc/Config.in"
-source "package/libnfc-llcp/Config.in"
+source "package/libllcp/Config.in"
 source "package/libqmi/Config.in"
 source "package/libraw1394/Config.in"
 source "package/libserial/Config.in"
diff --git a/package/libnfc-llcp/Config.in b/package/libllcp/Config.in
similarity index 56%
rename from package/libnfc-llcp/Config.in
rename to package/libllcp/Config.in
index f557926..e5b2108 100644
--- a/package/libnfc-llcp/Config.in
+++ b/package/libllcp/Config.in
@@ -1,9 +1,9 @@
-config BR2_PACKAGE_LIBNFC_LLCP
-	bool "libnfc-llcp"
+config BR2_PACKAGE_LIBLLCP
+	bool "libllcp"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBNFC
 	help
 	  Library extending libnfc with support for Logical Link Control
 	  Protocol.
 
-	  http://code.google.com/p/nfc-tools/source/browse/trunk/libnfc-llcp/
+	  https://code.google.com/p/libllcp/
diff --git a/package/libllcp/libllcp.mk b/package/libllcp/libllcp.mk
new file mode 100644
index 0000000..4a3c2c4
--- /dev/null
+++ b/package/libllcp/libllcp.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# libllcp
+#
+################################################################################
+
+LIBLLCP_VERSION = cf0c4b3c9df98851c6092c130192130c3f5a46bd
+LIBLLCP_SITE = https://libllcp.googlecode.com/git/
+LIBLLCP_SITE_METHOD = git
+LIBLLCP_DEPENDENCIES = libnfc
+LIBLLCP_AUTORECONF = YES
+LIBLLCP_AUTORECONF_OPT = --install --force --verbose
+LIBLLCP_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))
diff --git a/package/libnfc-llcp/libnfc-llcp.mk b/package/libnfc-llcp/libnfc-llcp.mk
deleted file mode 100644
index d410b55..0000000
--- a/package/libnfc-llcp/libnfc-llcp.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# libnfc-llcp
-#
-################################################################################
-
-LIBNFC_LLCP_VERSION = 1103
-LIBNFC_LLCP_SITE = http://nfc-tools.googlecode.com/svn/trunk/libnfc-llcp/
-LIBNFC_LLCP_SITE_METHOD = svn
-LIBNFC_LLCP_DEPENDENCIES = libnfc
-LIBNFC_LLCP_AUTORECONF = YES
-LIBNFC_LLCP_AUTORECONF_OPT = --install --force --verbose
-LIBNFC_LLCP_INSTALL_STAGING = YES
-
-$(eval $(autotools-package))
-- 
1.7.1

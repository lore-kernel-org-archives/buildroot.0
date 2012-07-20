From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jul 2012 09:42:06 +0200
Subject: [Buildroot] [git commit] libnfc-llcp: new package
Message-ID: <20120720080315.F1C4E96B8A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5276cb27c0e9a2a0326148ab6198c827b6a72c8a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the libnfc-llcp package.

This package requires a minium libnfc version of 1.6. A separate patch has
been submitted to bump the libnfc version; that patch should be regarded as
a prerequisite for the present patch.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                  |    1 +
 package/libnfc-llcp/Config.in      |    8 ++++++++
 package/libnfc-llcp/libnfc-llcp.mk |   14 ++++++++++++++
 3 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 154b82c..d0daa18 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -376,6 +376,7 @@ source "package/libftdi/Config.in"
 source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libnfc/Config.in"
+source "package/libnfc-llcp/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
diff --git a/package/libnfc-llcp/Config.in b/package/libnfc-llcp/Config.in
new file mode 100644
index 0000000..d59976a
--- /dev/null
+++ b/package/libnfc-llcp/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LIBNFC_LLCP
+	bool "libnfc-llcp"
+	select BR2_PACKAGE_LIBNFC
+	help
+	  Library extending libnfc with support for Logical Link Control
+	  Protocol.
+
+	  http://code.google.com/p/nfc-tools/source/browse/trunk/libnfc-llcp/
diff --git a/package/libnfc-llcp/libnfc-llcp.mk b/package/libnfc-llcp/libnfc-llcp.mk
new file mode 100644
index 0000000..57821c1
--- /dev/null
+++ b/package/libnfc-llcp/libnfc-llcp.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libnfc-llcp
+#
+#############################################################
+LIBNFC_LLCP_VERSION = 1090
+LIBNFC_LLCP_SITE = http://nfc-tools.googlecode.com/svn/trunk/libnfc-llcp/
+LIBNFC_LLCP_SITE_METHOD = svn
+LIBNFC_LLCP_DEPENDENCIES = libnfc
+LIBNFC_LLCP_AUTORECONF = YES
+LIBNFC_LLCP_AUTORECONF_OPT = --install --force --verbose
+LIBNFC_LLCP_INSTALL_STAGING = YES
+
+$(eval $(autotools-package))

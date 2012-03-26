From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sun, 25 Mar 2012 23:52:06 -0400
Subject: [Buildroot] [PATCH] New package: libdmtx
Message-ID: <1332733926-32466-1-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/Config.in          |    1 +
 package/libdmtx/Config.in  |    7 +++++++
 package/libdmtx/libdmtx.mk |   13 +++++++++++++
 3 files changed, 21 insertions(+), 0 deletions(-)
 create mode 100644 package/libdmtx/Config.in
 create mode 100644 package/libdmtx/libdmtx.mk

diff --git a/package/Config.in b/package/Config.in
index b394f18..6df27a1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -305,6 +305,7 @@ source "package/gtk2-themes/Config.in"
 source "package/imlib2/Config.in"
 source "package/jpeg/Config.in"
 source "package/libart/Config.in"
+source "package/libdmtx/Config.in"
 source "package/libdrm/Config.in"
 source "package/libexif/Config.in"
 source "package/libgail/Config.in"
diff --git a/package/libdmtx/Config.in b/package/libdmtx/Config.in
new file mode 100644
index 0000000..db4187f
--- /dev/null
+++ b/package/libdmtx/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBDMTX
+	bool "libdmtx"
+	help
+	  libdmtx is a software library that enables programs to read and write
+	  Data Matrix barcodes of the modern ECC200 variety.
+
+	  http://www.libdmtx.org/
diff --git a/package/libdmtx/libdmtx.mk b/package/libdmtx/libdmtx.mk
new file mode 100644
index 0000000..3f7dcf2
--- /dev/null
+++ b/package/libdmtx/libdmtx.mk
@@ -0,0 +1,13 @@
+#############################################################
+#
+# libdmtx
+#
+#############################################################
+
+LIBDMTX_VERSION = 0.7.4
+LIBDMTX_SOURCE = libdmtx-$(LIBDMTX_VERSION).tar.gz
+LIBDMTX_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libdmtx
+LIBDMTX_INSTALL_STAGING = YES
+LIBDMTX_INSTALL_TARGET = YES
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.0.4

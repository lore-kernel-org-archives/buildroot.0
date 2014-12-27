From: Tal Lubko <tallubko@yahoo.com>
Date: Sat, 27 Dec 2014 12:31:48 +0200
Subject: [Buildroot] [PATCH v1 1/2] intel-gpu-tools: new package
Message-ID: <1419676309-850-1-git-send-email-tallubko@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Tal Lubko <tallubko@yahoo.com>
---
 package/Config.in                          |  1 +
 package/intel-gpu-tools/Config.in          | 13 +++++++++++++
 package/intel-gpu-tools/intel-gpu-tools.mk | 17 +++++++++++++++++
 3 files changed, 31 insertions(+)
 create mode 100644 package/intel-gpu-tools/Config.in
 create mode 100644 package/intel-gpu-tools/intel-gpu-tools.mk

diff --git a/package/Config.in b/package/Config.in
index e2b73dd..10b9502 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -63,6 +63,7 @@ menu "Debugging, profiling and benchmark"
 	source "package/fio/Config.in"
 	source "package/gdb/Config.in"
 	source "package/google-breakpad/Config.in"
+	source "package/intel-gpu-tools/Config.in"
 	source "package/iozone/Config.in"
 	source "package/kexec/Config.in"
 	source "package/kexec-lite/Config.in"
diff --git a/package/intel-gpu-tools/Config.in b/package/intel-gpu-tools/Config.in
new file mode 100644
index 0000000..2336d2a
--- /dev/null
+++ b/package/intel-gpu-tools/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_INTEL_GPU_TOOLS
+	bool "intel-gpu-tools"
+	select BR2_PACKAGE_LIBDRM
+	select BR2_PACKAGE_LIBDRM_INTEL
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBPCIACCESS
+
+	help
+	  This is a collection of tools for development and testing of the Intel DRM driver.
+
+	  https://01.org/linuxgraphics/
diff --git a/package/intel-gpu-tools/intel-gpu-tools.mk b/package/intel-gpu-tools/intel-gpu-tools.mk
new file mode 100644
index 0000000..a001ea8
--- /dev/null
+++ b/package/intel-gpu-tools/intel-gpu-tools.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# intel-gpu-tools
+#
+################################################################################
+
+INTEL_GPU_TOOLS_VERSION = 1.8
+INTEL_GPU_TOOLS_SOURCE = intel-gpu-tools-$(INTEL_GPU_TOOLS_VERSION).tar.bz2
+INTEL_GPU_TOOLS_SITE = http://xorg.freedesktop.org/archive/individual/app
+INTEL_GPU_TOOLS_LICENSE = MIT
+INTEL_GPU_TOOLS_INSTALL_STAGING = YES
+INTEL_GPU_TOOLS_INSTALL_TARGET = YES
+INTEL_GPU_TOOLS_DEPENDENCIES = host-pkgconf libdrm cairo libglib2 libpciaccess
+
+INTEL_GPU_TOOLS_CONF_OPTS = \
+
+$(eval $(autotools-package))
-- 
1.9.1

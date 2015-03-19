From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 20:48:03 -0700
Subject: [Buildroot] [PATCH] package: add hwloc 1.10.1
Message-ID: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/Config.in        |  1 +
 package/hwloc/Config.in  |  8 ++++++++
 package/hwloc/hwloc.hash |  2 ++
 package/hwloc/hwloc.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/hwloc/Config.in
 create mode 100644 package/hwloc/hwloc.hash
 create mode 100644 package/hwloc/hwloc.mk

diff --git a/package/Config.in b/package/Config.in
index 96e373a..4ee489c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -331,6 +331,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	source "package/hdparm/Config.in"
 endif
 	source "package/hwdata/Config.in"
+	source "package/hwloc/Config.in"
 	source "package/i2c-tools/Config.in"
 	source "package/input-event-daemon/Config.in"
 	source "package/input-tools/Config.in"
diff --git a/package/hwloc/Config.in b/package/hwloc/Config.in
new file mode 100644
index 0000000..069bc8b
--- /dev/null
+++ b/package/hwloc/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_HWLOC
+	bool "hwloc"
+	select BR2_PACKAGE_LIBPCIACCESS
+	select BR2_PACKAGE_NUMACTL
+	help
+	  Portable Hrdware Locality
+
+	  http://www.open-mpi.org/projects/hwloc/
diff --git a/package/hwloc/hwloc.hash b/package/hwloc/hwloc.hash
new file mode 100644
index 0000000..8d25904
--- /dev/null
+++ b/package/hwloc/hwloc.hash
@@ -0,0 +1,2 @@
+# From http://www.open-mpi.org/software/hwloc/v1.10/downloads/hwloc-1.10.1.tar.bz2
+sha1	76291124e4638b2fbd4deb4cc3cd680e153077b5	hwloc-1.10.1.tar.bz2
diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
new file mode 100644
index 0000000..ced3627
--- /dev/null
+++ b/package/hwloc/hwloc.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# hwloc
+#
+################################################################################
+
+HWLOC_VERSION = 1.10.1
+HWLOC_SOURCE = hwloc-$(HWLOC_VERSION).tar.bz2
+HWLOC_SITE = http://www.open-mpi.org/software/hwloc/v1.10/downloads
+HWLOC_DEPENDENCIES = libpciaccess numactl
+HWLOC_LICENSE = BSD-3c
+HWLOC_LICENSE_FILES = COPYING
+
+$(eval $(autotools-package))
-- 
2.3.3

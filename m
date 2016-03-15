From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Tue, 15 Mar 2016 15:07:55 +0100
Subject: [Buildroot] [PATCH 1/1] xorriso: Bump version, Add host variant
Message-ID: <1458050877-24342-1-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 package/Config.in.host         |  1 +
 package/xorriso/Config.in.host | 14 ++++++++++++++
 package/xorriso/xorriso.hash   |  2 +-
 package/xorriso/xorriso.mk     |  3 ++-
 4 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 package/xorriso/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 09c98fb..a91612b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -32,6 +32,7 @@ menu "Host utilities"
 	source "package/uboot-tools/Config.in.host"
 	source "package/util-linux/Config.in.host"
 	source "package/vboot-utils/Config.in.host"
+	source "package/xorriso/Config.in.host"
 	source "package/zip/Config.in.host"
 
 endmenu
diff --git a/package/xorriso/Config.in.host b/package/xorriso/Config.in.host
new file mode 100644
index 0000000..2baa043
--- /dev/null
+++ b/package/xorriso/Config.in.host
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_HOST_XORRISO
+	bool "host xorriso"
+	help
+	  xorriso copies file objects from POSIX compliant
+	  filesystems into Rock Ridge enhanced ISO 9660 filesystems
+	  and allows session-wise manipulation of such filesystems.
+	  It can load the management information of existing ISO
+	  images and it writes the session results to optical media
+	  or to filesystem objects.
+
+	  Vice versa xorriso is able to copy file objects out of ISO
+	  9660 filesystems.
+
+	  https://www.gnu.org/software/xorriso
diff --git a/package/xorriso/xorriso.hash b/package/xorriso/xorriso.hash
index 98a716d..3c2a726 100644
--- a/package/xorriso/xorriso.hash
+++ b/package/xorriso/xorriso.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 901204634651533f7cbd105eab560534702458258529aac4b2f0fc946992107e xorriso-1.3.8.tar.gz
+sha256 2843beded1aa4c678706e96fdf9cc5e4b34430b559bdf5bc35df5202125004b3 xorriso-1.4.2.tar.gz
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 5826340..a465beb 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XORRISO_VERSION = 1.3.8
+XORRISO_VERSION = 1.4.2
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPLv3+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
@@ -64,3 +64,4 @@ XORRISO_CONF_OPTS += --disable-jtethreads
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.1.4

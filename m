From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
Date: Tue, 15 Mar 2016 15:07:57 +0100
Subject: [Buildroot] [PATCH 2/2] xorriso: Add host variant
In-Reply-To: <1458050877-24342-1-git-send-email-benoit.allard@greenbone.net>
References: <1458050877-24342-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <1458050877-24342-3-git-send-email-benoit.allard@greenbone.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>
---
 package/Config.in.host         |  1 +
 package/xorriso/Config.in.host | 14 ++++++++++++++
 package/xorriso/xorriso.mk     |  2 ++
 3 files changed, 17 insertions(+)
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
diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index e8bb5cb..9e9ec8a 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -8,6 +8,7 @@ XORRISO_VERSION = 1.4.2
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPLv3+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
+HOST_XORRISO_DEPENDENCIES =
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 XORRISO_DEPENDENCIES += libiconv
@@ -64,3 +65,4 @@ XORRISO_CONF_OPTS += --disable-jtethreads
 endif
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.1.4

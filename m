From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Fri, 21 Dec 2012 22:45:01 +0100
Subject: [Buildroot] [PATCH 3/6] libatasmart: new package.
In-Reply-To: <1356126305-16133-1-git-send-email-marek.belisko@open-nandra.com>
References: <1356126305-16133-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1356126305-16133-4-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in                  |    1 +
 package/libatasmart/Config.in      |   11 +++++++++++
 package/libatasmart/libatasmart.mk |   14 ++++++++++++++
 3 files changed, 26 insertions(+)
 create mode 100644 package/libatasmart/Config.in
 create mode 100644 package/libatasmart/libatasmart.mk

diff --git a/package/Config.in b/package/Config.in
index 155a429..7a0a852 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -231,6 +231,7 @@ source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
 source "package/lcdproc/Config.in"
+source "package/libatasmart/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lshw/Config.in"
diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
new file mode 100644
index 0000000..863046f
--- /dev/null
+++ b/package/libatasmart/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_LIBATASMART
+	bool "libatasmart"
+	depends on BR2_PACKAGE_UDEV
+	help
+	  Reading and Parsing Library.
+	  As the name suggests libatasmart only does ATA S.M.A.R.T.
+
+	  git://git.0pointer.de/libatasmart.git
+
+comment "libatasmart requires udev to be enabled"
+	depends on !BR2_PACKAGE_UDEV
diff --git a/package/libatasmart/libatasmart.mk b/package/libatasmart/libatasmart.mk
new file mode 100644
index 0000000..47b4720
--- /dev/null
+++ b/package/libatasmart/libatasmart.mk
@@ -0,0 +1,14 @@
+#############################################################
+#
+# libatasmart
+#
+#############################################################
+LIBATASMART_VERSION = v0.19
+LIBATASMART_SITE    = git://git.0pointer.de/libatasmart.git
+
+LIBATASMART_INSTALL_STAGING = YES
+LIBATASMART_AUTORECONF = YES
+
+LIBATASMART_DEPENDENCIES = udev
+
+$(eval $(autotools-package))
-- 
1.7.10.4

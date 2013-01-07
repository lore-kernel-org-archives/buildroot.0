From: Marek Belisko <marek.belisko@open-nandra.com>
Date: Mon,  7 Jan 2013 21:43:16 +0100
Subject: [Buildroot] [PATCH v2 3/6] libatasmart: new package.
In-Reply-To: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
References: <1357591399-3566-1-git-send-email-marek.belisko@open-nandra.com>
Message-ID: <1357591399-3566-4-git-send-email-marek.belisko@open-nandra.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
---
 package/Config.in                  |    2 ++
 package/libatasmart/Config.in      |   11 +++++++++++
 package/libatasmart/libatasmart.mk |   17 +++++++++++++++++
 3 files changed, 30 insertions(+)
 create mode 100644 package/libatasmart/Config.in
 create mode 100644 package/libatasmart/libatasmart.mk

diff --git a/package/Config.in b/package/Config.in
index c889d8a..53bb5be 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -239,6 +239,8 @@ source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
 source "package/lcdproc/Config.in"
+source "package/libatasmart/Config.in"
+source "package/linux-firmware/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lshw/Config.in"
 source "package/lsuio/Config.in"
diff --git a/package/libatasmart/Config.in b/package/libatasmart/Config.in
new file mode 100644
index 0000000..4fadb22
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
+	  http://www.linuxfromscratch.org/blfs/view/svn/general/libatasmart.html
+
+comment "libatasmart requires udev to be enabled"
+	depends on !BR2_PACKAGE_UDEV
diff --git a/package/libatasmart/libatasmart.mk b/package/libatasmart/libatasmart.mk
new file mode 100644
index 0000000..3f8e36b
--- /dev/null
+++ b/package/libatasmart/libatasmart.mk
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libatasmart
+#
+#############################################################
+LIBATASMART_VERSION = 0.19
+LIBATASMART_SOURCE = libatasmart-$(LIBATASMART_VERSION).tar.xz
+LIBATASMART_SITE    = http://0pointer.de/public
+LIBATASMART_LICENCE = LGPL
+LIBATASMART_LICELCE_FILE = LGPL
+LIBATASMART_INSTALL_STAGING = YES
+
+LIBATASMART_AUTORECONF = YES
+
+LIBATASMART_DEPENDENCIES = udev
+
+$(eval $(autotools-package))
-- 
1.7.10.4

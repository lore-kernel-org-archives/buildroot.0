From: Olaf Rempel <razzor@kopf-tisch.de>
Date: Tue,  3 Mar 2009 11:58:29 +0100
Subject: [Buildroot] lzop: new package
In-Reply-To: <1236077910-15674-7-git-send-email-razzor@kopf-tisch.de>
References: <> <1236077910-15674-1-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-2-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-3-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-4-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-5-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-6-git-send-email-razzor@kopf-tisch.de>
	<1236077910-15674-7-git-send-email-razzor@kopf-tisch.de>
Message-ID: <1236077910-15674-8-git-send-email-razzor@kopf-tisch.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

lzop is a file compressor which is very similar to gzip.
lzop uses the LZO data compression library for compression services.
http://www.lzop.org/
---
 package/Config.in      |    1 +
 package/lzop/Config.in |    9 +++++++++
 package/lzop/lzop.mk   |   12 ++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)
 create mode 100644 package/lzop/Config.in
 create mode 100644 package/lzop/lzop.mk

diff --git a/package/Config.in b/package/Config.in
index 6f566f4..e0b906b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -403,6 +403,7 @@ if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/gzip/Config.in"
 endif
 source "package/lzo/Config.in"
+source "package/lzop/Config.in"
 source "package/lzma/Config.in"
 source "package/zlib/Config.in"
 endmenu
diff --git a/package/lzop/Config.in b/package/lzop/Config.in
new file mode 100644
index 0000000..c529207
--- /dev/null
+++ b/package/lzop/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LZOP
+	bool "lzop"
+	default n
+	select BR2_PACKAGE_LZO
+	help
+	  lzop is a file compressor which is very similar to gzip.
+	  lzop uses the LZO data compression library for compression services.
+
+	  http://www.lzop.org/
diff --git a/package/lzop/lzop.mk b/package/lzop/lzop.mk
new file mode 100644
index 0000000..796686a
--- /dev/null
+++ b/package/lzop/lzop.mk
@@ -0,0 +1,12 @@
+#############################################################
+#
+# lzop
+#
+#############################################################
+LZOP_VERSION:=1.02rc1
+LZOP_SOURCE:=lzop-$(LZOP_VERSION).tar.gz
+LZOP_SITE:=http://www.lzop.org/download/
+LZOP_CONF_OPT:=--program-prefix=""
+LZOP_DEPENDENCIES:=lzo
+
+$(eval $(call AUTOTARGETS,package,lzop))
-- 
1.5.4.3

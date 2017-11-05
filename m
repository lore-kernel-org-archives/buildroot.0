From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Sun,  5 Nov 2017 05:01:09 +0000
Subject: [Buildroot] [PATCH v2 1/1] zlib-ng: new package
Message-ID: <1509858069-12976-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>

Changes v1 -> v2:

- Use correct license file (by Marcus)
- Use github helper (by Arnout)
- Add hash file (by Arnout)

---
 package/Config.in            |  1 +
 package/zlib-ng/Config.in    |  7 +++++++
 package/zlib-ng/zlib-ng.hash | 10 ++++++++++
 package/zlib-ng/zlib-ng.mk   | 13 +++++++++++++
 4 files changed, 31 insertions(+)
 create mode 100644 package/zlib-ng/Config.in
 create mode 100644 package/zlib-ng/zlib-ng.hash
 create mode 100644 package/zlib-ng/zlib-ng.mk

diff --git a/package/Config.in b/package/Config.in
index fe5ccc4..07f38d0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1003,6 +1003,7 @@ menu "Compression and decompression"
 	source "package/snappy/Config.in"
 	source "package/szip/Config.in"
 	source "package/zlib/Config.in"
+	source "package/zlib-ng/Config.in"
 endmenu
 
 menu "Crypto"
diff --git a/package/zlib-ng/Config.in b/package/zlib-ng/Config.in
new file mode 100644
index 0000000..55bbd57
--- /dev/null
+++ b/package/zlib-ng/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ZLIB_NG
+	bool "zlib-ng"
+	help
+	  zlib replacement with optimizations for
+	  "next generation" systems.
+
+	  https://github.com/Dead2/zlib-ng
diff --git a/package/zlib-ng/zlib-ng.hash b/package/zlib-ng/zlib-ng.hash
new file mode 100644
index 0000000..c78f974
--- /dev/null
+++ b/package/zlib-ng/zlib-ng.hash
@@ -0,0 +1,10 @@
+# Locally calculated
+
+md5	87676f8d7fcdea908476029f92b8103f  zlib-ng-e07a52dbaa35d003f5659b221b29d220c091667b.tar.gz
+sha1	126b84064783aa00d29e3a149e7c9701e6af243e  zlib-ng-e07a52dbaa35d003f5659b221b29d220c091667b.tar.gz
+sha256	c762c24d24d3ead93a21a0d540c49751b45058dbe5b00f71f48526b335e85b37  zlib-ng-e07a52dbaa35d003f5659b221b29d220c091667b.tar.gz
+
+md5	b133671347d1c0879cb72e6691debfe3  LICENSE.md
+sha1	1e0b08e7a2124c67c42261ac819e2340a2dd912c LICENSE.md
+sha256	d3c80be055d94d798eaa786116e84fa0b010bc11420b5d2060d978ea77845436 LICENSE.md
+
diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
new file mode 100644
index 0000000..97d269f
--- /dev/null
+++ b/package/zlib-ng/zlib-ng.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# zlib-ng
+#
+################################################################################
+
+ZLIB_NG_VERSION = e07a52dbaa35d003f5659b221b29d220c091667b
+ZLIB_NG_SITE = $(call github,Dead2,zlib-ng,$(ZLIB_NG_VERSION))
+ZLIB_NG_LICENSE = Zlib
+ZLIB_NG_LICENSE_FILES = LICENSE.md
+ZLIB_NG_INSTALL_STAGING = YES
+
+$(eval $(cmake-package))
-- 
2.7.3

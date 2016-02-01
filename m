From: Ludovic Guegan <ludovic.guegan@gmail.com>
Date: Tue,  2 Feb 2016 00:31:05 +0100
Subject: [Buildroot] [PATCH 8/8 RFC] package/bolt: add bolt package
	(persistent key-value store)
In-Reply-To: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <1454369465-4804-9-git-send-email-ludovic.guegan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ludovic Guegan <ludovic.guegan@gmail.com>
---
 package/Config.in      |  1 +
 package/bolt/Config.in |  7 +++++++
 package/bolt/bolt.hash |  1 +
 package/bolt/bolt.mk   | 13 +++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/bolt/Config.in
 create mode 100644 package/bolt/bolt.hash
 create mode 100644 package/bolt/bolt.mk

diff --git a/package/Config.in b/package/Config.in
index 017ae97..7065034 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -815,6 +815,7 @@ endmenu
 
 menu "Database"
 	source "package/berkeleydb/Config.in"
+	source "package/bolt/Config.in"
 	source "package/cppdb/Config.in"
 	source "package/gdbm/Config.in"
 	source "package/kompexsqlite/Config.in"
diff --git a/package/bolt/Config.in b/package/bolt/Config.in
new file mode 100644
index 0000000..eae6b4c
--- /dev/null
+++ b/package/bolt/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_BOLT
+	bool "bolt"
+	depends on BR2_PACKAGE_HOST_GOLANG
+	help
+	  An embedded key/value database for Go.
+
+	  https://github.com/boltdb/bolt
diff --git a/package/bolt/bolt.hash b/package/bolt/bolt.hash
new file mode 100644
index 0000000..694cac5
--- /dev/null
+++ b/package/bolt/bolt.hash
@@ -0,0 +1 @@
+sha256 f426e649dd7c0838efe7bedff1010dfd047d0f354b264af6a030440543c42bd1  bolt-v1.1.0.tar.gz
diff --git a/package/bolt/bolt.mk b/package/bolt/bolt.mk
new file mode 100644
index 0000000..01e3243
--- /dev/null
+++ b/package/bolt/bolt.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# bolt
+#
+################################################################################
+
+BOLT_LICENSE = MIT
+BOLT_VERSION = v1.1.0
+BOLT_SITE = $(call github,boltdb,bolt,$(BOLT_VERSION))
+BOLT_EXTRACT_DIR = $(@D)/src/github.com/boltdb/bolt
+BOLT_BUILD_PACKAGES = github.com/boltdb/bolt/cmd/bolt
+
+$(eval $(golang-package))
-- 
2.7.0

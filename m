From: Ludovic Guegan <ludovic.guegan@gmail.com>
Date: Tue,  2 Feb 2016 00:31:04 +0100
Subject: [Buildroot] [PATCH 7/8 RFC] package/embd: add embd package
	(embedded programming framework)
In-Reply-To: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
References: <1454369465-4804-1-git-send-email-ludovic.guegan@gmail.com>
Message-ID: <1454369465-4804-8-git-send-email-ludovic.guegan@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ludovic Guegan <ludovic.guegan@gmail.com>
---
 package/Config.in      |  1 +
 package/embd/Config.in |  8 ++++++++
 package/embd/embd.hash |  1 +
 package/embd/embd.mk   | 16 ++++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/embd/Config.in
 create mode 100644 package/embd/embd.hash
 create mode 100644 package/embd/embd.mk

diff --git a/package/Config.in b/package/Config.in
index d0e5e4e..017ae97 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1152,6 +1152,7 @@ menu "Other"
 	source "package/ding-libs/Config.in"
 	source "package/eigen/Config.in"
 	source "package/elfutils/Config.in"
+	source "package/embd/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/gflags/Config.in"
diff --git a/package/embd/Config.in b/package/embd/Config.in
new file mode 100644
index 0000000..36ff68b
--- /dev/null
+++ b/package/embd/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_EMBD
+	bool "embd"
+	depends on BR2_PACKAGE_HOST_GOLANG
+	help
+	  Golang Embedded Programming Framework
+
+	  http://embd.io
+
diff --git a/package/embd/embd.hash b/package/embd/embd.hash
new file mode 100644
index 0000000..cafb76d
--- /dev/null
+++ b/package/embd/embd.hash
@@ -0,0 +1 @@
+sha256 b3a7885855920fc915ee7075996bd064be20e95381dbe9cf5aa1f82b133dbf82 embd-bfcd1345fe4e3d17ca82475c0c2f3d53120f87a9.tar.gz
diff --git a/package/embd/embd.mk b/package/embd/embd.mk
new file mode 100644
index 0000000..4be0935
--- /dev/null
+++ b/package/embd/embd.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# embd
+#
+################################################################################
+
+EMBD_LICENSE = MIT
+EMBD_VERSION = bfcd1345fe4e3d17ca82475c0c2f3d53120f87a9
+EMBD_SITE = $(call github,kidoman,embd,$(EMBD_VERSION))
+EMBD_EXTRACT_DIR = $(@D)/src/github.com/kidoman/embd
+EMBD_BUILD_PACKAGES = github.com/kidoman/embd/embd
+
+EMBD_DEPS += $(call fetch-golang-package, github.com/codegangsta/cli, cf1f63a7274872768d4037305d572b70b1199397)
+EMBD_DEPS += $(call fetch-golang-package, github.com/golang/glog, 23def4e6c14b4da8ac2ed8007337bc5eb5007998)
+
+$(eval $(golang-package))
-- 
2.7.0

From: Julien Floret <julien.floret@6wind.com>
Date: Sat,  2 Jul 2016 11:35:38 +0200
Subject: [Buildroot] [PATCH] jsmin: add menuconfig entry for host variant
Message-ID: <1467452138-16403-1-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/Config.in.host       |  1 +
 package/jsmin/Config.in.host | 11 +++++++++++
 2 files changed, 12 insertions(+)
 create mode 100644 package/jsmin/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 04b7f19234b2..909fd967fcc2 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -20,6 +20,7 @@ menu "Host utilities"
 	source "package/gptfdisk/Config.in.host"
 	source "package/imx-usb-loader/Config.in.host"
 	source "package/jq/Config.in.host"
+	source "package/jsmin/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/mke2img/Config.in.host"
 	source "package/mtd/Config.in.host"
diff --git a/package/jsmin/Config.in.host b/package/jsmin/Config.in.host
new file mode 100644
index 000000000000..25ec9bb8592b
--- /dev/null
+++ b/package/jsmin/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_JSMIN
+	bool "host jsmin"
+	help
+	  JSMin is a filter which removes comments and unnecessary
+	  whitespace from JavaScript files. It typically reduces
+	  filesize by half, resulting in faster downloads. It also
+	  encourages a more expressive programming style because it
+	  eliminates the download cost of clean, literate
+	  self-documentation.
+
+	  http://www.crockford.com/javascript/jsmin.html
-- 
2.1.0

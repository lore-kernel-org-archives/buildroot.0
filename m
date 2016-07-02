From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 2 Jul 2016 12:13:48 +0200
Subject: [Buildroot] [git commit] jsmin: add menuconfig entry for host
	variant
Message-ID: <20160702101439.141A87FCC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=88418a2806b935369b6f5e5eed7647904339c16e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in.host       |  1 +
 package/jsmin/Config.in.host | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 04b7f19..909fd96 100644
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
index 0000000..25ec9bb
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

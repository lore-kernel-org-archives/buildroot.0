From: Misha Komarovskiy <zombah@gmail.com>
Date: Tue, 20 Dec 2016 00:08:21 +0300
Subject: [Buildroot] [PATCH 1/1] package/cbootimage: enable target variant
Message-ID: <1482181701-2671-1-git-send-email-zombah@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This allow bootloader modification online on Tegra-targets

Signed-off-by: Misha Komarovskiy <zombah@gmail.com>
---
 package/Config.in                | 1 +
 package/cbootimage/Config.in     | 9 +++++++++
 package/cbootimage/cbootimage.mk | 1 +
 3 files changed, 11 insertions(+)
 create mode 100644 package/cbootimage/Config.in

diff --git a/package/Config.in b/package/Config.in
index be0d150..cdef83d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -352,6 +352,7 @@ endmenu
 	source "package/avrdude/Config.in"
 	source "package/bcache-tools/Config.in"
 	source "package/biosdevname/Config.in"
+	source "package/cbootimage/Config.in"
 	source "package/cc-tool/Config.in"
 	source "package/cdrkit/Config.in"
 	source "package/cryptsetup/Config.in"
diff --git a/package/cbootimage/Config.in b/package/cbootimage/Config.in
new file mode 100644
index 0000000..1a7fef0
--- /dev/null
+++ b/package/cbootimage/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_CBOOTIMAGE
+	bool "cbootimage"
+	depends on BR2_arm || BR2_armeb
+	help
+	  This project provides a tool which compiles BCT (Boot
+	  Configuration Table) images to place into the boot flash of
+	  a Tegra-based device.
+
+	  https://github.com/NVIDIA/cbootimage
diff --git a/package/cbootimage/cbootimage.mk b/package/cbootimage/cbootimage.mk
index 20b17dd..dbff468 100644
--- a/package/cbootimage/cbootimage.mk
+++ b/package/cbootimage/cbootimage.mk
@@ -11,3 +11,4 @@ CBOOTIMAGE_LICENSE_FILES = COPYING
 CBOOTIMAGE_AUTORECONF = YES
 
 $(eval $(host-autotools-package))
+$(eval $(autotools-package))
-- 
2.1.4

From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri,  1 Dec 2017 08:30:27 +0100
Subject: [Buildroot] [PATCH] uboot-tools: fix dtc invocation
Message-ID: <20171201073027.23072-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

In Buildroot we don't perform Kconfig configuration for
u-boot-tools, hence CONFIG_MKIMAGE_DTC_PATH is empty.

Specify MKIMAGE_DTC as "dtc" to restore previous behavior.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0005-Specify-dtc-binary-statically.patch       | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/uboot-tools/0005-Specify-dtc-binary-statically.patch

diff --git a/package/uboot-tools/0005-Specify-dtc-binary-statically.patch b/package/uboot-tools/0005-Specify-dtc-binary-statically.patch
new file mode 100644
index 0000000000..75e81ccc85
--- /dev/null
+++ b/package/uboot-tools/0005-Specify-dtc-binary-statically.patch
@@ -0,0 +1,31 @@
+From ef8afdfd4701c3a7f416efcc173dfb7907ab355b Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Fri, 1 Dec 2017 07:53:40 +0100
+Subject: [PATCH 5/5] Specify dtc binary statically
+
+In Buildroot we don't perform Kconfig configuration for
+u-boot-tools, hence CONFIG_MKIMAGE_DTC_PATH is empty.
+
+Specify MKIMAGE_DTC as "dtc" to restore previous behavior.
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ tools/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index 9c58a01..8f32db9 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -172,7 +172,7 @@ HOSTCFLAGS_rsa-sign.o += -Wno-deprecated-declarations
+ endif
+ endif
+ 
+-HOSTCFLAGS_fit_image.o += -DMKIMAGE_DTC=\"$(CONFIG_MKIMAGE_DTC_PATH)\"
++HOSTCFLAGS_fit_image.o += -DMKIMAGE_DTC=\"dtc\"
+ 
+ HOSTLOADLIBES_dumpimage := $(HOSTLOADLIBES_mkimage)
+ HOSTLOADLIBES_fit_info := $(HOSTLOADLIBES_mkimage)
+-- 
+2.1.4
+
-- 
2.11.0

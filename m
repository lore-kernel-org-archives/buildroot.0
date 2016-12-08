From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 8 Dec 2016 14:46:59 -0800
Subject: [Buildroot] [PATCH v4] package/xen: Disable Werror checking
Message-ID: <1481237219-8699-1-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The strict unused-const-variable checking was causing autobuilder errors
when trying to build Xen tools/libxl as the migrate_*[] arrays are not
always accessed.

To avoid the error edit the Makefile to stop all general warnings being treated
as errors, by removing the -Werror flag.

Fixes:
  http://autobuild.buildroot.net/results/0e0/0e0d4aa4a05da5804821951289c0a4049b009c61/

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
V4:
 - Just remove -Werror flag
V3:
 - Add a link to an autobuilder issue
V2:
 - Fix typo and add commit message to patch 2

 ...ools-libxl-Disable-strict-Werror-checking.patch | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch

diff --git a/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch b/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
new file mode 100644
index 0000000..80c0b32
--- /dev/null
+++ b/package/xen/0003-tools-libxl-Disable-strict-Werror-checking.patch
@@ -0,0 +1,26 @@
+From 19f1e70041044fde1542109a0525424cc6d5d053 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Wed, 7 Dec 2016 11:35:10 -0800
+Subject: [PATCH] tools/libxl: Disable strict Werror checking
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/libxl/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
+index defeb40..239faf3 100644
+--- a/tools/libxl/Makefile
++++ b/tools/libxl/Makefile
+@@ -11,7 +11,7 @@ MINOR = 0
+ XLUMAJOR = 4.7
+ XLUMINOR = 0
+ 
+-CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
++CFLAGS += -Wno-format-zero-length -Wmissing-declarations \
+ 	-Wno-declaration-after-statement -Wformat-nonliteral
+ CFLAGS += -I. -fPIC
+ 
+-- 
+2.7.4
+
-- 
2.7.4

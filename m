From: Alistair Francis <alistair.francis@xilinx.com>
Date: Wed, 7 Dec 2016 15:38:40 -0800
Subject: [Buildroot] [PATCH v2 2/2] package/xen: Disable strict
	unused-const-variable checking
In-Reply-To: <1481153920-20627-1-git-send-email-alistair.francis@xilinx.com>
References: <1481153920-20627-1-git-send-email-alistair.francis@xilinx.com>
Message-ID: <1481153920-20627-3-git-send-email-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The strict unused-const-variable checking was causing autobuilder errors
when trying to build Xen tools/libxl as the migrate_*[] arrays are not
always accessed.

To avoid the error edit the Makefile to stop the warnings being treated
as errors.

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 ...-Disable-strict-unused-const-variable-che.patch | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/xen/0003-tools-libxl-Disable-strict-unused-const-variable-che.patch

diff --git a/package/xen/0003-tools-libxl-Disable-strict-unused-const-variable-che.patch b/package/xen/0003-tools-libxl-Disable-strict-unused-const-variable-che.patch
new file mode 100644
index 0000000..05575fa
--- /dev/null
+++ b/package/xen/0003-tools-libxl-Disable-strict-unused-const-variable-che.patch
@@ -0,0 +1,27 @@
+From 2e04c2db466b2d7881b46505741798701b1aa271 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Wed, 7 Dec 2016 11:35:10 -0800
+Subject: [PATCH] tools/libxl: Disable strict unused-const-variable checking
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/libxl/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
+index defeb40..9d320d1 100644
+--- a/tools/libxl/Makefile
++++ b/tools/libxl/Makefile
+@@ -12,7 +12,8 @@ XLUMAJOR = 4.7
+ XLUMINOR = 0
+ 
+ CFLAGS += -Werror -Wno-format-zero-length -Wmissing-declarations \
+-	-Wno-declaration-after-statement -Wformat-nonliteral
++	-Wno-declaration-after-statement -Wformat-nonliteral \
++	-Werror=unused-const-variable=0
+ CFLAGS += -I. -fPIC
+ 
+ ifeq ($(CONFIG_Linux),y)
+-- 
+2.7.4
+
-- 
2.7.4

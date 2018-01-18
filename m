From: Alistair Francis <alistair.francis@xilinx.com>
Date: Thu, 18 Jan 2018 10:55:47 -0800
Subject: [Buildroot] [PATCH 1/2] package/xen: Force disable SDL for xen-qemu
 build
Message-ID: <20180118185548.8994-1-alistair.francis@xilinx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes autobuilder issue:
http://autobuild.buildroot.net/results/8bcb80dc93d38bb38ca32ad93d52c22d1176d57e/

Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
---
 ...ols-Makefile-Force-disable-SDL-QEMU-build.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/xen/003-tools-Makefile-Force-disable-SDL-QEMU-build.patch

diff --git a/package/xen/003-tools-Makefile-Force-disable-SDL-QEMU-build.patch b/package/xen/003-tools-Makefile-Force-disable-SDL-QEMU-build.patch
new file mode 100644
index 0000000000..fdb9d9c39d
--- /dev/null
+++ b/package/xen/003-tools-Makefile-Force-disable-SDL-QEMU-build.patch
@@ -0,0 +1,30 @@
+From d3b633ee4d7d7a9ae0f99da4720d637d5fbeb007 Mon Sep 17 00:00:00 2001
+From: Alistair Francis <alistair.francis@xilinx.com>
+Date: Thu, 18 Jan 2018 09:51:35 -0800
+Subject: [PATCH] tools/Makefile: Force disable SDL QEMU build
+
+This patch fixes this compile issue when building xen-qemu with SDL
+
+/output/host/bin/../arm-buildroot-linux-gnueabihf/sysroot/usr/include/SDL2/SDL_syswm.h:83:22: fatal error: directfb.h: No such file or directory
+ #include <directfb.h>
+
+Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
+---
+ tools/Makefile | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/tools/Makefile b/tools/Makefile
+index ab7a01ee1b..4df6228fc5 100644
+--- a/tools/Makefile
++++ b/tools/Makefile
+@@ -274,6 +274,7 @@ subdir-all-qemu-xen-dir: qemu-xen-dir-find
+ 		--datadir=$(SHAREDIR)/qemu-xen \
+ 		--localstatedir=$(localstatedir) \
+ 		--disable-kvm \
++		--disable-sdl \
+ 		--disable-docs \
+ 		--disable-guest-agent \
+ 		--python=$(PYTHON) \
+-- 
+2.14.1
+
-- 
2.14.1

From: Adam Duskett <aduskett@gmail.com>
Date: Fri,  7 May 2021 10:01:02 -0700
Subject: [Buildroot] [PATCH 2/2] package/gobject-introspection/Config.in:
 Allow RISCV_32 builds
In-Reply-To: <20210507170102.1896972-1-aduskett@rivian.com>
References: <20210507170102.1896972-1-aduskett@rivian.com>
Message-ID: <20210507170102.1896972-2-aduskett@rivian.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <aduskett@gmail.com>

Qemu 6.0.0 no longer segfaults when running qemu-riscv32. As such, it's now
possible to allow riscv32 to compile gobject-introspection.

Fixes:
http://autobuild.buildroot.org/results/668397b1df42297505e6fc8353c4752290a5628d
Signed-off-by: Adam Duskett <aduskett@rivian.com>
---
 package/gobject-introspection/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/gobject-introspection/Config.in b/package/gobject-introspection/Config.in
index 57c569704e..bacf44363c 100644
--- a/package/gobject-introspection/Config.in
+++ b/package/gobject-introspection/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_GOBJECT_INTROSPECTION_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
-	depends on !BR2_RISCV_32 # qemu-riscv32 segfaults in qemu-5.0.0
 
 config BR2_PACKAGE_GOBJECT_INTROSPECTION
 	bool "gobject-introspection"
-- 
2.31.1

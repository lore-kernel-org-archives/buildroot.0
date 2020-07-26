From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat, 25 Jul 2020 19:28:57 -0700
Subject: [Buildroot] [PATCH 1/5] package/libwebsockets: remove dependency on
 mmu
In-Reply-To: <20200726022901.295552-1-aduskett@gmail.com>
References: <20200726022901.295552-1-aduskett@gmail.com>
Message-ID: <20200726022901.295552-2-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Six years ago, commit b6b5bb518d28850e024b90db1129b7f86e9d416c added the MMU
dependency for the libwebsockets package. However, according to the git
history of the CMakeLists.txt file, libwebsockets has supported the vfork
function for at least the last five years.

After testing with the qemu_arm_versatile_nommu_defconfig and the
br-arm-cortex-m4-full.config file, no errors occurred when building
libwebsockets without MMU support.

Remove the dependency; it is no longer necessary.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/libwebsockets/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libwebsockets/Config.in b/package/libwebsockets/Config.in
index 2b350bf389..1d927bb4ea 100644
--- a/package/libwebsockets/Config.in
+++ b/package/libwebsockets/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LIBWEBSOCKETS
 	bool "libwebsockets"
-	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_ZLIB
 	help
 	  Libwebsockets is a lightweight pure C library built to use
-- 
2.26.2

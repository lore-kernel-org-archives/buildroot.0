From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 15 Dec 2018 13:10:45 +0100
Subject: [Buildroot] [PATCH] package/linux-headers: aarch64_be is not
 supported by kernel version 3.2
Message-ID: <20181215121045.27913-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/linux-headers/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 3221e41c46..1d66759ac9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -28,7 +28,7 @@ config BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_KERNEL_HEADERS_3_2
 	bool "Linux 3.2.x kernel headers"
-	depends on !BR2_aarch64 && !BR2_arc && !BR2_nios2
+	depends on !BR2_aarch64 && !BR2_aarch64_be && !BR2_arc && !BR2_nios2
 	depends on !BR2_riscv
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
-- 
2.14.5

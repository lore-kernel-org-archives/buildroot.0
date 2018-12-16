From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:22:03 +0100
Subject: [Buildroot] [git commit] package/linux-headers: aarch64_be is not
 supported by kernel version 3.2
Message-ID: <20181216151811.156698B757@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f84f91375ad5c3e810d2c22e9a545fbd489f2cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 

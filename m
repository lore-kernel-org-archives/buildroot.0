From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Nov 2017 18:22:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: fix typo "nios" -> "nios2"
Message-ID: <20171112172206.17550-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Typo added recently by
https://git.buildroot.net/buildroot/commit/package/ffmpeg?id=bd2544d3d3903935fc4dc0ec9c930720441e545f

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index 487ca449c8..2d94c5712a 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
 	depends on !(BR2_archs38 && BR2_TOOLCHAIN_USES_GLIBC)
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
-	depends on !BR2_nios
+	depends on !BR2_nios2
 	# No support for ARMv7-M in the ARM assembly logic
 	depends on !BR2_ARM_CPU_ARMV7M
 	# Microblaze build affected by gcc PR71124 (infinite loop)
-- 
2.11.0

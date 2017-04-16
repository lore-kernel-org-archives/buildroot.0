From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Apr 2017 13:41:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: depends on
	BR2_TOOLCHAIN_HAS_SYNC_4
Message-ID: <20170416114135.5080-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/5a2/5a2a7f24c8727f7f3aee2ca72b4472f261610c27/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/Config.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index b5850db72..42a357446 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -3,7 +3,8 @@ config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
 	# No support for ARMv7-M in the ARM assembly logic
 	# Microblaze build affected by gcc PR71124 (infinite loop)
-	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M && !BR2_microblaze
+	default y if !BR2_nios2 && !BR2_ARM_CPU_ARMV7M && \
+		!BR2_microblaze && BR2_TOOLCHAIN_HAS_SYNC_4
 
 menuconfig BR2_PACKAGE_FFMPEG
 	bool "ffmpeg"
-- 
2.11.0

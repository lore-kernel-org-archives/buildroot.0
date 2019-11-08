From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri,  8 Nov 2019 09:41:12 -0800
Subject: [Buildroot] [PATCH 3/3] package/ffmpeg: Enable ARC glibc builds
In-Reply-To: <20191108174112.28183-1-vgupta@synopsys.com>
References: <20191108174112.28183-1-vgupta@synopsys.com>
Message-ID: <20191108174112.28183-4-vgupta@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ARC glibc fenv.h has the needed macros for quite some time now so allow
ffmpeg builds

Signed-off-by: Vineet Gupta <vgupta@synopsys.com>
---
 package/ffmpeg/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
index a5c05d9c1c8e..47a1c510db01 100644
--- a/package/ffmpeg/Config.in
+++ b/package/ffmpeg/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_FFMPEG_ARCH_SUPPORTS
 	bool
 	default y
-	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW
-	depends on !(BR2_archs38 && BR2_TOOLCHAIN_USES_GLIBC)
 	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
 	depends on !BR2_nios2
 	# No support for ARMv7-M in the ARM assembly logic
-- 
2.20.1

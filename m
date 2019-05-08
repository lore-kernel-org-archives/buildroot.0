From: guoren at kernel.org <guoren@kernel.org>
Date: Wed,  8 May 2019 16:58:27 +0800
Subject: [Buildroot] [PATCH V2 1/9] arch/csky: Add VDSP and FLOAT_ABI
 compiler options.
Message-ID: <1557305915-11247-1-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

We never use BR2_CSKY_DSP in buildroot and we use VDSP instead. For
float compiling, we need -mfloat-abi=xxx.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/Config.in.csky | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index e88e4e2..4622eb9 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -23,9 +23,13 @@ config BR2_CSKY_FPU
 	  Floating-Point Coprocessor or if you don't need FPU support
 	  for your user-space programs.
 
-config BR2_CSKY_DSP
-	bool "Enable DSP enhanced instructions"
-	depends on BR2_ck810 || BR2_ck807
+config BR2_CSKY_VDSP
+	bool "Enable VDSP 3.0 enhanced instructions Co-processor"
+	depends on BR2_ck860
+
+config BR2_GCC_TARGET_FLOAT_ABI
+	default "soft"		if !BR2_CSKY_FPU
+	default "hard"		if BR2_CSKY_FPU
 
 config BR2_ARCH
 	default "csky"
-- 
2.7.4

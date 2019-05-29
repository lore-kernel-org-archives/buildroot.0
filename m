From: guoren at kernel.org <guoren@kernel.org>
Date: Wed, 29 May 2019 15:18:41 +0800
Subject: [Buildroot] [PATCH V3 03/10] arch/csky: Add FLOAT_ABI compiler
 options
In-Reply-To: <1559114328-23357-1-git-send-email-guoren@kernel.org>
References: <1559114328-23357-1-git-send-email-guoren@kernel.org>
Message-ID: <1559114328-23357-4-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

This is only for abiv2 and abiv1 don't support FPU.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
---
 arch/Config.in.csky | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index af9bbd5..a967d2f 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -30,6 +30,10 @@ config BR2_CSKY_VDSP
 	bool "Enable VDSP enhanced instructions Co-processor"
 	depends on BR2_CSKY_FPU
 
+config BR2_GCC_TARGET_FLOAT_ABI
+	default "soft"		if !BR2_CSKY_FPU
+	default "hard"		if BR2_CSKY_FPU
+
 config BR2_ARCH
 	default "csky"
 
-- 
2.7.4

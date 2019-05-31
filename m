From: guoren at kernel.org <guoren@kernel.org>
Date: Fri, 31 May 2019 14:39:00 +0800
Subject: [Buildroot] [PATCH V4 03/11] arch/csky: Add ck860 supported
In-Reply-To: <1559284748-32011-1-git-send-email-guoren@kernel.org>
References: <1559284748-32011-1-git-send-email-guoren@kernel.org>
Message-ID: <1559284748-32011-4-git-send-email-guoren@kernel.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guo Ren <ren_guo@c-sky.com>

ck860 is newest CPU core of C-SKY with high performance &
SMP supported.

Signed-off-by: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.csky | 5 ++++-
 arch/arch.mk.csky   | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in.csky b/arch/Config.in.csky
index 3817a2d..af9bbd5 100644
--- a/arch/Config.in.csky
+++ b/arch/Config.in.csky
@@ -13,11 +13,14 @@ config BR2_ck807
 config BR2_ck810
 	bool "ck810"
 
+config BR2_ck860
+	bool "ck860"
+
 endchoice
 
 config BR2_CSKY_FPU
 	bool "Enable FPU coprocessor"
-	depends on BR2_ck810 || BR2_ck807
+	depends on BR2_ck810 || BR2_ck807 || BR2_ck860
 	help
 	  You can say N here if your C-SKY CPU doesn't have a
 	  Floating-Point Coprocessor or if you don't need FPU support
diff --git a/arch/arch.mk.csky b/arch/arch.mk.csky
index f2c90eb..fb59ae2 100644
--- a/arch/arch.mk.csky
+++ b/arch/arch.mk.csky
@@ -11,6 +11,8 @@ else ifeq ($(BR2_ck807),y)
 GCC_TARGET_CPU := ck807
 else ifeq ($(BR2_ck810),y)
 GCC_TARGET_CPU := ck810
+else ifeq ($(BR2_ck860),y)
+GCC_TARGET_CPU := ck860
 endif
 
 ifeq ($(BR2_CSKY_FPU),y)
-- 
2.7.4

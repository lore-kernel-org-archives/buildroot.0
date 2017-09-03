From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Sep 2017 15:17:44 +0200
Subject: [Buildroot] [PATCH 4/9] arch/arm: do not allow soft-float for armv8a
In-Reply-To: <cover.1504444617.git.yann.morin.1998@free.fr>
References: <cover.1504444617.git.yann.morin.1998@free.fr>
Message-ID: <bd6e8e2eaf13ecc5e45e360875cfff3494b86a8c.1504444617.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

armv8a has made VFPv4 and NEON mandatory, so there is no point in
allowing software floating point, even in 32-bit mode.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index d110d52e2d..0ae6a16a0a 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -374,6 +374,7 @@ choice
 config BR2_ARM_SOFT_FLOAT
 	bool "Soft float"
 	depends on BR2_ARM_EABI
+	depends on !BR2_ARM_CPU_ARMV8A
 	select BR2_SOFT_FLOAT
 	help
 	  This option allows to use software emulated floating
-- 
2.11.0

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Dec 2015 17:05:43 +0100
Subject: [Buildroot] [PATCH 3/5 v2] arch/arm: only expose EABIhf when the
	CPU *has* a VFP unit
In-Reply-To: <cover.1451145472.git.yann.morin.1998@free.fr>
References: <cover.1451145472.git.yann.morin.1998@free.fr>
Message-ID: <2a5a9a5e1c77b5fa504cdb1e3212faab987c8b20.1451145472.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's no point in offering the user an option to select EABIhf when
the CPU does not really have a VFP unit.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index f2c5a58..d63a26c 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -238,7 +238,7 @@ config BR2_ARM_EABI
 
 config BR2_ARM_EABIHF
 	bool "EABIhf"
-	depends on BR2_ARM_CPU_MAYBE_HAS_VFPV2 || BR2_ARM_CPU_HAS_VFPV2
+	depends on BR2_ARM_CPU_HAS_VFPV2
 	help
 	  The EABIhf is an extension of EABI which supports the 'hard'
 	  floating point model. This model uses the floating point
-- 
1.9.1

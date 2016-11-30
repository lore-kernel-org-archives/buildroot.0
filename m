From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 30 Nov 2016 22:12:09 +0100
Subject: [Buildroot] [PATCH 6/8] arch/Config.in.arm: specify ABI for ARM64
In-Reply-To: <cover.1480540299.git.yann.morin.1998@free.fr>
References: <cover.1480540299.git.yann.morin.1998@free.fr>
Message-ID: <c4a4b73bb1f4be9a7c8740e26b151e8251b52ff2.1480540299.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

There's currently only one widely supported ABI for ARM64, called lp64,
so we define BR2_GCC_TARGET_ABI to the appropriate value.

Note that there is another ABI for ARM64 being worked on, ilp32, but its
support is not fully upstream in the kernel, so we're not adding support
for it for the moment.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 arch/Config.in.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 1a3c36d..c98efcd 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -513,6 +513,7 @@ config BR2_GCC_TARGET_CPU
 
 config BR2_GCC_TARGET_ABI
 	default "aapcs-linux"	if BR2_arm || BR2_armeb
+	default "lp64"		if BR2_aarch64 || BR2_aarch64_be
 
 config BR2_GCC_TARGET_FPU
 	depends on BR2_arm || BR2_armeb
-- 
2.7.4

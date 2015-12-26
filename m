From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 26 Dec 2015 17:05:45 +0100
Subject: [Buildroot] [PATCH 5/5 v2] toolchain/external: Arago armv7
	toolchain really requires a VFPv3
In-Reply-To: <cover.1451145472.git.yann.morin.1998@free.fr>
References: <cover.1451145472.git.yann.morin.1998@free.fr>
Message-ID: <3b91070c5e3b2bd39c1c263f8b9dd3733a03e409.1451145472.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Arago armv7 toolchain really requires a VFPv3 unit, so only expose
it to the user when the CPU actually has such a VFP unit

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8d4a835..35d8b7a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -140,7 +140,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_CPU_ARMV7A
 	depends on BR2_ARM_EABI
-	depends on BR2_ARM_CPU_HAS_VFPV3 || BR2_ARM_CPU_MAYBE_HAS_VFPV3
+	depends on BR2_ARM_CPU_HAS_VFPV3
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-- 
1.9.1

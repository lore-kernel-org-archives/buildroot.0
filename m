From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Dec 2015 12:17:55 +0100
Subject: [Buildroot] [git commit] toolchain/external: Arago armv7 toolchain
	really requires a VFPv3
Message-ID: <20151227112454.9D10A81917@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08ce10927c8b4977a01dce8eddd6ebc61c3c8c93
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Arago armv7 toolchain really requires a VFPv3 unit, so only expose
it to the user when the CPU actually has such a VFP unit

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

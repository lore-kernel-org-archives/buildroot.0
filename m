From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 7 Nov 2014 00:09:21 +0100
Subject: [Buildroot] [git commit] arch/x86: get rid of BR2_GCC_TARGET_TUNE
Message-ID: <20141106233447.1B0D4B1487@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6bec1d5191a2f017f1e7aa46286de50ba067b7de
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to the gcc documentation, -march implies -mtune on x86, so
defining both BR2_GCC_TARGET_ARCH and BR2_GCC_TARGET_TUNE is
redundant. Therefore, this commit removes the definition of
BR2_GCC_TARGET_TUNE on x86.

However, while doing so, it adds one new case for BR2_GCC_TARGET_ARCH:
using -march=generic when BR2_x86_generic is selected.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.x86 |   32 +-------------------------------
 1 files changed, 1 insertions(+), 31 deletions(-)

diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 9aa4ea2..0b7919b 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -205,37 +205,6 @@ config BR2_ENDIAN
 config BR2_ARCH_HAS_ATOMICS
 	default y if !BR2_x86_i386
 
-config BR2_GCC_TARGET_TUNE
-	default "i386"		if BR2_x86_i386
-	default "i486"		if BR2_x86_i486
-	default "i586"		if BR2_x86_i586
-	default "pentium-mmx"	if BR2_x86_pentium_mmx
-	default "i686"		if BR2_x86_i686
-	default "pentiumpro"	if BR2_x86_pentiumpro
-	default "pentium-m"	if BR2_x86_pentium_m
-	default "pentium2"	if BR2_x86_pentium2
-	default "pentium3"	if BR2_x86_pentium3
-	default "pentium4"	if BR2_x86_pentium4
-	default "prescott"	if BR2_x86_prescott
-	default "nocona"	if BR2_x86_nocona
-	default "core2"		if BR2_x86_core2
-	default "corei7"	if BR2_x86_corei7
-	default "atom"		if BR2_x86_atom
-	default "k8"		if BR2_x86_opteron
-	default "k8-sse3"	if BR2_x86_opteron_sse3
-	default "barcelona"	if BR2_x86_barcelona
-	default "btver2"	if BR2_x86_jaguar
-	default "k6"		if BR2_x86_k6
-	default "k6-2"		if BR2_x86_k6_2
-	default "athlon"	if BR2_x86_athlon
-	default "athlon-4"	if BR2_x86_athlon_4
-	default "winchip-c6"	if BR2_x86_winchip_c6
-	default "winchip2"	if BR2_x86_winchip2
-	default "c3"		if BR2_x86_c3
-	default "c3-2"		if BR2_x86_c32
-	default "geode"		if BR2_x86_geode
-	default "generic"	if BR2_x86_generic
-
 config BR2_GCC_TARGET_ARCH
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
@@ -265,3 +234,4 @@ config BR2_GCC_TARGET_ARCH
 	default "c3"		if BR2_x86_c3
 	default "c3-2"		if BR2_x86_c32
 	default "geode"		if BR2_x86_geode
+	default "generic"	if BR2_x86_generic

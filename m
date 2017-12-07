From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 7 Dec 2017 22:39:44 +0100
Subject: [Buildroot] [git commit] arch/arm: default to Cortex-A53 for AArch64
Message-ID: <20171207213319.48CE5810D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ae2ec0ed74207bb6264e9b90bafdb2d8125c3472
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we re-organised the list of cores (in 52d500aa35) and introduced
some new cores (in e9960da6ec, d632d9e5a9, 6317a199ec), the default for
AArch64 was accidently changed from A53 to A35.

So, restore the default to A53 for AArch64.

Reported-by: daggs <daggs@gmx.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: daggs <daggs@gmx.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 arch/Config.in.arm | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 85070fb..b05e83e 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -64,6 +64,7 @@ config BR2_ARM_CPU_ARMV8A
 
 choice
 	prompt "Target Architecture Variant"
+	default BR2_cortex_a53 if BR2_ARCH_IS_64
 	default BR2_arm926t
 	help
 	  Specific CPU variant to use

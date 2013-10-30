From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Oct 2013 19:10:23 +0100
Subject: [Buildroot] [git commit] toolchain-external: fix visibility and
	length of Linaro toolchain comment
Message-ID: <20131104211054.5AC219BC97@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1e0b97d166ad7414081231148e82c53cd2950cc5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Maxime Ripard reported that the Linaro toolchains were not visible
when selecting a Cortex-A, but forgetting to set the EABI to
EABIhf. While this is expected, Buildroot should normally should a
comment in this case. However, the comment is only visible when the
selected ARM architecture is not ARMv7 *and* the EABI is not
EABIhf. Instead, make the comment visible when either the selected
architecture is not ARMv7 *or* when the selected EABI is not EABIhf.

While we're at it, reword the comment text so that it actually fits
within the limits of the menuconfig screen.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Reported-by: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 646f918..7f9b40a 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -66,10 +66,9 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_07
 
 	  To use this toolchain, you must disable soft float usage.
 
-comment "Linaro toolchains available for Cortex-A{5,7,8,9,15} and the EABIhf ABI"
+comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
-	depends on BR2_GCC_TARGET_ARCH != "armv7-a"
-	depends on !BR2_ARM_EABIHF
+	depends on BR2_GCC_TARGET_ARCH != "armv7-a" || !BR2_ARM_EABIHF
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	bool "Sourcery CodeBench ARM 2013.05"

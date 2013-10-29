From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Oct 2013 21:54:01 +0100
Subject: [Buildroot] [PATCH 2/3] toolchain-external: fix visibility and
	length of Linaro toolchain comment
In-Reply-To: <1383080042-5827-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383080042-5827-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1383080042-5827-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
 toolchain/toolchain-external/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 48b5865..ad35dc7 100644
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
-- 
1.8.1.2

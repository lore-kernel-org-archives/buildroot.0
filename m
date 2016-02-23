From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 23 Feb 2016 22:05:32 +0100
Subject: [Buildroot] [git commit] configs: freescale_imx31_3stack: fix ARM
	variant selection
Message-ID: <20160223210554.D8C568183F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4f529975b9379f78d2053e002cd4253cc552989
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 24dfbe71e (arch/arm: do not distinguish revisions of ARM1136JF-S)
removed the r0 variant of the arm1136jf-s, but didn't update the defconfig -
So it ends up using arm926 instead.

Fix it by selecting the correct symbol instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_imx31_3stack_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/freescale_imx31_3stack_defconfig b/configs/freescale_imx31_3stack_defconfig
index df8c00d..ead520a 100644
--- a/configs/freescale_imx31_3stack_defconfig
+++ b/configs/freescale_imx31_3stack_defconfig
@@ -1,6 +1,6 @@
 # architecture
 BR2_arm=y
-BR2_arm1136jf_s_r0=y
+BR2_arm1136jf_s=y
 BR2_ARM_EABIHF=y
 
 # Linux headers same as kernel, a 3.15 series

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Nov 2018 18:04:00 +0100
Subject: [Buildroot] [git commit branch/2018.08.x]
 configs/orangepi_zero_plus2: U-Boot needs pylibfdt
Message-ID: <20181126170125.18DD1887F9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=152a44b1583293e9b020c73670bfc5e3ac82f8a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.08.x

When building U-Boot for this platform:

unable to execute 'swig': No such file or directory
error: command 'swig' failed with exit status 1
scripts/dtc/pylibfdt/Makefile:26: recipe for target 'scripts/dtc/pylibfdt/_libfdt.so' failed

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/123771103

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit aab652866018e625814b8d715d8b52578e8cc71a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/orangepi_zero_plus2_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/orangepi_zero_plus2_defconfig b/configs/orangepi_zero_plus2_defconfig
index 8c83b3acd1..618104ff5e 100644
--- a/configs/orangepi_zero_plus2_defconfig
+++ b/configs/orangepi_zero_plus2_defconfig
@@ -21,6 +21,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero_plus2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"

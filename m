From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 27 Jul 2020 18:01:44 +0200
Subject: [Buildroot] [git commit] configs/rock_pi_4_defconfig: remove
 BR2_TARGET_UBOOT_NEEDS_PYTHON
Message-ID: <20200727155726.7E0458219D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c05cf378f1a75b3e592867bda454850bebb6a21a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_TARGET_UBOOT_NEEDS_PYTHON3 is already selected for
this defconfig, BR2_TARGET_UBOOT_NEEDS_PYTHON and
BR2_TARGET_UBOOT_NEEDS_PYTHON3 can't be selected at the
same time.

Reported by check-dotconfig.py.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/657885313

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 configs/rock_pi_4_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/rock_pi_4_defconfig b/configs/rock_pi_4_defconfig
index 22ef74be82..401a59bac4 100644
--- a/configs/rock_pi_4_defconfig
+++ b/configs/rock_pi_4_defconfig
@@ -23,7 +23,6 @@ BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="cf2747360fdd1eb0d51dd01a984c7c62c7f714fe"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-pi-4-rk3399"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y

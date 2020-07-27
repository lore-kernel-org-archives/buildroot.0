From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Jul 2020 17:51:23 +0200
Subject: [Buildroot] [PATCHv3 2/6] configs/rock_pi_4_defconfig: remove
 BR2_TARGET_UBOOT_NEEDS_PYTHON
In-Reply-To: <20200727155127.2703286-1-romain.naour@gmail.com>
References: <20200727155127.2703286-1-romain.naour@gmail.com>
Message-ID: <20200727155127.2703286-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_TARGET_UBOOT_NEEDS_PYTHON3 is already selected for
this defconfig, BR2_TARGET_UBOOT_NEEDS_PYTHON and
BR2_TARGET_UBOOT_NEEDS_PYTHON3 can't be selected at the
same time.

Reported by check-dotconfig.py.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/657885313

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.25.4

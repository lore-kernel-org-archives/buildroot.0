From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 27 Jul 2020 17:51:24 +0200
Subject: [Buildroot] [PATCHv3 3/6] configs/rock_pi_n10_defconfig: remove
 BR2_TARGET_UBOOT_NEEDS_PYTHON
In-Reply-To: <20200727155127.2703286-1-romain.naour@gmail.com>
References: <20200727155127.2703286-1-romain.naour@gmail.com>
Message-ID: <20200727155127.2703286-3-romain.naour@gmail.com>
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
https://gitlab.com/kubu93/buildroot/-/jobs/657885314

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/rock_pi_n10_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/rock_pi_n10_defconfig b/configs/rock_pi_n10_defconfig
index bfaa489a20..c622839c89 100644
--- a/configs/rock_pi_n10_defconfig
+++ b/configs/rock_pi_n10_defconfig
@@ -23,7 +23,6 @@ BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="cf2747360fdd1eb0d51dd01a984c7c62c7f714fe"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-pi-n10-rk3399pro"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_NEEDS_PYTHON=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
-- 
2.25.4

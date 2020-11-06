From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Fri,  6 Nov 2020 19:27:01 +0100
Subject: [Buildroot] [PATCH 3/3] configs/rock_pi_n8: use Python 3.x
In-Reply-To: <20201106182701.17410-1-m.niestroj@grinn-global.com>
References: <20201106182701.17410-1-m.niestroj@grinn-global.com>
Message-ID: <20201106182701.17410-4-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New U-Boot versions (such as 2020.07 being used) need Python 3.x for
pylibfdt.

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/831421210

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 configs/rock_pi_n8_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock_pi_n8_defconfig b/configs/rock_pi_n8_defconfig
index 9c671d416e..b7135d6311 100644
--- a/configs/rock_pi_n8_defconfig
+++ b/configs/rock_pi_n8_defconfig
@@ -14,6 +14,7 @@ BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/amarula/u-boot-amarula.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="ba120841bf40ebaed049d64bb4f980083a1cf6b7"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock-pi-n8-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-- 
2.11.0

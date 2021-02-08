From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon,  8 Feb 2021 09:04:50 +0100
Subject: [Buildroot] [PATCH 1/1] configs/kontron_smarc_sal28_defconfig: use
 Python 3.x for U-Boot build
Message-ID: <20210208080450.30547-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

New U-Boot versions need Python 3.x for pylibfdt.

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/1006924823

Cc: Michael Walle <michael@walle.cc>
Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_smarc_sal28_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
index fd001614f4..4a72bf3ec1 100644
--- a/configs/kontron_smarc_sal28_defconfig
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -26,6 +26,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_sl28"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-- 
2.30.0

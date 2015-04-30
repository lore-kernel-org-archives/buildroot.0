From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 30 Apr 2015 14:51:46 +0200
Subject: [Buildroot] [PATCH 3/8] configs: add defconfig for Atmel
	at91sam9x5ek
In-Reply-To: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1430398311-10804-4-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This supports:
 - at91sam9g15ek
 - at91sam9g25ek
 - at91sam9g35ek
 - at91sam9x25ek
 - at91sam9x35ek

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 configs/at91sam9x5ek_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 configs/at91sam9x5ek_defconfig

diff --git a/configs/at91sam9x5ek_defconfig b/configs/at91sam9x5ek_defconfig
new file mode 100644
index 000000000000..461f45d87b3d
--- /dev/null
+++ b/configs/at91sam9x5ek_defconfig
@@ -0,0 +1,18 @@
+BR2_arm=y
+BR2_arm926t=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux-3.18-at91"
+BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g15ek at91sam9g25ek at91sam9g35ek at91sam9x25ek at91sam9x35ek"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eknf_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="at91sam9x5ek_nandflash"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2015.01-at91"
+BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.1.4

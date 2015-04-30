From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Thu, 30 Apr 2015 14:51:45 +0200
Subject: [Buildroot] [PATCH 2/8] configs: add defconfig for Atmel
	at91sam9rlek
In-Reply-To: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
References: <1430398311-10804-1-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <1430398311-10804-3-git-send-email-alexandre.belloni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
---
 configs/at91sam9rlek_defconfig | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 configs/at91sam9rlek_defconfig

diff --git a/configs/at91sam9rlek_defconfig b/configs/at91sam9rlek_defconfig
new file mode 100644
index 000000000000..369111a852b2
--- /dev/null
+++ b/configs/at91sam9rlek_defconfig
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
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9rlek"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9rleknf_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="at91sam9rlek_nandflash"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="u-boot-2015.01-at91"
+BR2_PACKAGE_HOST_SAM_BA=y
-- 
2.1.4

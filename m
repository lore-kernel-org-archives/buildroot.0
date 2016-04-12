From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 12 Apr 2016 02:29:24 -0300
Subject: [Buildroot] [PATCH 3/4] board/minnowboard-max: Add more peripherals
	and features to the kernel
In-Reply-To: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460438965-28065-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460438965-28065-4-git-send-email-ezequiel@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit enables support for:
  * HDMI audio
  * Support for user-provided EDID firmware
    (useful to workaround broken monitors)
  * Evdev interface
  * System V IPC (required by ALSA)
  * POSIX message queue
  * fhandle syscall
  * cgroups

The options are quite common and make the system more useful.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 board/minnowboard-max/linux.config | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/board/minnowboard-max/linux.config b/board/minnowboard-max/linux.config
index abb7fdce9861..f80170b9b81d 100644
--- a/board/minnowboard-max/linux.config
+++ b/board/minnowboard-max/linux.config
@@ -1,4 +1,8 @@
+CONFIG_SYSVIPC=y
+CONFIG_POSIX_MQUEUE=y
+CONFIG_FHANDLE=y
 CONFIG_NO_HZ=y
+CONFIG_CGROUPS=y
 CONFIG_SMP=y
 CONFIG_X86_INTEL_LPSS=y
 CONFIG_MATOM=y
@@ -13,12 +17,15 @@ CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_INET=y
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_CHR_DEV_SG=y
 CONFIG_ATA=y
 CONFIG_SATA_AHCI=y
 CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_R8169=y
+CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
@@ -33,7 +40,15 @@ CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_AGP=y
 CONFIG_DRM=y
+CONFIG_DRM_LOAD_EDID_FIRMWARE=y
 CONFIG_DRM_I915=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+# CONFIG_SND_DRIVERS is not set
+CONFIG_SND_HDA_INTEL=y
+CONFIG_SND_HDA_CODEC_HDMI=y
+# CONFIG_SND_SPI is not set
+# CONFIG_SND_USB is not set
 CONFIG_USB=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_NOP_USB_XCEIV=y
@@ -44,3 +59,5 @@ CONFIG_MMC_SDHCI_ACPI=y
 CONFIG_PWM=y
 CONFIG_PWM_LPSS=y
 CONFIG_EXT4_FS=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_TMPFS_POSIX_ACL=y
-- 
2.7.0

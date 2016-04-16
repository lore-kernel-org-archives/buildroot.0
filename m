From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Sat, 16 Apr 2016 12:23:22 -0300
Subject: [Buildroot] [PATCH v3 3/4] board/minnowboard-max: Add more
	peripherals and features to the kernel
In-Reply-To: <1460820203-6080-1-git-send-email-ezequiel@vanguardiasur.com.ar>
References: <1460820203-6080-1-git-send-email-ezequiel@vanguardiasur.com.ar>
Message-ID: <1460820203-6080-4-git-send-email-ezequiel@vanguardiasur.com.ar>
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

The options make the system more useful.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
--
Changes from v1:

  * Since we dropped systemd usage, got rid of related
    options.
---
 board/minnowboard/linux-4.4.config | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/board/minnowboard/linux-4.4.config b/board/minnowboard/linux-4.4.config
index abb7fdce9861..349842325293 100644
--- a/board/minnowboard/linux-4.4.config
+++ b/board/minnowboard/linux-4.4.config
@@ -1,3 +1,4 @@
+CONFIG_SYSVIPC=y
 CONFIG_NO_HZ=y
 CONFIG_SMP=y
 CONFIG_X86_INTEL_LPSS=y
@@ -19,6 +20,7 @@ CONFIG_SATA_AHCI=y
 CONFIG_ATA_PIIX=y
 CONFIG_NETDEVICES=y
 CONFIG_R8169=y
+CONFIG_INPUT_EVDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
@@ -33,7 +35,15 @@ CONFIG_GPIOLIB=y
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
-- 
2.7.0

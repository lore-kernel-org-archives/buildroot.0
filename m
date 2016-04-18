From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Apr 2016 23:19:25 +0200
Subject: [Buildroot] [git commit] board/minnowboard-max: Add more
	peripherals and features to the kernel
Message-ID: <20160418211944.AE82B8041C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fbd5b1f04b5e55690a39491e3fd1f4a3466729a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit enables support for:
  * HDMI audio
  * Support for user-provided EDID firmware
    (useful to workaround broken monitors)
  * Evdev interface
  * System V IPC (required by ALSA)

The options make the system more useful.

Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/minnowboard/linux-4.4.config | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/board/minnowboard/linux-4.4.config b/board/minnowboard/linux-4.4.config
index abb7fdc..3498423 100644
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

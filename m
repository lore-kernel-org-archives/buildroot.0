From: Adam Duskett <aduskett@gmail.com>
Date: Mon,  6 Feb 2017 15:24:45 -0500
Subject: [Buildroot] [PATCH 32/44] linux-firmware: add telgent 2300 dvb
	option
In-Reply-To: <20170206202457.31527-1-aduskett@codeblue.com>
References: <20170206202457.31527-1-aduskett@codeblue.com>
Message-ID: <20170206202457.31527-33-aduskett@codeblue.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
---
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 33901d7..fad9a41 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -589,6 +589,12 @@ LINUX_FIRMWARE_FILES += dvb-usb-terratec-h5-drxk.fw
 # which is installed unconditionally
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TELGENT),y)
+LINUX_FIRMWARE_FILES += tlg2300_firmware.bin
+# No license file; the license is in the file WHENCE
+# which is installed unconditionally
+endif
+
 # brcm43xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX),y)
 LINUX_FIRMWARE_FILES += \
-- 
2.9.3

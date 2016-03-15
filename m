From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Tue, 15 Mar 2016 13:47:44 +0300
Subject: [Buildroot] [PATCH] linux-firmware: ath9k_htc - use newer firmware
Message-ID: <1458038864-1872-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Existing blobs are of version ath9k-htc 1.3.1, see
http://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.git/commit/?id=21a6c3e55df956dd223279627685778268ede70f

These are as said in the commit are left for compatibility with older
kernels which [older kernels] will look for blobs in the
root of "/lib/firmware".

But there're newer v1.4 blobs in ath9k_htc folder.
And newer kernels (>=4.4) look first in that new location
"/lib/firmware/ath9k_htc".

Note that even new kernels will fall back to previous location
if new one doesn't exist.

Tested with TP-LINK TL-WN722N (has Atheros AR9271 inside).

Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: John Keeping <john@metanate.com>
Cc: Matt Weber <matt@thewebers.ws>
Cc: Alex Suykov <alex.suykov@gmail.com>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/linux-firmware/linux-firmware.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 4667c4c..28fe66c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -87,7 +87,7 @@ endif
 
 # ar7010
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010),y)
-LINUX_FIRMWARE_FILES += ar7010.fw ar7010_1_1.fw htc_7010.fw
+LINUX_FIRMWARE_FILES += ar7010.fw ar7010_1_1.fw htc_7010.fw ath9k_htc/htc_7010-1.4.0.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
@@ -99,7 +99,7 @@ endif
 
 # ar9271
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_9271),y)
-LINUX_FIRMWARE_FILES += ar9271.fw htc_9271.fw
+LINUX_FIRMWARE_FILES += ar9271.fw htc_9271.fw ath9k_htc/htc_9271-1.4.0.fw
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
-- 
2.5.0

From: Joel Stanley <joel@jms.id.au>
Date: Fri, 14 Dec 2018 09:45:32 +1030
Subject: [Buildroot] [PATCH] linux-firmware: Install all Qlogic QED binaries
Message-ID: <20181213231532.9657-1-joel@jms.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There are various versions shipped in linux-firmware. In the past we
decided that it was up to the developer to filter out the ones they want
for their specific kernel version, so install them all.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 package/linux-firmware/linux-firmware.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 60f39804a24d..e5cd56d9a5ea 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -383,7 +383,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_4X),y)
 LINUX_FIRMWARE_FILES += \
-	qed/qed_init_values_zipped-8.33.11.0.bin
+	qed/qed_init_values_zipped-*.bin
 # No license file; the license is in the file WHENCE
 # which is installed unconditionally
 endif
-- 
2.19.1

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:25 -0300
Subject: [Buildroot] [PATCH 11/25] usbutils: build after busybox if enabled
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build after busybox if it's enabled since full-blown lsusb is better
than busybox lsusb.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usbutils/usbutils.mk |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 7da8eda..e89f02e 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -15,6 +15,11 @@ else
 	USBUTILS_CONF_OPT = --disable-zlib
 endif
 
+# Build after busybox since it's got a lightweight lsusb
+ifeq ($(BR2_PACKAGE_BUSYBOX),y)
+	USBUTILS_DEPENDENCIES += busybox
+endif
+
 define USBUTILS_TARGET_CLEANUP
 	rm -f $(TARGET_DIR)/usr/bin/usb-devices
 	rm -f $(TARGET_DIR)/usr/sbin/update-usbids.sh
-- 
1.7.3.4

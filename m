From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 15 Oct 2011 23:06:51 +0200
Subject: [Buildroot] [git commit] usbutils: build after busybox if enabled
Message-ID: <20111015213657.D45458D520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2500d3001872c591cc3f92be7c6946e27f22ae08
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Build after busybox if it's enabled since full-blown lsusb is better
than busybox lsusb.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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

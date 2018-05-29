From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 May 2018 19:12:14 +0300
Subject: [Buildroot] [PATCH next] usbutils: lsusb.py is for python 3.x only
Message-ID: <5c1f4f9f8c6ed89fc685baf21cf6f5641087839c.1527610334.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

usbutils version 010 converted the lsusb.py script to Python 3. Keep the
lsusb.py script on target only when Python 3.x is enabled.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/usbutils/usbutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 98b7894ae774..43322e4a654b 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -16,8 +16,8 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 USBUTILS_DEPENDENCIES += busybox
 endif
 
-# Nice lsusb.py script only if there's python
-ifeq ($(BR2_PACKAGE_PYTHON),)
+# Nice lsusb.py script only if there's python 3.x
+ifeq ($(BR2_PACKAGE_PYTHON3),)
 define USBUTILS_REMOVE_PYTHON
 	rm -f $(TARGET_DIR)/usr/bin/lsusb.py
 endef
-- 
2.17.0

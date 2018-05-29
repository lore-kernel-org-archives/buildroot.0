From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 21:17:25 +0200
Subject: [Buildroot] [git commit] usbutils: lsusb.py is for python 3.x only
Message-ID: <20180602101014.093748199C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78b9f9c393e58590d8e416fb0ac34b947cab0bad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

usbutils version 010 converted the lsusb.py script to Python 3. Keep the
lsusb.py script on target only when Python 3.x is enabled.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbutils/usbutils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 98b7894ae7..43322e4a65 100644
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

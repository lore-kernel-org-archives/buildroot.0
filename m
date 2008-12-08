From: Jeremy Kerr <jk@ozlabs.org>
Date: Mon, 08 Dec 2008 14:58:17 +1100
Subject: [Buildroot] [PATCH 1/4] package/udev: fix dependency for scsi_id
Message-ID: <1228708697.392615.378550596058.1.gpush@pingu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to udev.mk, the scsi_id package depends on the libvolume_id
library, so add this dependency to Config.mk

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

---
 package/udev/Config.in |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/udev/Config.in b/package/udev/Config.in
index 7ecce0b..b97ff57 100644
--- a/package/udev/Config.in
+++ b/package/udev/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_UDEV_VOLUME_ID
 
 config BR2_PACKAGE_UDEV_SCSI_ID
 	bool "udev-scsi_id"
-	depends on BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_UDEV_VOLUME_ID
 	help
 	  Build and install SCSI disk identification library.
 

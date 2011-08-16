From: Daniel Mack <zonque@gmail.com>
Date: Tue, 16 Aug 2011 14:16:18 +0200
Subject: [Buildroot] [PATCH 1/2] package/udev: move pkgconfig files to
	staging dir after install
Message-ID: <1313496979-1565-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is unfortunately no way to tell udev's configure process about the
install location of its pkgconfig files. However, they should clearly
end up in the staging area and not in the target.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/udev/udev.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 567bbfb..f5bd893 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -29,6 +29,7 @@ endif
 
 define UDEV_INSTALL_INITSCRIPT
 	$(INSTALL) -m 0755 package/udev/S10udev $(TARGET_DIR)/etc/init.d/S10udev
+	mv $(TARGET_DIR)/usr/lib/pkgconfig/*udev* $(STAGING_DIR)/usr/lib/pkgconfig/
 endef
 
 UDEV_POST_INSTALL_TARGET_HOOKS += UDEV_INSTALL_INITSCRIPT
-- 
1.7.6

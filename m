From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Sep 2010 13:36:00 +0200
Subject: [Buildroot] [git commit master 1/1] tiff: use correct construct to
	override target installation
Message-ID: <20100916113827.6207B8AB99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0958e6109c9ed8c82342d17a1205e3c4b8baa3f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We also remove the stripping, as it is already done globally.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tiff/tiff.mk |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/tiff/tiff.mk b/package/tiff/tiff.mk
index 8db215e..ca6f562 100644
--- a/package/tiff/tiff.mk
+++ b/package/tiff/tiff.mk
@@ -17,10 +17,8 @@ TIFF_CONF_OPT = \
 
 TIFF_DEPENDENCIES = host-pkg-config zlib jpeg
 
-$(eval $(call AUTOTARGETS,package,tiff))
-
-$(TIFF_TARGET_INSTALL_TARGET):
-	-cp -a $(TIFF_DIR)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
-	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libtiff.so
-	touch $@
+define TIFF_INSTALL_TARGET_CMDS
+	-cp -a $(@D)/libtiff/.libs/libtiff.so* $(TARGET_DIR)/usr/lib/
+endef
 
+$(eval $(call AUTOTARGETS,package,tiff))
-- 
1.7.1

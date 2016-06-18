From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:36:05 +0200
Subject: [Buildroot] [git commit] sstrip: get rid of host variant
Message-ID: <20160618133629.6729E819CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66502932fe86e3f2ff2fd0034a44388ff68f9cde
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Host sstrip is not used anymore.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/sstrip/sstrip.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/sstrip/sstrip.mk b/package/sstrip/sstrip.mk
index fe57b3c..685ea09 100644
--- a/package/sstrip/sstrip.mk
+++ b/package/sstrip/sstrip.mk
@@ -6,7 +6,6 @@
 
 SSTRIP_SITE = svn://svn.openwrt.org/openwrt/trunk/tools/sstrip
 SSTRIP_VERSION = 20154
-HOST_SSTRIP_BINARY = $(GNU_TARGET_NAME)-sstrip
 
 define SSTRIP_BUILD_CMDS
 	cd $(@D) ; \
@@ -18,15 +17,4 @@ define SSTRIP_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/sstrip $(TARGET_DIR)/usr/bin/sstrip
 endef
 
-define HOST_SSTRIP_BUILD_CMDS
-	cd $(@D) ; \
-	$(HOSTCC) $(HOST_CFLAGS) -include endian.h -include byteswap.h \
-		-o sstrip src/sstrip.c
-endef
-
-define HOST_SSTRIP_INSTALL_CMDS
-	$(INSTALL) -D $(@D)/sstrip $(HOST_DIR)/usr/bin/$(HOST_SSTRIP_BINARY)
-endef
-
 $(eval $(generic-package))
-$(eval $(host-generic-package))

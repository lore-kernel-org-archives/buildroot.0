From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:25:52 +0200
Subject: [Buildroot] [git commit] package/jimtcl: bump to 0.75,
	move download URL to snapshot.debian.org
Message-ID: <20141025095905.5EDDFB13C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7def899c4d5a525b041b797385d4d87e18366651
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/jimtcl/jimtcl.mk |   14 ++++++++------
 1 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 1f2ea82..27f43f0 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-JIMTCL_VERSION = 0.73
-JIMTCL_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/j/jimtcl
-JIMTCL_SOURCE = jimtcl_$(JIMTCL_VERSION).orig.tar.bz2
+JIMTCL_VERSION = 0.75
+JIMTCL_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/j/jimtcl
+JIMTCL_SOURCE = jimtcl_$(JIMTCL_VERSION).orig.tar.xz
 JIMTCL_INSTALL_STAGING = YES
 JIMTCL_LICENSE = BSD-2c
 JIMTCL_LICENSE_FILES = LICENSE
@@ -31,9 +31,10 @@ JIMTCL_LIB = a
 JIMTCL_INSTALL_LIB =
 else
 JIMTCL_SHARED = --shared
-JIMTCL_LIB = so
+JIMTCL_LIB = so.$(JIMTCL_VERSION)
 JIMTCL_INSTALL_LIB = $(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) \
-		     $(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB)
+		     $(TARGET_DIR)/usr/lib/libjim.$(JIMTCL_LIB); \
+		     ln -s libjim.$(JIMTCL_LIB) $(TARGET_DIR)/usr/lib/libjim.so
 endif
 
 define JIMTCL_CONFIGURE_CMDS
@@ -52,7 +53,8 @@ define JIMTCL_INSTALL_STAGING_CMDS
 	for i in $(JIMTCL_HEADERS_TO_INSTALL); do \
 		cp -a $(@D)/$$i $(STAGING_DIR)/usr/include/ ; \
 	done; \
-	$(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) $(STAGING_DIR)/usr/lib/libjim.$(JIMTCL_LIB)
+	$(INSTALL) -D $(@D)/libjim.$(JIMTCL_LIB) $(STAGING_DIR)/usr/lib/libjim.$(JIMTCL_LIB);
+	ln -s libjim.$(JIMTCL_LIB) $(STAGING_DIR)/usr/lib/libjim.so
 endef
 
 define JIMTCL_INSTALL_TARGET_CMDS

From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:30 +0200
Subject: [Buildroot] [PATCH 04/11] package/jimtcl: bump to 0.75,
	move download URL to snapshot.debian.org
In-Reply-To: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
References: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
Message-ID: <1414075717-7333-5-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
---
 package/jimtcl/jimtcl.mk |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

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
-- 
1.7.10.4

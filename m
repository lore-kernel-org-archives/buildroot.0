From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 26 Apr 2013 21:24:17 -0300
Subject: [Buildroot] [PATCH] pciutils: bump to version 3.2.0
Message-ID: <1367022257-10770-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/pciutils/pciutils.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/pciutils/pciutils.mk b/package/pciutils/pciutils.mk
index 6219711..2cd10c0 100644
--- a/package/pciutils/pciutils.mk
+++ b/package/pciutils/pciutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCIUTILS_VERSION = 3.1.10
+PCIUTILS_VERSION = 3.2.0
 PCIUTILS_SITE = ftp://atrey.karlin.mff.cuni.cz/pub/linux/pci
 PCIUTILS_INSTALL_STAGING = YES
 PCIUTILS_LICENSE = GPLv2+
@@ -24,6 +24,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 	PCIUTILS_DEPENDENCIES += busybox
 endif
 
+ifeq ($(BR2_PACKAGE_KMOD),y)
+	PCIUTILS_DEPENDENCIES += kmod
+	PCIUTILS_KMOD = yes
+else
+	PCIUTILS_KMOD = no
+endif
+
 define PCIUTILS_CONFIGURE_CMDS
 	$(SED) 's/wget --no-timestamping/wget/' $(PCIUTILS_DIR)/update-pciids.sh
 	$(SED) 's/uname -s/echo Linux/' \
@@ -43,6 +50,7 @@ define PCIUTILS_BUILD_CMDS
 		SHARED=$(PCIUTILS_SHARED) \
 		ZLIB=$(PCIUTILS_ZLIB) \
 		DNS=$(PCIUTILS_DNS) \
+		LIBKMOD=$(PCIUTILS_KMOD) \
 		PREFIX=/usr
 endef
 
-- 
1.8.1.5

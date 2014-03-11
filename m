From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:04:38 +0100
Subject: [Buildroot] [git commit] ptpd2: bump to version 2.3.0
Message-ID: <20140311220647.C34529BEED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a84e0527448f0f5143314739f88daee14c89210e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now a proper autotools package, almost... (configure not shipped)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ptpd2/ptpd2.mk |   14 ++++----------
 1 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/package/ptpd2/ptpd2.mk b/package/ptpd2/ptpd2.mk
index 0428c80..cd898d8 100644
--- a/package/ptpd2/ptpd2.mk
+++ b/package/ptpd2/ptpd2.mk
@@ -4,23 +4,17 @@
 #
 ################################################################################
 
-PTPD2_VERSION = 2.2.2
+PTPD2_VERSION = 2.3.0
 PTPD2_SITE = http://downloads.sourceforge.net/project/ptpd/ptpd/$(PTPD2_VERSION)
 PTPD2_SOURCE = ptpd-$(PTPD2_VERSION).tar.gz
+# configure not shipped
+PTPD2_AUTORECONF = YES
 PTPD2_LICENSE = BSD-2c
 PTPD2_LICENSE_FILES = COPYRIGHT
 
-define PTPD2_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/src
-endef
-
-define PTPD2_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 755 -D $(@D)/src/ptpd2 $(TARGET_DIR)/usr/sbin/ptpd2
-endef
-
 define PTPD2_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/ptpd2/S65ptpd2 \
 		$(TARGET_DIR)/etc/init.d/S65ptpd2
 endef
 
-$(eval $(generic-package))
+$(eval $(autotools-package))

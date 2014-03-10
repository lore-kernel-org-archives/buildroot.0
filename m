From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 10 Mar 2014 17:26:32 -0300
Subject: [Buildroot] [PATCH 12/14] ptpd2: bump to version 2.3.0
In-Reply-To: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
References: <1394483194-17592-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1394483194-17592-12-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now a proper autotools package, almost... (configure not shipped)

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ptpd2/ptpd2.mk | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

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
-- 
1.8.3.2

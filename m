From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  8 Jan 2013 14:45:06 -0300
Subject: [Buildroot] [PATCH] libnl: bump to version 3.2.18
Message-ID: <1357667106-6356-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 3.2.18, fixing:
http://autobuild.buildroot.org/results/28f23910e2c2090e6f37e8d6a26cdb5adf9615c2

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnl/libnl.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 12494f4..35b2a51 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LIBNL_VERSION = 3.2.17
+LIBNL_VERSION = 3.2.18
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files
 LIBNL_LICENSE = LGPLv2.1+
 LIBNL_LICENSE_FILES = COPYING
@@ -22,6 +22,7 @@ endef
 
 define LIBNL_REMOVE_TOOLS
 	rm -rf $(addprefix $(TARGET_DIR)/usr/sbin/nl-, $(LIBNL_BINARIES))
+	rm -rf $(TARGET_DIR)/usr/sbin/genl-ctrl-list
 endef
 
 ifneq ($(BR2_PACKAGE_LIBNL_TOOLS),y)
-- 
1.7.8.6

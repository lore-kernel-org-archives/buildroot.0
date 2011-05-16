From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 16 May 2011 11:18:26 -0300
Subject: [Buildroot] [PATCH] libnl: minor package fixes
Message-ID: <1305555506-10082-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* libnl fails to build with multiple jobs so keep make at -j1
* Multiple libraries are installed so update uninstall target for this

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libnl/libnl.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libnl/libnl.mk b/package/libnl/libnl.mk
index 8d3b9ad..1810cb5 100644
--- a/package/libnl/libnl.mk
+++ b/package/libnl/libnl.mk
@@ -9,9 +9,15 @@ LIBNL_SOURCE = libnl-$(LIBNL_VERSION).tar.gz
 LIBNL_SITE = http://www.infradead.org/~tgr/libnl/files/
 LIBNL_INSTALL_STAGING = YES
 LIBNL_DEPENDENCIES = host-bison
+LIBNL_MAKE = $(MAKE1)
 
 define LIBNL_UNINSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/usr/lib/libnl.so*
+	rm -f $(TARGET_DIR)/usr/lib/libnl-cli.so*
+	rm -f $(TARGET_DIR)/usr/lib/libnl-genl.so*
+	rm -f $(TARGET_DIR)/usr/lib/libnl-nf.so*
+	rm -f $(TARGET_DIR)/usr/lib/libnl-route.so*
+
 endef
 
 $(eval $(call AUTOTARGETS,package,libnl))
-- 
1.7.3.4

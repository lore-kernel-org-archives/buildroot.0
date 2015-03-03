From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:26 +0100
Subject: [Buildroot] [RFC v3 21/30] lmbench: to be checked
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-22-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/lmbench/lmbench.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 63a83fd..954f7eb 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -10,9 +10,6 @@ LMBENCH_SITE = http://downloads.sourceforge.net/project/lmbench/development/lmbe
 LMBENCH_LICENSE = lmbench license (based on GPLv2)
 LMBENCH_LICENSE_FILES = COPYING COPYING-2
 
-LMBENCH_CFLAGS = $(TARGET_CFLAGS)
-LMBENCH_LDLIBS = $(TARGET_LDFLAGS)
-
 ifeq ($(BR2_PACKAGE_LIBTIRPC),y)
 LMBENCH_DEPENDENCIES += libtirpc
 LMBENCH_CFLAGS += -I$(STAGING_DIR)/usr/include/tirpc/
@@ -28,7 +25,7 @@ define LMBENCH_CONFIGURE_CMDS
 endef
 
 define LMBENCH_BUILD_CMDS
-	$(MAKE) CFLAGS="$(LMBENCH_CFLAGS)" LDFLAGS="$(LMBENCH_LDFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
+	$(MAKE) CFLAGS="$(TARGET_CFLAGS) $(LMBENCH_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS) $(LMBENCH_LDFLAGS)" OS=$(ARCH) CC="$(TARGET_CC)" -C $(@D)/src
 endef
 
 define LMBENCH_INSTALL_TARGET_CMDS
-- 
2.3.1

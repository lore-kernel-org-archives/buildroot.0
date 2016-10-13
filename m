From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:12 -0300
Subject: [Buildroot] [PATCH 05/51] zlog: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-6-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/zlog/zlog.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/zlog/zlog.mk b/package/zlog/zlog.mk
index a60e1b0..4f7f469 100644
--- a/package/zlog/zlog.mk
+++ b/package/zlog/zlog.mk
@@ -11,16 +11,16 @@ ZLOG_LICENSE_FILES = COPYING
 ZLOG_INSTALL_STAGING = YES
 
 define ZLOG_BUILD_CMDS
-	$(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
 		-C $(@D) all
 endef
 
 define ZLOG_INSTALL_STAGING_CMDS
-	$(MAKE) PREFIX=$(STAGING_DIR)/usr -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(STAGING_DIR)/usr -C $(@D) install
 endef
 
 define ZLOG_INSTALL_TARGET_CMDS
-	$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
+	$(TARGET_MAKE_ENV) $(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3

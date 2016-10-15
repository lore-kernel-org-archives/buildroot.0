From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Oct 2016 14:16:38 +0200
Subject: [Buildroot] [git commit] zlog: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
Message-ID: <20161015121834.F04EF81F57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=72be5e10879ab545010e95fc06f69fe9924519e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

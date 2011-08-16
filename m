From: Daniel Mack <zonque@gmail.com>
Date: Tue, 16 Aug 2011 13:31:07 +0200
Subject: [Buildroot] [PATCH] wirless-tools: install header files to staging
	dir
Message-ID: <1313494267-23656-1-git-send-email-zonque@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 package/wireless_tools/wireless_tools.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index d8358ba..3e73b51 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -36,6 +36,7 @@ endef
 define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" $(WIRELESS_TOOLS_INSTALL_TARGETS)
 	$(MAKE) -C $(@D) INSTALL_MAN="$(TARGET_DIR)/usr/share/man" install-man
+	$(MAKE) -C $(@D) INSTALL_INC="$(STAGING_DIR)/usr/include/" install-hdr
 endef
 
 define WIRELESS_TOOLS_UNINSTALL_TARGET_CMDS
-- 
1.7.6

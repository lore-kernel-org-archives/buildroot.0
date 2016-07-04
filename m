From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  4 Jul 2016 11:07:55 +0200
Subject: [Buildroot] [PATCH 1/2] package/wireless_tools: Remove install man
	pages
Message-ID: <1467623276-25850-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/wireless_tools/wireless_tools.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 5fb8f12..973340b 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -34,7 +34,6 @@ endef
 
 define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
 	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true $(WIRELESS_TOOLS_INSTALL_TARGETS)
-	$(MAKE) -C $(@D) INSTALL_MAN="$(TARGET_DIR)/usr/share/man" install-man
 endef
 
 $(eval $(generic-package))
-- 
2.8.1

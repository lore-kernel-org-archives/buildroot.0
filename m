From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  4 Jul 2016 11:07:56 +0200
Subject: [Buildroot] [PATCH 2/2] package/wireless_tools: Pretty fixes
In-Reply-To: <1467623276-25850-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1467623276-25850-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1467623276-25850-2-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove an empty line and wrap long lines

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/wireless_tools/wireless_tools.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index 973340b..cb15412 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -15,13 +15,13 @@ WIRELESS_TOOLS_INSTALL_STAGING = YES
 WIRELESS_TOOLS_BUILD_TARGETS = iwmulticall
 WIRELESS_TOOLS_INSTALL_TARGETS = install-iwmulticall
 
-
 ifeq ($(BR2_PACKAGE_WIRELESS_TOOLS_LIB),y)
 WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION_MAJOR)
 WIRELESS_TOOLS_INSTALL_TARGETS += install-dynamic
 
 define WIRELESS_TOOLS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)" LDCONFIG=/bin/true install-dynamic
+	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)" LDCONFIG=/bin/true \
+		install-dynamic
 	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)/usr" install-hdr
 endef
 
@@ -33,7 +33,8 @@ define WIRELESS_TOOLS_BUILD_CMDS
 endef
 
 define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true $(WIRELESS_TOOLS_INSTALL_TARGETS)
+	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true \
+		$(WIRELESS_TOOLS_INSTALL_TARGETS)
 endef
 
 $(eval $(generic-package))
-- 
2.8.1

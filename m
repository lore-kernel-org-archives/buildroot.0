From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 11:13:05 +0200
Subject: [Buildroot] [git commit] package/wireless_tools: Pretty fixes
Message-ID: <20160704091310.0CE817FA0A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d45b3064f11b532895c04a15f4c283eceea41220
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove an empty line and wrap long lines

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

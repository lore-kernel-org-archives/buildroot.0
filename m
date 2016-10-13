From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:16 -0300
Subject: [Buildroot] [PATCH 09/51] wireless_tools: use $(TARGET_MAKE_ENV)
	when calling $(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-10-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/wireless_tools/wireless_tools.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/wireless_tools/wireless_tools.mk b/package/wireless_tools/wireless_tools.mk
index cb15412..f4e0ffb 100644
--- a/package/wireless_tools/wireless_tools.mk
+++ b/package/wireless_tools/wireless_tools.mk
@@ -20,20 +20,20 @@ WIRELESS_TOOLS_BUILD_TARGETS += libiw.so.$(WIRELESS_TOOLS_VERSION_MAJOR)
 WIRELESS_TOOLS_INSTALL_TARGETS += install-dynamic
 
 define WIRELESS_TOOLS_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)" LDCONFIG=/bin/true \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)" LDCONFIG=/bin/true \
 		install-dynamic
-	$(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)/usr" install-hdr
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(STAGING_DIR)/usr" install-hdr
 endef
 
 endif
 
 define WIRELESS_TOOLS_BUILD_CMDS
-	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		$(WIRELESS_TOOLS_BUILD_TARGETS)
 endef
 
 define WIRELESS_TOOLS_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true \
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) PREFIX="$(TARGET_DIR)" LDCONFIG=/bin/true \
 		$(WIRELESS_TOOLS_INSTALL_TARGETS)
 endef
 
-- 
2.7.3

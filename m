From: gustavo.zacarias at free-electrons.com <gustavo.zacarias@free-electrons.com>
Date: Thu, 13 Oct 2016 19:13:13 -0300
Subject: [Buildroot] [PATCH 06/51] ed: use $(TARGET_MAKE_ENV) when calling
	$(MAKE)
In-Reply-To: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1476396838-12276-1-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <1476396838-12276-7-git-send-email-gustavo.zacarias@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
---
 package/botan/botan.mk | 6 +++---
 package/ed/ed.mk       | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 69c973e..4da557a 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -48,15 +48,15 @@ define BOTAN_CONFIGURE_CMDS
 endef
 
 define BOTAN_BUILD_CMDS
-	$(MAKE) -C $(@D) AR="$(TARGET_AR) crs"
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) AR="$(TARGET_AR) crs"
 endef
 
 define BOTAN_INSTALL_STAGING_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)/usr" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)/usr" install
 endef
 
 define BOTAN_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)/usr" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)/usr" install
 endef
 
 $(eval $(generic-package))
diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index f3bcb74..101be0e 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -21,11 +21,11 @@ define ED_CONFIGURE_CMDS
 endef
 
 define ED_BUILD_CMDS
-	$(MAKE)	-C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
 endef
 
 define ED_INSTALL_TARGET_CMDS
-	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
-- 
2.7.3

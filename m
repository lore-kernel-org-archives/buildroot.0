From: =?UTF-8?q?DUPONCHEEL=20S=C3=A9bastien?= <sebastien.duponcheel@corp.ovh.com>
Date: Fri, 23 Nov 2018 15:27:39 +0100
Subject: [Buildroot] [PATCH 1/1] botan: fix install directory
Message-ID: <1542983259-6868-1-git-send-email-sebastien.duponcheel@corp.ovh.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: DUPONCHEEL S?bastien <sebastien.duponcheel@corp.ovh.com>
---
 package/botan/botan.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 7f0bbb6..e07b786 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -92,11 +92,11 @@ define BOTAN_BUILD_CMDS
 endef
 
 define BOTAN_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)/usr" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(STAGING_DIR)" install
 endef
 
 define BOTAN_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)/usr" install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install
 endef
 
 $(eval $(generic-package))
-- 
2.7.4

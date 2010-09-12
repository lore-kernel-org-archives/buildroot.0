From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Sep 2010 19:42:27 +0200
Subject: [Buildroot] [PATCH 41/74] alsa-lib: use correct step override method
In-Reply-To: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
References: <cover.1284312638.git.thomas.petazzoni@free-electrons.com>
Message-ID: <879465e040214d77238c7d42fcbad148a6580f8b.1284312638.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/multimedia/alsa-lib/alsa-lib.mk |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/multimedia/alsa-lib/alsa-lib.mk b/package/multimedia/alsa-lib/alsa-lib.mk
index 6e4c575..c1a2b1a 100644
--- a/package/multimedia/alsa-lib/alsa-lib.mk
+++ b/package/multimedia/alsa-lib/alsa-lib.mk
@@ -72,15 +72,16 @@ ALSA_LIB_CONF_ENV = CFLAGS="$(ALSA_LIB_CFLAGS)" \
 # the above doesn't work with shared config.cache
 ALSA_LIB_USE_CONFIG_CACHE = NO
 
-$(eval $(call AUTOTARGETS,package/multimedia,alsa-lib))
-
-$(ALSA_LIB_TARGET_UNINSTALL):
+define ALSA_LIB_UNINSTALL_TARGET_CMDS
 	-rm -f $(TARGET_DIR)/usr/lib/libasound.so*
 	-rm -rf $(TARGET_DIR)/usr/lib/alsa-lib
 	-rm -rf $(TARGET_DIR)/usr/share/alsa
+endef
 
-$(ALSA_LIB_TARGET_CLEAN):
+define ALSA_LIB_UNINSTALL_STAGING_CMDS
 	-rm -f $(STAGING_DIR)/usr/lib/libasound.*
 	-rm -rf $(STAGING_DIR)/usr/lib/alsa-lib
 	-rm -rf $(STAGING_DIR)/usr/share/alsa
+endef
 
+$(eval $(call AUTOTARGETS,package/multimedia,alsa-lib))
-- 
1.7.0.4

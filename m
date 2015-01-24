From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 24 Jan 2015 16:23:41 +0100
Subject: [Buildroot] [PATCH v2 2/6] package/infozip: factorize common CFLAGS
In-Reply-To: <1422113025-24848-1-git-send-email-romain.naour@openwide.fr>
References: <1422113025-24848-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1422113025-24848-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/infozip/infozip.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/infozip/infozip.mk b/package/infozip/infozip.mk
index 229299c..3f53224 100644
--- a/package/infozip/infozip.mk
+++ b/package/infozip/infozip.mk
@@ -14,9 +14,12 @@ ifeq ($(BR2_PACKAGE_BZIP2),y)
 INFOZIP_DEPENDENCIES += bzip2
 endif
 
+# Infozip's default CFLAGS.
+INFOZIP_CFLAGS = -I. -DUNIX
+
 define INFOZIP_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(TARGET_CFLAGS) -I. -DUNIX" \
+		CFLAGS="$(TARGET_CFLAGS) $(INFOZIP_CFLAGS)" \
 		AS="$(TARGET_CC) -c" \
 		-f unix/Makefile generic
 endef
@@ -28,7 +31,7 @@ endef
 
 define HOST_INFOZIP_BUILD_CMDS
 	$(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
-		CFLAGS="$(HOST_CFLAGS) -I. -DUNIX" \
+		CFLAGS="$(HOST_CFLAGS) $(INFOZIP_CFLAGS)" \
 		AS="$(HOSTCC) -c" \
 		-f unix/Makefile generic
 endef
-- 
1.9.3

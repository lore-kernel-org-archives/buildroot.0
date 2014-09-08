From: Francois Perrad <fperrad@gmail.com>
Date: Mon,  8 Sep 2014 20:30:34 +0200
Subject: [Buildroot] [PATCH 2/2] linenoise: install nothing on target
In-Reply-To: <1410201034-11041-1-git-send-email-francois.perrad@gadz.org>
References: <1410201034-11041-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1410201034-11041-2-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

linenoise is a static library, so it's enough to install on staging.
and the linenoise_example executable is not really useful.

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/linenoise/linenoise.mk | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index 562b445..34f85ed 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -21,10 +21,4 @@ define LINENOISE_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(STAGING_DIR)/usr/bin/linenoise_example
 endef
 
-define LINENOISE_INSTALL_TARGET_CMDS
-	$(INSTALL) -m 644 -D $(@D)/linenoise.h          $(TARGET_DIR)/usr/include/linenoise.h
-	$(INSTALL) -m 644 -D $(@D)/liblinenoise.a       $(TARGET_DIR)/usr/lib/liblinenoise.a
-	$(INSTALL) -m 755 -D $(@D)/linenoise_example    $(TARGET_DIR)/usr/bin/linenoise_example
-endef
-
 $(eval $(generic-package))
-- 
1.9.1

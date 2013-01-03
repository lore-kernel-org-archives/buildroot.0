From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri,  4 Jan 2013 00:09:00 +0200
Subject: [Buildroot] [PATCH] divine: fix divine-config
Message-ID: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/divine/divine.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/divine/divine.mk b/package/divine/divine.mk
index 779322e..872d135 100644
--- a/package/divine/divine.mk
+++ b/package/divine/divine.mk
@@ -10,4 +10,11 @@ DIVINE_SOURCE = DiVine-$(DIVINE_VERSION).tar.gz
 DIVINE_INSTALL_STAGING = YES
 DIVINE_DEPENDENCIES = directfb
 
+define DIVINE_STAGING_DIVINE_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/divine-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/divine-config
+endef
+
+DIVINE_POST_INSTALL_STAGING_HOOKS += DIVINE_STAGING_DIVINE_CONFIG_FIXUP
+
 $(eval $(autotools-package))
-- 
1.7.7.6

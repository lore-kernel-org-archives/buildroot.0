From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri,  4 Jan 2013 00:09:05 +0200
Subject: [Buildroot] [PATCH] neon: fix neon-config
In-Reply-To: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1357250947-23296-6-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/neon/neon.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index c2e4949..5e92853 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -52,4 +52,11 @@ ifneq ($(BR2_HAVE_DEVFILES),y)
 NEON_POST_INSTALL_TARGET_HOOKS += NEON_REMOVE_CONFIG_SCRIPTS
 endif
 
+define NEON_STAGING_NEON_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/neon-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/neon-config
+endef
+
+NEON_POST_INSTALL_STAGING_HOOKS += NEON_STAGING_NEON_CONFIG_FIXUP
+
 $(eval $(autotools-package))
-- 
1.7.7.6

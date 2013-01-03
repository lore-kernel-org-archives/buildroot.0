From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri,  4 Jan 2013 00:09:06 +0200
Subject: [Buildroot] [PATCH] libnspr: fix nspr-config
In-Reply-To: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1357250947-23296-7-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/libnspr/libnspr.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index a9d5812..ab199a9 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -38,4 +38,11 @@ define LIBNSPR_INSTALL_TARGET_PC
 endef
 LIBNSPR_POST_INSTALL_TARGET_HOOKS += LIBNSPR_INSTALL_TARGET_PC
 
+define LIBNSPR_STAGING_LIBNSPR_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/nspr-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/nspr-config
+endef
+
+LIBNSPR_POST_INSTALL_STAGING_HOOKS += LIBNSPR_STAGING_LIBNSPR_CONFIG_FIXUP
+
 $(eval $(autotools-package))
-- 
1.7.7.6

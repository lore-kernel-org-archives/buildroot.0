From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri,  4 Jan 2013 00:09:01 +0200
Subject: [Buildroot] [PATCH] giblib: fix giblib-config
In-Reply-To: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1357250947-23296-2-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/giblib/giblib.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/giblib/giblib.mk b/package/giblib/giblib.mk
index 751534c..ed93b3d 100644
--- a/package/giblib/giblib.mk
+++ b/package/giblib/giblib.mk
@@ -13,4 +13,11 @@ GIBLIB_AUTORECONF_OPT = --install
 GIBLIB_CONF_OPT = --with-imlib2-prefix=$(STAGING_DIR)/usr \
 		  --with-imlib2-exec-prefix=$(STAGING_DIR)/usr
 
+define GIBLIB_STAGING_GIBLIB_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/giblib-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/giblib-config
+endef
+
+GIBLIB_POST_INSTALL_STAGING_HOOKS += GIBLIB_STAGING_GIBLIB_CONFIG_FIXUP
+
 $(eval $(autotools-package))
-- 
1.7.7.6

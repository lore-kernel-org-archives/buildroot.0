From: =?UTF-8?q?Stefan=20Fr=C3=B6berg?= <stefan.froberg@petroprogram.com>
Date: Fri,  4 Jan 2013 00:09:03 +0200
Subject: [Buildroot] [PATCH] libgcrypt: fix libgcrypt-config
In-Reply-To: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
References: <1357250947-23296-1-git-send-email-stefan.froberg@petroprogram.com>
Message-ID: <1357250947-23296-4-git-send-email-stefan.froberg@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
---
 package/libgcrypt/libgcrypt.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 3aa60c6..19b6ed3 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -25,5 +25,12 @@ endef
 
 LIBGCRYPT_POST_PATCH_HOOKS += LIBGCRYPT_DISABLE_TESTS
 
+define LIBGCRYPT_STAGING_LIBGCRYPT_CONFIG_FIXUP
+	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/libgcrypt-config
+	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/libgcrypt-config
+endef
+
+LIBGCRYPT_POST_INSTALL_STAGING_HOOKS += LIBGCRYPT_STAGING_LIBGCRYPT_CONFIG_FIXUP
+
 
 $(eval $(autotools-package))
-- 
1.7.7.6

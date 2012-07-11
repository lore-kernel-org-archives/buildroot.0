From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 11 Jul 2012 11:50:10 +0200
Subject: [Buildroot] [PATCH] libxslt: use libgcrypt-config from STAGING_DIR
Message-ID: <1342000210-20798-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Otherwise, if the host has a libgcrypt-config, that one will be used.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/libxslt/libxslt.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 15b6e6a..a40a8a9 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -16,6 +16,7 @@ LIBXSLT_DEPENDENCIES = libxml2
 # If we have enabled libgcrypt then use it, else disable crypto support.
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBXSLT_DEPENDENCIES += libgcrypt
+LIBXSLT_CONF_ENV += LIBGCRYPT_CONFIG=$(STAGING_DIR)/usr/bin/libgcrypt-config
 else
 LIBXSLT_CONF_OPT += --without-crypto
 endif
-- 
tg: (b8b57bb..) t/xslt-libgcrypt-config (depends on: master)

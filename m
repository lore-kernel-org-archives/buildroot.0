From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Tue,  3 Mar 2015 10:17:30 +0100
Subject: [Buildroot] [RFC v3 25/30] ipsec-tools: add support for per-package
	staging directory
In-Reply-To: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <1425374255-6827-26-git-send-email-fabio.porcedda@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use $(STAGINGNOPKG_DIR) instead of $(STAGING_DIR) because now the
STAGING_DIR point to the per-package staging directory.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
---
 package/ipsec-tools/ipsec-tools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ipsec-tools/ipsec-tools.mk b/package/ipsec-tools/ipsec-tools.mk
index 9454c4e..738b616 100644
--- a/package/ipsec-tools/ipsec-tools.mk
+++ b/package/ipsec-tools/ipsec-tools.mk
@@ -23,7 +23,7 @@ endif
 IPSEC_TOOLS_CONF_OPTS = \
 	  --without-libpam \
 	  --disable-gssapi \
-	  --with-kernel-headers=$(STAGING_DIR)/usr/include
+	  --with-kernel-headers=$(STAGINGNOPKG_DIR)/usr/include
 
 ifeq ($(BR2_PACKAGE_IPSEC_TOOLS_ADMINPORT),y)
 IPSEC_TOOLS_CONF_OPTS += --enable-adminport
-- 
2.3.1

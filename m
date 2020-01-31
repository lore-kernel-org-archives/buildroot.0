From: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Fri, 31 Jan 2020 10:09:17 +0100
Subject: [Buildroot] [PATCH] package/libmodsecurity: help configure find
 pcre-config
Message-ID: <20200131090917.7869-1-p.debruijn@unilogic.nl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
---
 package/libmodsecurity/libmodsecurity.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libmodsecurity/libmodsecurity.mk b/package/libmodsecurity/libmodsecurity.mk
index c32bfb4..cf944dd 100644
--- a/package/libmodsecurity/libmodsecurity.mk
+++ b/package/libmodsecurity/libmodsecurity.mk
@@ -22,7 +22,8 @@ LIBMODSECURITY_CONF_OPTS = \
 	--without-lmdb \
 	--without-ssdeep \
 	--without-lua \
-	--without-yajl
+	--without-yajl \
+	--with-pcre="$(STAGING_DIR)/usr/bin/pcre-config"
 
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 LIBMODSECURITY_DEPENDENCIES += libxml2
-- 
2.7.4

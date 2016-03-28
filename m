From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 28 Mar 2016 23:09:23 +0200
Subject: [Buildroot] [PATCH] package/libxslt: fix static build
Message-ID: <1459199363-28640-1-git-send-email-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set --with-libxml-libs-prefix so libtool finds the correct dependencies for
libxml2.

Fixes:
http://autobuild.buildroot.net/results/3f8/3f8d876ed6cfe6e73a75fa8904ebdd3f6f0fe53c/

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/libxslt/libxslt.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libxslt/libxslt.mk b/package/libxslt/libxslt.mk
index 2e5cc14..0cc4bb9 100644
--- a/package/libxslt/libxslt.mk
+++ b/package/libxslt/libxslt.mk
@@ -14,7 +14,8 @@ LIBXSLT_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-debug \
 	--without-python \
-	--with-libxml-prefix=$(STAGING_DIR)/usr/
+	--with-libxml-prefix=$(STAGING_DIR)/usr/ \
+	--with-libxml-libs-prefix=$(STAGING_DIR)/usr/lib
 LIBXSLT_CONFIG_SCRIPTS = xslt-config
 LIBXSLT_DEPENDENCIES = libxml2
 
-- 
2.7.4

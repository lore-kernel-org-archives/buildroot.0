From: Gary Bisson <bisson.gary@gmail.com>
Date: Tue, 17 Dec 2013 10:03:46 -0800
Subject: [Buildroot] [PATCH] libroxml: fix staging install directory path
Message-ID: <1387303426-29751-1-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/libroxml/libroxml.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libroxml/libroxml.mk b/package/libroxml/libroxml.mk
index 3eefd9d..ca32bf9 100644
--- a/package/libroxml/libroxml.mk
+++ b/package/libroxml/libroxml.mk
@@ -13,7 +13,7 @@ define LIBROXML_BUILD_CMDS
 endef
 
 define LIBROXML_INSTALL_STAGING_CMDS
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(@D) install
+	$(MAKE) DESTDIR=$(STAGING_DIR)/usr/ -C $(@D) install
 endef
 
 define LIBROXML_INSTALL_TARGET_CMDS
-- 
1.7.9.5

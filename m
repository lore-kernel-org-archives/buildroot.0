From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 Feb 2015 20:41:26 +0200
Subject: [Buildroot] [PATCH] make: depend on guile explicitly when available
Message-ID: <1ed83c552cb077b37b317e7dff20c1928a5ad702.1424976086.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/make/make.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/make/make.mk b/package/make/make.mk
index d643fb0004bf..6e7a8f1aedf9 100644
--- a/package/make/make.mk
+++ b/package/make/make.mk
@@ -16,4 +16,11 @@ ifeq ($(BR2_STATIC_LIBS),y)
 	MAKE_CONF_OPTS += --disable-load
 endif
 
+ifeq ($(BR2_PACKAGE_GUILE),y)
+MAKE_DEPENDENCIES += guile
+MAKE_CONF_OPTS += --with-guile
+else
+MAKE_CONF_OPTS += --without-guile
+endif
+
 $(eval $(autotools-package))
-- 
2.1.4

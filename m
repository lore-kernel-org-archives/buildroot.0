From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Thu, 09 Aug 2012 21:58:48 +0300
Subject: [Buildroot] [PATCH] cairo: Add tee surface backend option (required
	by firefox)
Message-ID: <50240868.2070709@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Signed-off-by: Stefan Froberg <stefan.froberg@petroprogram.com>
---
 package/cairo/Config.in |    3 +++
 package/cairo/cairo.mk  |    6 ++++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/package/cairo/Config.in b/package/cairo/Config.in
index 19c4723..398e47f 100644
--- a/package/cairo/Config.in
+++ b/package/cairo/Config.in
@@ -32,4 +32,7 @@ config BR2_PACKAGE_CAIRO_SVG
     select BR2_PACKAGE_CAIRO_PNG
     select BR2_PACKAGE_CAIRO_PDF
 
+config BR2_PACKAGE_CAIRO_TEE
+    bool "tee support"
 endif
+
diff --git a/package/cairo/cairo.mk b/package/cairo/cairo.mk
index 6b456dd..eedb28d 100644
--- a/package/cairo/cairo.mk
+++ b/package/cairo/cairo.mk
@@ -77,4 +77,10 @@ else
     CAIRO_CONF_OPT += --disable-svg
 endif
 
+ifeq ($(BR2_PACKAGE_CAIRO_TEE),y)
+    CAIRO_CONF_OPT += --enable-tee
+else
+    CAIRO_CONF_OPT += --disable-tee
+endif
+
 $(eval $(autotools-package))
-- 
1.7.7.6

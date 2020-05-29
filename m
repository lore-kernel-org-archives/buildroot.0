From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 May 2020 19:58:56 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/hiawatha: enable xslt support
Message-ID: <20200529175856.3112405-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/hiawatha/hiawatha.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index eefd0f6f89..28fd286ea8 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -17,9 +17,15 @@ else
 HIAWATHA_CONF_OPTS += -DENABLE_TLS=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXSLT),y)
+HIAWATHA_CONF_OPTS += -DENABLE_XSLT=ON
+HIAWATHA_DEPENDENCIES += libxslt
+else
+HIAWATHA_CONF_OPTS += -DENABLE_XSLT=OFF
+endif
+
 HIAWATHA_CONF_OPTS += \
 	-DENABLE_TOOLKIT=OFF \
-	-DENABLE_XSLT=OFF \
 	-DCONFIG_DIR=/etc/hiawatha \
 	-DLOG_DIR=/var/log \
 	-DPID_DIR=/var/run \
-- 
2.26.2

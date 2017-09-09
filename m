From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:42 +0200
Subject: [Buildroot] [PATCH 36/49 v2] package/asterisk: add optional netsnmp
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <bb8f9d4bbcd9fae6adcaf4b7a020b932ffe39ea5.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 452f61ba67..284b338cb3 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -65,7 +65,6 @@ ASTERISK_CONF_OPTS = \
 	--without-mysqlclient \
 	--without-nbs \
 	--without-neon29 \
-	--without-netsnmp \
 	--without-newt \
 	--without-openr2 \
 	--without-osptk \
@@ -175,6 +174,13 @@ else
 ASTERISK_CONF_OPTS += --without-neon
 endif
 
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+ASTERISK_DEPENDENCIES += netsnmp
+ASTERISK_CONF_OPTS += --with-netsnmp=$(STAGING_DIR)/usr
+else
+ASTERISK_CONF_OPTS += --without-netsnmp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 ASTERISK_DEPENDENCIES += libogg
 ASTERISK_CONF_OPTS += --with-ogg
-- 
2.11.0

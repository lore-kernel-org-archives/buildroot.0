From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:14 +0200
Subject: [Buildroot] [PATCH 08/49 v2] package/asterisk: add optional neon
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <3b8ffe4f4fedb14e8d7985c3857c9b6e92c233c4.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 29e52aef46..ed2bfd3d13 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -70,7 +70,6 @@ ASTERISK_CONF_OPTS = \
 	--without-misdn \
 	--without-mysqlclient \
 	--without-nbs \
-	--without-neon \
 	--without-neon29 \
 	--without-netsnmp \
 	--without-newt \
@@ -150,6 +149,15 @@ else
 ASTERISK_CONF_OPTS += --without-libcurl
 endif
 
+ifeq ($(BR2_PACKAGE_NEON),y)
+ASTERISK_DEPENDENCIES += neon
+ASTERISK_CONF_OPTS += --with-neon
+ASTERISK_CONF_ENV += \
+	ac_cv_path_CONFIG_NEON=$(STAGING_DIR)/usr/bin/neon-config
+else
+ASTERISK_CONF_OPTS += --without-neon
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
-- 
2.11.0

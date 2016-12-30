From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:12 +0100
Subject: [Buildroot] [PATCH 11/52] package/asterisk: add optional neon
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <f2127a7041e997a5870b5eaa5a23905a3212a0b3.1483093662.git.yann.morin.1998@free.fr>
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
index 4cf980d..213a20c 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -59,7 +59,6 @@ ASTERISK_CONF_OPTS += \
 	--without-misdn \
 	--without-mysqlclient \
 	--without-nbs \
-	--without-neon \
 	--without-neon29 \
 	--without-netsnmp \
 	--without-newt \
@@ -132,6 +131,15 @@ else
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
2.7.4

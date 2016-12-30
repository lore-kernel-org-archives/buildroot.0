From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:15 +0100
Subject: [Buildroot] [PATCH 14/52] package/asterisk: add optional opus
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <b9729f26e2cfc80252e2f1cccd0a0b75220b23ad.1483093662.git.yann.morin.1998@free.fr>
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
index 8aa1cb2..58f0ef8 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -62,7 +62,6 @@ ASTERISK_CONF_OPTS += \
 	--without-netsnmp \
 	--without-newt \
 	--without-openr2 \
-	--without-opus \
 	--without-osptk \
 	--without-oss \
 	--without-postgres \
@@ -152,6 +151,13 @@ else
 ASTERISK_CONF_OPTS += --without-ogg
 endif
 
+ifeq ($(BR2_PACKAGE_OPUS),y)
+ASTERISK_DEPENDENCIES += opus
+ASTERISK_CONF_OPTS += --with-opus
+else
+ASTERISK_CONF_OPTS += --without-opus
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
-- 
2.7.4

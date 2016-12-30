From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:13 +0100
Subject: [Buildroot] [PATCH 12/52] package/asterisk: add optional libogg
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <a5b550b9e4499704fee7c835ad50bc983c93aadf.1483093662.git.yann.morin.1998@free.fr>
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
index 213a20c..7a30663 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -62,7 +62,6 @@ ASTERISK_CONF_OPTS += \
 	--without-neon29 \
 	--without-netsnmp \
 	--without-newt \
-	--without-ogg \
 	--without-openr2 \
 	--without-opus \
 	--without-osptk \
@@ -140,6 +139,13 @@ else
 ASTERISK_CONF_OPTS += --without-neon
 endif
 
+ifeq ($(BR2_PACKAGE_LIBOGG),y)
+ASTERISK_DEPENDENCIES += libogg
+ASTERISK_CONF_OPTS += --with-ogg
+else
+ASTERISK_CONF_OPTS += --without-ogg
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
-- 
2.7.4

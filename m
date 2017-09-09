From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:15 +0200
Subject: [Buildroot] [PATCH 09/49 v2] package/asterisk: add optional libogg
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <e8290263dcfc7cde19f8221310085db8b5f37eab.1504993178.git.yann.morin.1998@free.fr>
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
index ed2bfd3d13..e632863138 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -73,7 +73,6 @@ ASTERISK_CONF_OPTS = \
 	--without-neon29 \
 	--without-netsnmp \
 	--without-newt \
-	--without-ogg \
 	--without-openr2 \
 	--without-opus \
 	--without-osptk \
@@ -158,6 +157,13 @@ else
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
2.11.0

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:17 +0200
Subject: [Buildroot] [PATCH 11/49 v2] package/asterisk: add optional opus
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <b33e28ca3bc2169156ae1d01b572509104ff2342.1504993178.git.yann.morin.1998@free.fr>
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
index cdcb18f5a5..7ac17d7063 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -73,7 +73,6 @@ ASTERISK_CONF_OPTS = \
 	--without-netsnmp \
 	--without-newt \
 	--without-openr2 \
-	--without-opus \
 	--without-osptk \
 	--without-oss \
 	--without-postgres \
@@ -170,6 +169,13 @@ else
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
2.11.0

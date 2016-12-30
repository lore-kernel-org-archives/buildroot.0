From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:11 +0100
Subject: [Buildroot] [PATCH 10/52] package/asterisk: add optional curl
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <58fdf17c4bc5bbb2b7d141d99eb0b46186a657e1.1483093662.git.yann.morin.1998@free.fr>
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
index 2eb9c7a..4cf980d 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -52,7 +52,6 @@ ASTERISK_CONF_OPTS += \
 	--without-uriparser \
 	--without-kqueue \
 	--without-ldap \
-	--without-libcurl \
 	--without-libedit \
 	--without-libxslt \
 	--without-ltdl \
@@ -126,6 +125,13 @@ else
 ASTERISK_CONF_OPTS += --without-asound
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+ASTERISK_DEPENDENCIES += libcurl
+ASTERISK_CONF_OPTS += --with-libcurl
+else
+ASTERISK_CONF_OPTS += --without-libcurl
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
-- 
2.7.4

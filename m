From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:23 +0200
Subject: [Buildroot] [PATCH 17/49 v2] package/asterisk: add optional
	openldap dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <81e461eac586fd2aab201f5b3d2c0600ee0304e7.1504993178.git.yann.morin.1998@free.fr>
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
index 279b2b2eb3..e46538db17 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -59,7 +59,6 @@ ASTERISK_CONF_OPTS = \
 	--without-jack \
 	--without-uriparser \
 	--without-kqueue \
-	--without-ldap \
 	--without-libedit \
 	--without-libxslt \
 	--without-ltdl \
@@ -154,6 +153,13 @@ else
 ASTERISK_CONF_OPTS += --without-ilbc
 endif
 
+ifeq ($(BR2_PACKAGE_OPENLDAP),y)
+ASTERISK_DEPENDENCIES += openldap
+ASTERISK_CONF_OPTS += --without-ldap
+else
+ASTERISK_CONF_OPTS += --without-ldap
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 ASTERISK_DEPENDENCIES += libcurl
 ASTERISK_CONF_OPTS += --with-libcurl
-- 
2.11.0

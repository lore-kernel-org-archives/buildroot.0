From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:21 +0100
Subject: [Buildroot] [PATCH 20/52] package/asterisk: add optional openldap
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <5a31a7ad8f522c1594857de4316fe6de726ad140.1483093662.git.yann.morin.1998@free.fr>
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
index 70e8a60..8316ac2 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -48,7 +48,6 @@ ASTERISK_CONF_OPTS += \
 	--without-jack \
 	--without-uriparser \
 	--without-kqueue \
-	--without-ldap \
 	--without-libedit \
 	--without-libxslt \
 	--without-ltdl \
@@ -136,6 +135,13 @@ else
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
2.7.4

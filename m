From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:19 +0100
Subject: [Buildroot] [PATCH 18/52] package/asterisk: add optional portaudio
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <30fc4b15829d648a741836228aae677cc767b2eb.1483093662.git.yann.morin.1998@free.fr>
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
index 642fe61..4994111 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -66,7 +66,6 @@ ASTERISK_CONF_OPTS += \
 	--without-postgres \
 	--without-pjproject \
 	--without-popt \
-	--without-portaudio \
 	--without-pri \
 	--without-pwlib \
 	--without-radius \
@@ -161,6 +160,13 @@ else
 ASTERISK_CONF_OPTS += --without-opus
 endif
 
+ifeq ($(BR2_PACKAGE_PORTAUDIO),y)
+ASTERISK_DEPENDENCIES += portaudio
+ASTERISK_CONF_OPTS += --with-portaudio
+else
+ASTERISK_CONF_OPTS += --without-portaudio
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
-- 
2.7.4

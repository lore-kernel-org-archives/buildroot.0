From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:24 +0200
Subject: [Buildroot] [PATCH 18/49 v2] package/asterisk: add optional
	freeradius-client dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <05ed36efe82054cbc0841d159eaf7ca6de592773.1504993178.git.yann.morin.1998@free.fr>
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
index e46538db17..611eb673a7 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -77,7 +77,6 @@ ASTERISK_CONF_OPTS = \
 	--without-popt \
 	--without-pri \
 	--without-pwlib \
-	--without-radius \
 	--without-resample \
 	--without-sdl \
 	--without-SDL_image \
@@ -197,6 +196,13 @@ else
 ASTERISK_CONF_OPTS += --without-portaudio
 endif
 
+ifeq ($(BR2_PACKAGE_FREERADIUS_CLIENT),y)
+ASTERISK_DEPENDENCIES += freeradius-client
+ASTERISK_CONF_OPTS += --with-radius
+else
+ASTERISK_CONF_OPTS += --without-radius
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
-- 
2.11.0

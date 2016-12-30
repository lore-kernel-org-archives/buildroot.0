From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:22 +0100
Subject: [Buildroot] [PATCH 21/52] package/asterisk: add optional
	freeradius-client dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <eff2027464ede60b8792596dbb832cce1ba7aba1.1483093662.git.yann.morin.1998@free.fr>
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
index 8316ac2..0fd2ecd 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -66,7 +66,6 @@ ASTERISK_CONF_OPTS += \
 	--without-popt \
 	--without-pri \
 	--without-pwlib \
-	--without-radius \
 	--without-resample \
 	--without-sdl \
 	--without-SDL_image \
@@ -179,6 +178,13 @@ else
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
2.7.4

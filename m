From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  3 Oct 2018 15:13:58 +0200
Subject: [Buildroot] [PATCH 4/4] package/asterisk: add optional spandsp
 support
In-Reply-To: <20181003131358.28002-1-bernd.kuhls@t-online.de>
References: <20181003131358.28002-1-bernd.kuhls@t-online.de>
Message-ID: <20181003131358.28002-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 46fe4de947..e094d5546d 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -84,7 +84,6 @@ ASTERISK_CONF_OPTS = \
 	--without-resample \
 	--without-sdl \
 	--without-SDL_image \
-	--without-spandsp \
 	--without-sqlite \
 	--without-suppserv \
 	--without-tds \
@@ -233,6 +232,13 @@ else
 ASTERISK_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_SPANDSP),y)
+ASTERISK_DEPENDENCIES += spandsp
+ASTERISK_CONF_OPTS += --with-spandsp
+else
+ASTERISK_CONF_OPTS += --without-spandsp
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 ASTERISK_DEPENDENCIES += speex
 ASTERISK_CONF_OPTS += --with-speex --with-speexdsp
-- 
2.19.0

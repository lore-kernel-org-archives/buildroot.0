From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:35 +0200
Subject: [Buildroot] [PATCH 29/49 v2] package/asterisk: add optional spandsp
	support
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <04ecabb585e99b199ebc513196cc97864872c72c.1504993178.git.yann.morin.1998@free.fr>
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
index 1fdb5c6902..1a56894f8f 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -78,7 +78,6 @@ ASTERISK_CONF_OPTS = \
 	--without-resample \
 	--without-sdl \
 	--without-SDL_image \
-	--without-spandsp \
 	--without-sqlite \
 	--without-suppserv \
 	--without-tds \
@@ -229,6 +228,13 @@ else
 ASTERISK_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_SPANDSP),y)
+ASTERISK_DEPENDENCIES += spandsp
+ASTERISK_CONF_OPTS += --with-spandsp
+else
+ASTERISK_CONF_OPTS += --without-spandsp
+endif
+
 ifeq ($(BR2_PACKAGE_SPEEX),y)
 ASTERISK_DEPENDENCIES += speex
 ASTERISK_CONF_OPTS += --with-speex --with-speexdsp
-- 
2.11.0

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:18 +0200
Subject: [Buildroot] [PATCH 12/49 v2] package/asterisk: add optional speex
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <910f5ae606a0ca07bdac190b971c5b59f36214e0.1504993178.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 7ac17d7063..4a7fd8c6d5 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -87,8 +87,6 @@ ASTERISK_CONF_OPTS = \
 	--without-SDL_image \
 	--without-spandsp \
 	--without-ss7 \
-	--without-speex \
-	--without-speexdsp \
 	--without-sqlite \
 	--without-srtp \
 	--without-suppserv \
@@ -183,6 +181,13 @@ else
 ASTERISK_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_SPEEX),y)
+ASTERISK_DEPENDENCIES += speex
+ASTERISK_CONF_OPTS += --with-speex --with-speexdsp
+else
+ASTERISK_CONF_OPTS += --without-speex  --without-speexdsp
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 ASTERISK_DEPENDENCIES += zlib
 ASTERISK_CONF_OPTS += --with-z
-- 
2.11.0

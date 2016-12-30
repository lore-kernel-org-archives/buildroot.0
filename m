From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:16 +0100
Subject: [Buildroot] [PATCH 15/52] package/asterisk: add optional speex
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <fcf36535afa4aecf41cbda915e99f7582ea2cc9e.1483093662.git.yann.morin.1998@free.fr>
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
index 58f0ef8..30c75bc 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -76,8 +76,6 @@ ASTERISK_CONF_OPTS += \
 	--without-SDL_image \
 	--without-spandsp \
 	--without-ss7 \
-	--without-speex \
-	--without-speexdsp \
 	--without-sqlite \
 	--without-srtp \
 	--without-suppserv \
@@ -165,6 +163,13 @@ else
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
2.7.4

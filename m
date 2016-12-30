From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:33 +0100
Subject: [Buildroot] [PATCH 32/52] package/asterisk: add optional spandsp
	support
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <0393b1d1015a58104c0c8f3eed8af57c3d577963.1483093662.git.yann.morin.1998@free.fr>
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
index ea27c56..e5fd28e 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -67,7 +67,6 @@ ASTERISK_CONF_OPTS += \
 	--without-resample \
 	--without-sdl \
 	--without-SDL_image \
-	--without-spandsp \
 	--without-sqlite \
 	--without-suppserv \
 	--without-tds \
@@ -211,6 +210,13 @@ else
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
2.7.4

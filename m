From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:29 +0100
Subject: [Buildroot] [PATCH 28/52] package/asterisk: add support for SS7
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <1b2a35c0061465ae1967a99eff1e944eca6e0682.1483093662.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/asterisk/asterisk.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index a307fa2..0a33e61 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -69,7 +69,6 @@ ASTERISK_CONF_OPTS += \
 	--without-sdl \
 	--without-SDL_image \
 	--without-spandsp \
-	--without-ss7 \
 	--without-sqlite \
 	--without-suppserv \
 	--without-tds \
@@ -185,8 +184,16 @@ endif
 ifeq ($(BR2_PACKAGE_DAHDI_LINUX)$(BR2_PACKAGE_DAHDI_TOOLS),yy)
 ASTERISK_DEPENDENCIES += dahdi-linux dahdi-tools
 ASTERISK_CONF_OPTS += --with-dahdi --with-tonezone
+
+ifeq ($(BR2_PACKAGE_LIBSS7),y)
+ASTERISK_DEPENDENCIES += libss7
+ASTERISK_CONF_OPTS += --with-ss7
 else
-ASTERISK_CONF_OPTS += --without-dahdi --without-tonezone
+ASTERISK_CONF_OPTS += --without-ss7
+endif # SS7
+
+else
+ASTERISK_CONF_OPTS += --without-dahdi --without-tonezone --without-ss7
 endif # DAHDI
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
-- 
2.7.4

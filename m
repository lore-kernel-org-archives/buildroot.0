From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:31 +0200
Subject: [Buildroot] [PATCH 25/49 v2] package/asterisk: add support for SS7
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <3b131dae5ba6ee17bac27ddab27b15a4a5cac001.1504993178.git.yann.morin.1998@free.fr>
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
index 27448fda0d..3fe512e0ed 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -80,7 +80,6 @@ ASTERISK_CONF_OPTS = \
 	--without-sdl \
 	--without-SDL_image \
 	--without-spandsp \
-	--without-ss7 \
 	--without-sqlite \
 	--without-suppserv \
 	--without-tds \
@@ -203,8 +202,16 @@ endif
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
2.11.0

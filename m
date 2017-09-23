From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add support for SS7
Message-ID: <20170923171328.2970980330@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66e632f77c0db2656769fca2a3e6845f6cf0ccb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 55370c4..20ae502 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -87,7 +87,6 @@ ASTERISK_CONF_OPTS = \
 	--without-sdl \
 	--without-SDL_image \
 	--without-spandsp \
-	--without-ss7 \
 	--without-sqlite \
 	--without-suppserv \
 	--without-tds \
@@ -197,8 +196,16 @@ endif
 ifeq ($(BR2_PACKAGE_DAHDI_LINUX)$(BR2_PACKAGE_DAHDI_TOOLS),yy)
 ASTERISK_DEPENDENCIES += dahdi-linux dahdi-tools
 ASTERISK_CONF_OPTS += --with-dahdi --with-tonezone
+
+ifeq ($(BR2_PACKAGE_LIBSS7),y)
+ASTERISK_DEPENDENCIES += libss7
+ASTERISK_CONF_OPTS += --with-ss7
+else
+ASTERISK_CONF_OPTS += --without-ss7
+endif # SS7
+
 else
-ASTERISK_CONF_OPTS += --without-dahdi --without-tonezone
+ASTERISK_CONF_OPTS += --without-dahdi --without-tonezone --without-ss7
 endif # DAHDI
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)

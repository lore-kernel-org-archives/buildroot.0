From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 15:13:29 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional spandsp
 support
Message-ID: <20181009131225.1D5738E62F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0b5c2b8e3e7c5bc4f27d6d6ca43def085a55b00
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index ea779cc8f6..4ed85743b0 100644
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
 ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 ASTERISK_DEPENDENCIES += speex
 ASTERISK_CONF_OPTS += --with-speex --with-speexdsp

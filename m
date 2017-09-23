From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional speex
	dependency
Message-ID: <20170923171327.6219F81077@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f1c340311768fa3a94605086e5c99cb1733ce93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 2278d04..1ac1f49 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -93,8 +93,6 @@ ASTERISK_CONF_OPTS = \
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

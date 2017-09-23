From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional
	freeradius-client dependency
Message-ID: <20170923171327.B47B68103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5a532b0291dda3442c43c56d8f5fb5b88e5307ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 5ccd451..f5efdfa 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -84,7 +84,6 @@ ASTERISK_CONF_OPTS = \
 	--without-popt \
 	--without-pri \
 	--without-pwlib \
-	--without-radius \
 	--without-resample \
 	--without-sdl \
 	--without-SDL_image \
@@ -191,6 +190,13 @@ else
 ASTERISK_CONF_OPTS += --without-portaudio
 endif
 
+ifeq ($(BR2_PACKAGE_FREERADIUS_CLIENT),y)
+ASTERISK_DEPENDENCIES += freeradius-client
+ASTERISK_CONF_OPTS += --with-radius
+else
+ASTERISK_CONF_OPTS += --without-radius
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 23 Sep 2017 19:20:18 +0200
Subject: [Buildroot] [git commit] package/asterisk: add optional libsrtp
	dependency
Message-ID: <20170923171327.C3B2A8103C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ebab72bbf0827e95f9a16269a2f8509cdfa18a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index f5efdfa..e674565 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -90,7 +90,6 @@ ASTERISK_CONF_OPTS = \
 	--without-spandsp \
 	--without-ss7 \
 	--without-sqlite \
-	--without-srtp \
 	--without-suppserv \
 	--without-tds \
 	--without-termcap \
@@ -211,6 +210,13 @@ else
 ASTERISK_CONF_OPTS += --without-speex  --without-speexdsp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBSRTP),y)
+ASTERISK_DEPENDENCIES += libsrtp
+ASTERISK_CONF_OPTS += --with-srtp
+else
+ASTERISK_CONF_OPTS += --without-srtp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
 ASTERISK_DEPENDENCIES += libvorbis
 ASTERISK_CONF_OPTS += --with-vorbis

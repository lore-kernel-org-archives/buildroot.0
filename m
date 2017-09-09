From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:25 +0200
Subject: [Buildroot] [PATCH 19/49 v2] package/asterisk: add optional libsrtp
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <7821625ef8325fbc5571777401b8ca627c949e83.1504993178.git.yann.morin.1998@free.fr>
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
index 611eb673a7..5a9eb2ced3 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -83,7 +83,6 @@ ASTERISK_CONF_OPTS = \
 	--without-spandsp \
 	--without-ss7 \
 	--without-sqlite \
-	--without-srtp \
 	--without-suppserv \
 	--without-tds \
 	--without-termcap \
@@ -217,6 +216,13 @@ else
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
-- 
2.11.0

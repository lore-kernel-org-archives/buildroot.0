From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:12 +0200
Subject: [Buildroot] [PATCH 06/49 v2] package/asterisk: add optional
	alsa-lib dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <911c2719d8696ece400cdd7cb6e52dd4ce03dbce.1504993178.git.yann.morin.1998@free.fr>
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
index f947362906..6e68cd1912 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -41,7 +41,6 @@ ASTERISK_CONF_OPTS = \
 	--disable-internal-poll \
 	--disable-asteriskssl \
 	--disable-rpath \
-	--without-asound \
 	--without-bfd \
 	--without-bluetooth \
 	--without-cap \
@@ -137,6 +136,13 @@ else
 ASTERISK_CONF_OPTS += --without-gsm
 endif
 
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+ASTERISK_DEPENDENCIES += alsa-lib
+ASTERISK_CONF_OPTS += --with-asound
+else
+ASTERISK_CONF_OPTS += --without-asound
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ASTERISK_DEPENDENCIES += openssl
 ASTERISK_CONF_OPTS += --with-ssl
-- 
2.11.0

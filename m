From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:10 +0100
Subject: [Buildroot] [PATCH 09/52] package/asterisk: add optional alsa-lib
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <9fc16423a0b1e040077c6ccab1f488fceff4acf0.1483093662.git.yann.morin.1998@free.fr>
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
index 7028012..2eb9c7a 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -30,7 +30,6 @@ ASTERISK_CONF_OPTS += \
 	--disable-internal-poll \
 	--disable-asteriskssl \
 	--disable-rpath \
-	--without-asound \
 	--without-bfd \
 	--without-bluetooth \
 	--without-cap \
@@ -120,6 +119,13 @@ else
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
2.7.4

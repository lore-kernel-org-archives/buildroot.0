From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:22 +0200
Subject: [Buildroot] [PATCH 16/49 v2] package/asterisk: add optional libical
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <4b3294b4dc5c3199391553adbccb8a302de6356f.1504993178.git.yann.morin.1998@free.fr>
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
index 99f66aeeb0..279b2b2eb3 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -50,7 +50,6 @@ ASTERISK_CONF_OPTS = \
 	--without-gmime \
 	--without-h323 \
 	--without-hoard \
-	--without-ical \
 	--without-iconv \
 	--without-iksemel \
 	--without-imap \
@@ -141,6 +140,13 @@ else
 ASTERISK_CONF_OPTS += --without-bluetooth
 endif
 
+ifeq ($(BR2_PACKAGE_LIBICAL),y)
+ASTERISK_DEPENDENCIES += libical
+ASTERISK_CONF_OPTS += --with-ical
+else
+ASTERISK_CONF_OPTS += --without-ical
+endif
+
 ifeq ($(BR2_PACKAGE_LIBILBC),y)
 ASTERISK_DEPENDENCIES += libilbc
 ASTERISK_CONF_OPTS += --with-ilbc
-- 
2.11.0

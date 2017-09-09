From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:16 +0200
Subject: [Buildroot] [PATCH 10/49 v2] package/asterisk: add optional
	bluez_utils dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <691301e95e9cf693dc300f131e107c438c10432c.1504993178.git.yann.morin.1998@free.fr>
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
index e632863138..cdcb18f5a5 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -42,7 +42,6 @@ ASTERISK_CONF_OPTS = \
 	--disable-asteriskssl \
 	--disable-rpath \
 	--without-bfd \
-	--without-bluetooth \
 	--without-cap \
 	--without-cpg \
 	--without-curses \
@@ -141,6 +140,13 @@ else
 ASTERISK_CONF_OPTS += --without-asound
 endif
 
+ifeq ($(BR2_PACKAGE_BLUEZ_UTILS),y)
+ASTERISK_DEPENDENCIES += bluez_utils
+ASTERISK_CONF_OPTS += --with-bluetooth
+else
+ASTERISK_CONF_OPTS += --without-bluetooth
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 ASTERISK_DEPENDENCIES += libcurl
 ASTERISK_CONF_OPTS += --with-libcurl
-- 
2.11.0

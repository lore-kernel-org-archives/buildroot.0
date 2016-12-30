From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:14 +0100
Subject: [Buildroot] [PATCH 13/52] package/asterisk: add optional
	bluez_utils dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <4e53ca31668c56d8a6dcf3fc8db8cd90b58f803a.1483093662.git.yann.morin.1998@free.fr>
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
index 7a30663..8aa1cb2 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -31,7 +31,6 @@ ASTERISK_CONF_OPTS += \
 	--disable-asteriskssl \
 	--disable-rpath \
 	--without-bfd \
-	--without-bluetooth \
 	--without-cap \
 	--without-cpg \
 	--without-curses \
@@ -123,6 +122,13 @@ else
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
2.7.4

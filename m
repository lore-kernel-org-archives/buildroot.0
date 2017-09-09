From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:20 +0200
Subject: [Buildroot] [PATCH 14/49 v2] package/asterisk: add optional libilbc
	dependency
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <e8a80370d0d41b49efcd7f57a9fe933ddb6601cb.1504993178.git.yann.morin.1998@free.fr>
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
index 342c642feb..bd5b794117 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -46,7 +46,6 @@ ASTERISK_CONF_OPTS = \
 	--without-cpg \
 	--without-curses \
 	--without-dahdi \
-	--without-ilbc \
 	--without-gtk2 \
 	--without-gmime \
 	--without-h323 \
@@ -143,6 +142,13 @@ else
 ASTERISK_CONF_OPTS += --without-bluetooth
 endif
 
+ifeq ($(BR2_PACKAGE_LIBILBC),y)
+ASTERISK_DEPENDENCIES += libilbc
+ASTERISK_CONF_OPTS += --with-ilbc
+else
+ASTERISK_CONF_OPTS += --without-ilbc
+endif
+
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 ASTERISK_DEPENDENCIES += libcurl
 ASTERISK_CONF_OPTS += --with-libcurl
-- 
2.11.0

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:18 +0100
Subject: [Buildroot] [PATCH 17/52] package/asterisk: add optional libilbc
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <39440b5ec9977d496bb3d5ba89b821f2824e7c2b.1483093662.git.yann.morin.1998@free.fr>
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
index aa04c7e..642fe61 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -35,7 +35,6 @@ ASTERISK_CONF_OPTS += \
 	--without-cpg \
 	--without-curses \
 	--without-dahdi \
-	--without-ilbc \
 	--without-gtk2 \
 	--without-gmime \
 	--without-h323 \
@@ -125,6 +124,13 @@ else
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
2.7.4

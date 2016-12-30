From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:40 +0100
Subject: [Buildroot] [PATCH 39/52] package/asterisk: add optional netsnmp
	dependency
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <6d759fe2e669b23a25e873f7aa34f183e08c9a74.1483093662.git.yann.morin.1998@free.fr>
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
index aff6ffc..a2ca5a8 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -54,7 +54,6 @@ ASTERISK_CONF_OPTS += \
 	--without-mysqlclient \
 	--without-nbs \
 	--without-neon29 \
-	--without-netsnmp \
 	--without-newt \
 	--without-openr2 \
 	--without-osptk \
@@ -157,6 +156,13 @@ else
 ASTERISK_CONF_OPTS += --without-neon
 endif
 
+ifeq ($(BR2_PACKAGE_NETSNMP),y)
+ASTERISK_DEPENDENCIES += netsnmp
+ASTERISK_CONF_OPTS += --with-netsnmp
+else
+ASTERISK_CONF_OPTS += --without-netsnmp
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOGG),y)
 ASTERISK_DEPENDENCIES += libogg
 ASTERISK_CONF_OPTS += --with-ogg
-- 
2.7.4

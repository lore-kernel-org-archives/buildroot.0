From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Dec 2016 11:29:48 +0100
Subject: [Buildroot] [PATCH 47/52] package/asterisk: add optional pjsip
	support
In-Reply-To: <cover.1483093662.git.yann.morin.1998@free.fr>
References: <cover.1483093662.git.yann.morin.1998@free.fr>
Message-ID: <927d0973ab4a2ada00a83680da29690569d25704.1483093662.git.yann.morin.1998@free.fr>
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
index a2ca5a8..bdc904c 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -59,7 +59,6 @@ ASTERISK_CONF_OPTS += \
 	--without-osptk \
 	--without-oss \
 	--without-postgres \
-	--without-pjproject \
 	--without-popt \
 	--without-pwlib \
 	--without-resample \
@@ -222,6 +221,13 @@ else
 ASTERISK_CONF_OPTS += --without-ssl
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP),y)
+ASTERISK_DEPENDENCIES += libpjsip
+ASTERISK_CONF_OPTS += --with-pjproject
+else
+ASTERISK_CONF_OPTS += --without-pjproject
+endif
+
 ifeq ($(BR2_PACKAGE_SPANDSP),y)
 ASTERISK_DEPENDENCIES += spandsp
 ASTERISK_CONF_OPTS += --with-spandsp
-- 
2.7.4

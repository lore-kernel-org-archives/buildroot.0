From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  9 Sep 2017 23:39:50 +0200
Subject: [Buildroot] [PATCH 44/49 v2] package/asterisk: add optional pjsip
	support
In-Reply-To: <cover.1504993178.git.yann.morin.1998@free.fr>
References: <cover.1504993178.git.yann.morin.1998@free.fr>
Message-ID: <3d6f2d5bc9faedd731435a6302a658c1315029f1.1504993178.git.yann.morin.1998@free.fr>
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
index 284b338cb3..9327451254 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -70,7 +70,6 @@ ASTERISK_CONF_OPTS = \
 	--without-osptk \
 	--without-oss \
 	--without-postgres \
-	--without-pjproject \
 	--without-popt \
 	--without-pwlib \
 	--without-resample \
@@ -240,6 +239,13 @@ else
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
2.11.0

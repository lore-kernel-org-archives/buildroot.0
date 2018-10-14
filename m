From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 14 Oct 2018 11:02:01 +0200
Subject: [Buildroot] [PATCH v3 9/9] package/asterisk: add optional
 dependency to libpjsip
In-Reply-To: <20181014090202.31122-1-bernd.kuhls@t-online.de>
References: <20181014090202.31122-1-bernd.kuhls@t-online.de>
Message-ID: <20181014090202.31122-9-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: initial revision

 package/asterisk/asterisk.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
index 8a46438f92..cb6dbf86d9 100644
--- a/package/asterisk/asterisk.mk
+++ b/package/asterisk/asterisk.mk
@@ -76,7 +76,6 @@ ASTERISK_CONF_OPTS = \
 	--without-osptk \
 	--without-oss \
 	--without-postgres \
-	--without-pjproject \
 	--without-pjproject-bundled \
 	--without-popt \
 	--without-resample \
@@ -180,6 +179,13 @@ else
 ASTERISK_CONF_OPTS += --without-ogg
 endif
 
+ifeq ($(BR2_PACKAGE_LIBPJSIP),y)
+ASTERISK_DEPENDENCIES += libpjsip
+ASTERISK_CONF_OPTS += --with-pjproject
+else
+ASTERISK_CONF_OPTS += --without-pjproject
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 ASTERISK_DEPENDENCIES += opus
 ASTERISK_CONF_OPTS += --with-opus
-- 
2.19.1

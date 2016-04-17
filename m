From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Apr 2016 17:24:25 +0200
Subject: [Buildroot] [PATCH v15 03/27] package/freeswitch: add optional
	dependency to libedit
In-Reply-To: <1460906689-29900-1-git-send-email-bernd.kuhls@t-online.de>
References: <1460906689-29900-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1460906689-29900-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 560ca17..6c2bbab 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -69,7 +69,6 @@ FREESWITCH_CONF_ENV += \
 	ac_cv_gcc_supports_w_no_unused_result=no
 
 FREESWITCH_CONF_OPTS = \
-	--disable-core-libedit-support \
 	--disable-core-odbc-support \
 	--disable-libvpx \
 	--disable-libyuv \
@@ -160,4 +159,11 @@ define FREESWITCH_ENABLE_MODULES
 endef
 FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
 
+ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+FREESWITCH_DEPENDENCIES += libedit
+FREESWITCH_CONF_OPTS += --enable-core-libedit-support
+else
+FREESWITCH_CONF_OPTS += --disable-core-libedit-support
+endif
+
 $(eval $(autotools-package))
-- 
2.8.0.rc3

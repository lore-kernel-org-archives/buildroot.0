From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 27 Jun 2016 07:29:10 +0200
Subject: [Buildroot] [PATCH v2 2/4] package/kodi: Add suboption to control
	MySQL support
In-Reply-To: <1467005352-14070-1-git-send-email-bernd.kuhls@t-online.de>
References: <1467005352-14070-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1467005352-14070-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: rebased series, no changes to this patch

 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index a44ef5a..281de24 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -173,6 +173,12 @@ config BR2_PACKAGE_KODI_LIBNFS
 comment "nfs support needs a toolchain w/ threads support"
 	depends on !(BR2_TOOLCHAIN_HAS_THREADS || BR2_TOOLCHAIN_HAS_NATIVE_RPC)
 
+config BR2_PACKAGE_KODI_MYSQL
+	bool "mysql"
+	select BR2_PACKAGE_MYSQL
+	help
+	  Enable MySQL support
+
 config BR2_PACKAGE_KODI_RTMPDUMP
 	bool "rtmp"
 	select BR2_PACKAGE_RTMPDUMP
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 8a3b0bf..9d6b966 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -78,7 +78,7 @@ KODI_CONF_OPTS +=  \
 	--disable-vtbdecoder \
 	--enable-optimizations
 
-ifeq ($(BR2_PACKAGE_MYSQL),y)
+ifeq ($(BR2_PACKAGE_KODI_MYSQL),y)
 KODI_CONF_OPTS += --enable-mysql
 KODI_CONF_ENV += ac_cv_path_MYSQL_CONFIG="$(STAGING_DIR)/usr/bin/mysql_config"
 KODI_DEPENDENCIES += mysql
-- 
2.8.1

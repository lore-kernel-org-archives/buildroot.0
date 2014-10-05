From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:38:53 +0200
Subject: [Buildroot] [PATCH v2 05/16] package/apr-util: add optional
	dependency to berkeleydb
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412530744-20649-6-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr-util/apr-util.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index 6bc6ee9..c65b0fb 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -18,6 +18,13 @@ APR_UTIL_CONFIG_SCRIPTS = apu-1-config
 # features.
 APR_UTIL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)
 
+ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
+APR_UTIL_CONF_OPTS += --with-dbm=db53 --with-berkeley-db="$(STAGING_DIR)/usr"
+APR_UTIL_DEPENDENCIES += berkeleydb
+else
+APR_UTIL_CONF_OPTS += --without-berkeley-db
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 APR_UTIL_CONF_OPTS += --with-sqlite3="$(STAGING_DIR)/usr"
 APR_UTIL_DEPENDENCIES += sqlite
-- 
1.7.10.4

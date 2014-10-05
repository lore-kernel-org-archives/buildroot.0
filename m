From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  5 Oct 2014 19:38:51 +0200
Subject: [Buildroot] [PATCH v2 03/16] package/apr-util: Remove unused
	dependencies to neon and zlib
In-Reply-To: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
References: <1412530744-20649-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1412530744-20649-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/apr-util/Config.in   |    3 ---
 package/apr-util/apr-util.mk |    2 +-
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index 6a7c00c..f54e85a 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -2,9 +2,6 @@ config BR2_PACKAGE_APR_UTIL
 	bool "apr-util"
 	select BR2_PACKAGE_APR
 	select BR2_PACKAGE_SQLITE
-	select BR2_PACKAGE_NEON
-	select BR2_PACKAGE_NEON_ZLIB
-	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_EXPAT
 	# apr really needs shared library support
 	depends on !BR2_PREFER_STATIC_LIB
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index c8c75a2..1b85dae 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -9,7 +9,7 @@ APR_UTIL_SITE = http://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
 APR_UTIL_INSTALL_STAGING = YES
-APR_UTIL_DEPENDENCIES = apr expat sqlite neon zlib
+APR_UTIL_DEPENDENCIES = apr expat sqlite
 APR_UTIL_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config
 APR_UTIL_CONFIG_SCRIPTS = apu-1-config
-- 
1.7.10.4

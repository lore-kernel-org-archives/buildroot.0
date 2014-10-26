From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:18:58 +0100
Subject: [Buildroot] [git commit] package/apr-util: Remove unused
	dependencies to neon and zlib
Message-ID: <20141026213050.B1FCBB0D64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a45e0d50ac8c1660a04d699c7caa59d43fdb0160
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr-util/Config.in   |    3 ---
 package/apr-util/apr-util.mk |    2 +-
 2 files changed, 1 insertions(+), 4 deletions(-)

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

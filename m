From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 22:18:25 +0100
Subject: [Buildroot] [git commit] package/apr-util: Add expat hard-dependency
Message-ID: <20141026211831.5E369B0BFF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58cafc149fdef0113f75d14bbbedc870f3d9f021
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When expat is missing, apr-util compiles its own expat

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apr-util/Config.in   |    1 +
 package/apr-util/apr-util.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/apr-util/Config.in b/package/apr-util/Config.in
index fcef693..6a7c00c 100644
--- a/package/apr-util/Config.in
+++ b/package/apr-util/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_APR_UTIL
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_NEON_ZLIB
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_EXPAT
 	# apr really needs shared library support
 	depends on !BR2_PREFER_STATIC_LIB
 	depends on BR2_USE_MMU # apr
diff --git a/package/apr-util/apr-util.mk b/package/apr-util/apr-util.mk
index bdb3004..c8c75a2 100644
--- a/package/apr-util/apr-util.mk
+++ b/package/apr-util/apr-util.mk
@@ -9,7 +9,7 @@ APR_UTIL_SITE = http://archive.apache.org/dist/apr
 APR_UTIL_LICENSE = Apache-2.0
 APR_UTIL_LICENSE_FILES = LICENSE
 APR_UTIL_INSTALL_STAGING = YES
-APR_UTIL_DEPENDENCIES = apr sqlite neon zlib
+APR_UTIL_DEPENDENCIES = apr expat sqlite neon zlib
 APR_UTIL_CONF_OPTS = \
 	--with-apr=$(STAGING_DIR)/usr/bin/apr-1-config
 APR_UTIL_CONFIG_SCRIPTS = apu-1-config

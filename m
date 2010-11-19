From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 19 Nov 2010 10:31:21 +0100
Subject: [Buildroot] [git commit master 1/1] webkit: needs libcurl,
	not the curl binary
Message-ID: <20101119093155.9C2758D235@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=e152912065332cd24ff0a03b8ae659253c0a01c1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webkit/Config.in |    2 +-
 package/webkit/webkit.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webkit/Config.in b/package/webkit/Config.in
index 812e6f2..34071e4 100644
--- a/package/webkit/Config.in
+++ b/package/webkit/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_WEBKIT
 	depends on BR2_USE_WCHAR
 	depends on BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
-	select BR2_PACKAGE_CURL
+	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_LIBXSLT
 	select BR2_PACKAGE_SQLITE
diff --git a/package/webkit/webkit.mk b/package/webkit/webkit.mk
index 247ce77..3f4e8fe 100644
--- a/package/webkit/webkit.mk
+++ b/package/webkit/webkit.mk
@@ -10,7 +10,7 @@ WEBKIT_SITE = http://www.webkitgtk.org
 WEBKIT_INSTALL_STAGING = YES
 WEBKIT_LIBTOOL_PATCH = NO
 
-WEBKIT_DEPENDENCIES = host-flex host-gperf icu curl libxml2 libxslt	\
+WEBKIT_DEPENDENCIES = host-flex host-gperf icu libcurl libxml2 libxslt	\
 			libgtk2 sqlite enchant libsoup jpeg libgail
 
 WEBKIT_CONF_ENV = ac_cv_path_icu_config=$(STAGING_DIR)/usr/bin/icu-config
-- 
1.7.2.2

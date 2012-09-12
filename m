From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 12 Sep 2012 10:51:54 -0300
Subject: [Buildroot] [PATCH 1/3] hiawatha: bump to version 8.5
Message-ID: <1347457916-23684-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 .../hiawatha-support-for-external-polarssl.patch   |   26 ++++++++++----------
 package/hiawatha/hiawatha.mk                       |    4 ++-
 2 files changed, 16 insertions(+), 14 deletions(-)

diff --git a/package/hiawatha/hiawatha-support-for-external-polarssl.patch b/package/hiawatha/hiawatha-support-for-external-polarssl.patch
index edc774b..5441a52 100644
--- a/package/hiawatha/hiawatha-support-for-external-polarssl.patch
+++ b/package/hiawatha/hiawatha-support-for-external-polarssl.patch
@@ -9,22 +9,22 @@ This patch adds a ENABLE_SSL_EXTERNAL option, which, when used in
 addition to ENABLE_SSL, tells Hiawatha's build system to link against
 the already existing PolarSSL library instead of building its own.
 
-[Gustavo]: Update for version 8.3
+[Gustavo]: Update for version 8.5
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 
-diff -Nura hiawatha-8.3.orig//CMakeLists.txt hiawatha-8.3/CMakeLists.txt
---- hiawatha-8.3.orig//CMakeLists.txt	2012-05-23 14:22:26.000000000 -0300
-+++ hiawatha-8.3/CMakeLists.txt	2012-05-24 08:13:00.007107500 -0300
-@@ -10,6 +10,7 @@
- option(ENABLE_MONITOR "Enable support for the Hiawatha Monitor." off)
- option(ENABLE_RPROXY  "Enable reverse proxy support in Hiawatha." on)
- option(ENABLE_SSL     "Enable SSL (PolarSSL) support in Hiawatha." on)
+diff -Nura hiawatha-8.5.orig/CMakeLists.txt hiawatha-8.5/CMakeLists.txt
+--- hiawatha-8.5.orig/CMakeLists.txt	2012-09-12 09:29:34.347994799 -0300
++++ hiawatha-8.5/CMakeLists.txt	2012-09-12 09:33:15.983118183 -0300
+@@ -9,6 +9,7 @@
+ option(ENABLE_MONITOR  "Enable support for the Hiawatha Monitor." off)
+ option(ENABLE_RPROXY   "Enable reverse proxy support in Hiawatha." on)
+ option(ENABLE_SSL      "Enable SSL (PolarSSL) support in Hiawatha." on)
 +option(ENABLE_SSL_EXTERNAL "Enable SSL (PolarSSL) as an external library." off)
- option(ENABLE_TOOLKIT "Enable the URL toolkit in Hiawatha" on)
- option(ENABLE_XSLT    "Enable XSLT support in Hiawatha." on)
- 
-@@ -85,19 +86,23 @@
+ option(ENABLE_TOMAHAWK "Enable Tomahawk in Hiawatha" off)
+ option(ENABLE_TOOLKIT  "Enable the URL toolkit in Hiawatha" on)
+ option(ENABLE_XSLT     "Enable XSLT support in Hiawatha." on)
+@@ -88,19 +89,23 @@
  
  # PolarSSL
  if(ENABLE_SSL)
@@ -49,7 +49,7 @@ diff -Nura hiawatha-8.3.orig//CMakeLists.txt hiawatha-8.3/CMakeLists.txt
  # Configure files
  configure_file(config.h.in config.h)
  foreach (configfile ${config_files_in})
-@@ -118,7 +123,9 @@
+@@ -121,7 +126,9 @@
  target_link_libraries(hiawatha ${CRYPT_LIBRARY} pthread ${Z_LIBRARY})
  if(ENABLE_SSL)
  	target_link_libraries(hiawatha ${POLARSSL_LIBRARY})
diff --git a/package/hiawatha/hiawatha.mk b/package/hiawatha/hiawatha.mk
index db5b277..03fbc49 100644
--- a/package/hiawatha/hiawatha.mk
+++ b/package/hiawatha/hiawatha.mk
@@ -1,5 +1,7 @@
-HIAWATHA_VERSION = 8.4
+HIAWATHA_VERSION = 8.5
 HIAWATHA_SITE = http://www.hiawatha-webserver.org/files/
+HIAWATHA_LICENSE = GPLv2+
+HIAWATHA_LICENSE_FILES = LICENSE
 
 ifeq ($(BR2_PACKAGE_HIAWATHA_SSL),y)
 HIAWATHA_CONF_OPT += -DENABLE_SSL_EXTERNAL=ON -DENABLE_SSL=ON
-- 
1.7.8.6

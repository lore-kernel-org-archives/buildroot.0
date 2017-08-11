From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Fri, 11 Aug 2017 18:00:49 +0200
Subject: [Buildroot] [PATCH 3/3] package/sysdig: bump to version 0.17.0
In-Reply-To: <1502467249-2861-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1502467249-2861-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <1502467249-2861-4-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps sysdig to version 0.17.0 and updates the
dependencies accordingly.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/sysdig/Config.in   | 5 +++++
 package/sysdig/sysdig.hash | 2 +-
 package/sysdig/sysdig.mk   | 8 +++++---
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
index dfb9db5..8b5ec48 100644
--- a/package/sysdig/Config.in
+++ b/package/sysdig/Config.in
@@ -8,6 +8,11 @@ config BR2_PACKAGE_SYSDIG
 	select BR2_PACKAGE_ZLIB
 	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_JSONCPP
+	select BR2_PACKAGE_LIBCURL
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_JQ
+	select BR2_PACKAGE_LIBB64
 	help
 	  Sysdig is open source, system-level exploration:
 	  capture system state and activity from a running Linux instance,
diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
index f64ef9e..8305413 100644
--- a/package/sysdig/sysdig.hash
+++ b/package/sysdig/sysdig.hash
@@ -1,2 +1,2 @@
 # locally computed
-sha256  e72490eaf413745aef87965a5abb1024908053064f86593b257f12bf5b0d6b97  sysdig-0.1.100.tar.gz
+sha256  f009acc32f2b15fcb0d2267bde6f6de9b3445179003c979ba61a8836abdb78f9  sysdig-0.17.0.tar.gz
diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
index f967727..2d5ad23 100644
--- a/package/sysdig/sysdig.mk
+++ b/package/sysdig/sysdig.mk
@@ -4,13 +4,15 @@
 #
 ################################################################################
 
-SYSDIG_VERSION = 0.1.100
+SYSDIG_VERSION = 0.17.0
 SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
 SYSDIG_LICENSE = GPL-2.0
 SYSDIG_LICENSE_FILES = COPYING
 SYSDIG_CONF_OPTS = -DUSE_BUNDLED_LUAJIT=OFF -DUSE_BUNDLED_ZLIB=OFF \
-	-DUSE_BUNDLED_JSONCPP=OFF -DENABLE_DKMS=OFF
-SYSDIG_DEPENDENCIES = zlib luajit jsoncpp
+	-DUSE_BUNDLED_JSONCPP=OFF -DENABLE_DKMS=OFF -DUSE_BUNDLED_CURL=OFF \
+	-DUSE_BUNDLED_NCURSES=OFF -DUSE_BUNDLED_OPENSSL=OFF \
+	-DUSE_BUNDLED_JQ=OFF -DUSE_BUNDLED_B64=OFF
+SYSDIG_DEPENDENCIES = zlib luajit jsoncpp libcurl ncurses openssl jq libb64
 SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
 
 # sysdig creates the module Makefile from a template, which contains a
-- 
2.7.4

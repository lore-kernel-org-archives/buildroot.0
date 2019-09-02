From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 17:50:59 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/nginx: bump
 version to 1.15.12
Message-ID: <20190902161353.26FCD88EF0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b02e3bebeefd557b17e5d996ac81496946fdcf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

The license file hash has been modified due to copyright year updates:

- * Copyright (C) 2002-2018 Igor Sysoev
- * Copyright (C) 2011-2018 Nginx, Inc.
+ * Copyright (C) 2002-2019 Igor Sysoev
+ * Copyright (C) 2011-2019 Nginx, Inc.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 05ca4c1343d4d2e2a18ad6b9e399414cd14dcb4f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch  | 4 ++--
 package/nginx/nginx.hash                                              | 4 ++--
 package/nginx/nginx.mk                                                | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
index b4d8215b34..747a034aee 100644
--- a/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
+++ b/package/nginx/0005-auto-unix-make-sys_nerr-guessing-cross-friendly.patch
@@ -109,7 +109,7 @@ diff --git a/auto/unix b/auto/unix
 index 7dbf9d1..00a7370 100755
 --- a/auto/unix
 +++ b/auto/unix
-@@ -708,6 +708,10 @@ ngx_feature_incs='#include <errno.h>
+@@ -736,6 +736,10 @@ ngx_feature_incs='#include <errno.h>
                    #include <stdio.h>'
  ngx_feature_path=
  ngx_feature_libs=
@@ -120,7 +120,7 @@ index 7dbf9d1..00a7370 100755
  ngx_feature_test='printf("%d", sys_nerr);'
  . auto/feature
  
-@@ -756,6 +760,12 @@ if [ $ngx_found = no ]; then
+@@ -784,6 +788,12 @@ if [ $ngx_found = no ]; then
      . auto/feature
  fi
  
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 40dba402e2..114bf292ce 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93	nginx-1.15.7.tar.gz
+sha256	3d5b90aa17de1700709ae4ec6c4d73d87c888b06c510391bf7104b006fdb2abe	nginx-1.15.12.tar.gz
 # License files, locally calculated
-sha256	e18f05bcaad47528f8b21861d4a0fb9815ca1bbb4be946c51a51d36623758bcc	LICENSE
+sha256	28ad30e2f64bd89ac1287b4606906bb99ed04d9f4e13fb6564a0be9c8a23f509	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 3bdd92b3f5..b8e41b8089 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.15.7
+NGINX_VERSION = 1.15.12
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE

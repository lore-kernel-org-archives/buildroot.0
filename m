From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Jul 2017 11:08:12 +0200
Subject: [Buildroot] [PATCH] nginx: security bump to version 1.12.1
Message-ID: <20170714090812.18154-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2017-7529 - Nginx versions since 0.5.6 up to and including 1.13.2
are vulnerable to integer overflow vulnerability in nginx range filter
module resulting into leak of potentially sensitive information triggered by
specially crafted request.

For more details, see:
http://mailman.nginx.org/pipermail/nginx-announce/2017/000200.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index ffc5a279c1..22e4007b5f 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	b4222e26fdb620a8d3c3a3a8b955e08b713672e1bc5198d1e4f462308a795b30	nginx-1.12.0.tar.gz
+sha256	8793bf426485a30f91021b6b945a9fd8a84d87d17b566562c3797aba8fac76fb	nginx-1.12.1.tar.gz
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 54126ab912..ceb80229d3 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.12.0
+NGINX_VERSION = 1.12.1
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
-- 
2.11.0

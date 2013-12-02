From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  1 Dec 2013 21:27:59 -0300
Subject: [Buildroot] [PATCH] libcurl: bump to version 7.33.0
Message-ID: <1385944079-16726-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcurl/libcurl-0001-CVE-2013-4545.patch | 32 ------------------------
 package/libcurl/libcurl.mk                       |  2 +-
 2 files changed, 1 insertion(+), 33 deletions(-)
 delete mode 100644 package/libcurl/libcurl-0001-CVE-2013-4545.patch

diff --git a/package/libcurl/libcurl-0001-CVE-2013-4545.patch b/package/libcurl/libcurl-0001-CVE-2013-4545.patch
deleted file mode 100644
index 39545fe..0000000
--- a/package/libcurl/libcurl-0001-CVE-2013-4545.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3c3622b66221d89509cffaa693fc7dcd5c5b96cf Mon Sep 17 00:00:00 2001
-From: Daniel Stenberg <daniel@haxx.se>
-Date: Wed, 2 Oct 2013 15:31:10 +0200
-Subject: [PATCH] OpenSSL: acknowledge CURLOPT_SSL_VERIFYHOST without
- VERIFYPEER
-
-Setting only CURLOPT_SSL_VERIFYHOST without CURLOPT_SSL_VERIFYPEER set
-should still verify that the host name fields in the server certificate
-is fine or return failure.
-
-Bug: http://curl.haxx.se/mail/lib-2013-10/0002.html
-Reported-by: Ishan SinghLevett
----
- lib/ssluse.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/lib/ssluse.c b/lib/ssluse.c
-index 4f3c1e1..9974ac8 100644
---- a/lib/ssluse.c
-+++ b/lib/ssluse.c
-@@ -2351,7 +2351,7 @@ ossl_connect_step3(struct connectdata *conn,
-    * operations.
-    */
- 
--  if(!data->set.ssl.verifypeer)
-+  if(!data->set.ssl.verifypeer && !data->set.ssl.verifyhost)
-     (void)servercert(conn, connssl, FALSE);
-   else
-     retcode = servercert(conn, connssl, TRUE);
--- 
-1.8.3.2
-
diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
index 059f08a..afe39d5 100644
--- a/package/libcurl/libcurl.mk
+++ b/package/libcurl/libcurl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCURL_VERSION = 7.32.0
+LIBCURL_VERSION = 7.33.0
 LIBCURL_SOURCE = curl-$(LIBCURL_VERSION).tar.bz2
 LIBCURL_SITE = http://curl.haxx.se/download
 LIBCURL_DEPENDENCIES = host-pkgconf \
-- 
1.8.3.2

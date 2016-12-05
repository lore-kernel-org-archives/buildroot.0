From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  5 Dec 2016 15:28:24 +0100
Subject: [Buildroot] [PATCH 1/2] nginx-naxsi: depends on
	BR2_PACKAGE_NGINX_HTTP
Message-ID: <1480948105-26691-1-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds XSS and SQLi protection to Nginx HTTP server.
So, it makes sense iff the HTTP part of nginx is enabled.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/nginx-naxsi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
index 5ae5497..e9907aa 100644
--- a/package/nginx-naxsi/Config.in
+++ b/package/nginx-naxsi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGINX_NAXSI
 	bool "nginx-naxsi"
+        depends on BR2_PACKAGE_NGINX_HTTP
 	# uses pcre, so nginx needs to be built with pcre support
 	select BR2_PACKAGE_PCRE
 	help
-- 
2.7.4

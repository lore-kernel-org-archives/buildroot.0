From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  5 Dec 2016 15:28:25 +0100
Subject: [Buildroot] [PATCH 2/2] nginx-dav-ext: depends on
	BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
In-Reply-To: <1480948105-26691-1-git-send-email-johan.oudinet@gmail.com>
References: <1480948105-26691-1-git-send-email-johan.oudinet@gmail.com>
Message-ID: <1480948105-26691-2-git-send-email-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package adds missing WebDAB commands to NGINX. So, it makes sense
iff Nginx is compiled with the WebDAV support.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/nginx-dav-ext/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx-dav-ext/Config.in b/package/nginx-dav-ext/Config.in
index bf197dc..8761e2f 100644
--- a/package/nginx-dav-ext/Config.in
+++ b/package/nginx-dav-ext/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGINX_DAV_EXT
 	bool "nginx-dav-ext"
+        depends on BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
 	select BR2_PACKAGE_EXPAT
 	help
 	  NGINX WebDAV missing commands support (PROPFIND & OPTIONS).
-- 
2.7.4

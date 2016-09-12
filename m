From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 12 Sep 2016 21:23:24 +0200
Subject: [Buildroot] [PATCH 3/3] package/nginx-naxsi: add missing pcre
	dependency
In-Reply-To: <20160912192324.23682-1-s.martin49@gmail.com>
References: <20160912192324.23682-1-s.martin49@gmail.com>
Message-ID: <20160912192324.23682-3-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/9c7/9c7bad6831b09251af81e2bbfc595a241df87c70/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/nginx-naxsi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
index 2f7c2da..6c175eb 100644
--- a/package/nginx-naxsi/Config.in
+++ b/package/nginx-naxsi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGINX_NAXSI
 	bool "nginx-naxsi"
+	select BR2_PACKAGE_PCRE
 	help
 	  NAXSI means Nginx Anti XSS & SQL Injection.
 
-- 
2.9.3

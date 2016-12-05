From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 21:33:43 +0100
Subject: [Buildroot] [git commit] nginx-dav-ext: depends on
	BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
Message-ID: <20161205203358.D09A5800E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1547eea294058a6e5f2ed06df590b43ac601ff71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package adds missing WebDAB commands to NGINX. So, it makes sense
iff Nginx is compiled with the WebDAV support.

Fixes:

  http://autobuild.buildroot.net/results/6e997faf553dc70d0aa1ee811fd669650349cba2/

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[Thomas: fix indentation, add autobuilder reference.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx-dav-ext/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx-dav-ext/Config.in b/package/nginx-dav-ext/Config.in
index bf197dc..1e60321 100644
--- a/package/nginx-dav-ext/Config.in
+++ b/package/nginx-dav-ext/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGINX_DAV_EXT
 	bool "nginx-dav-ext"
+	depends on BR2_PACKAGE_NGINX_HTTP_DAV_MODULE
 	select BR2_PACKAGE_EXPAT
 	help
 	  NGINX WebDAV missing commands support (PROPFIND & OPTIONS).

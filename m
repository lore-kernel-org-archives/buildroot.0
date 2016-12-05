From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 21:32:29 +0100
Subject: [Buildroot] [git commit] nginx-naxsi: depends on
	BR2_PACKAGE_NGINX_HTTP
Message-ID: <20161205203358.BC82F81D56@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1dc77b605874a016afb219f0bdcf1578c2826d53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package adds XSS and SQLi protection to Nginx HTTP server.
So, it makes sense iff the HTTP part of nginx is enabled.

Fixes:

  http://autobuild.buildroot.net/results/1df67325f11a6f1c88d0c9cc5f4feab0b57bc2a6/

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
[Thomas: fix indentation, add autobuilder reference.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx-naxsi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
index 5ae5497..fc2ba9b 100644
--- a/package/nginx-naxsi/Config.in
+++ b/package/nginx-naxsi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGINX_NAXSI
 	bool "nginx-naxsi"
+	depends on BR2_PACKAGE_NGINX_HTTP
 	# uses pcre, so nginx needs to be built with pcre support
 	select BR2_PACKAGE_PCRE
 	help

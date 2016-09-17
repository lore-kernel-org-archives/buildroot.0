From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Sep 2016 12:09:31 +0200
Subject: [Buildroot] [git commit] nginx-naxsi: clarify pcre dependency
Message-ID: <20160917101140.93D6881E64@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b715991c2382a75d50f1472a4a556954d64eb382
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is not directly obvious why we select pcre but not add it to the .mk
file, so add a comment to clarify.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx-naxsi/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nginx-naxsi/Config.in b/package/nginx-naxsi/Config.in
index 6c175eb..5ae5497 100644
--- a/package/nginx-naxsi/Config.in
+++ b/package/nginx-naxsi/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGINX_NAXSI
 	bool "nginx-naxsi"
+	# uses pcre, so nginx needs to be built with pcre support
 	select BR2_PACKAGE_PCRE
 	help
 	  NAXSI means Nginx Anti XSS & SQL Injection.

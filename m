From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 10 Oct 2014 08:44:56 +0200
Subject: [Buildroot] [git commit] nginx: Depends on MMU
Message-ID: <20141010100415.D699AB1D2D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c9737ee7f8010e5fa9ba8b6e8c849e0ef6c4d371
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package needs MMU. Hence added dependency on BR2_USE_MMU

Fixes:
http://autobuild.buildroot.net/results/224/2240f11fc52e07ff64913844078e2616842a63dc//

[Peter: also add dependency to menuconfig option]
Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/Config.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index da9fd01..30cc9d2 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -1,9 +1,11 @@
 comment "nginx needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 
 menuconfig BR2_PACKAGE_NGINX
 	bool "nginx"
 	depends on BR2_LARGEFILE
+	depends on BR2_USE_MMU # fork()
 	help
 	  nginx is an HTTP and reverse proxy server, as well as a mail proxy
 	  server.

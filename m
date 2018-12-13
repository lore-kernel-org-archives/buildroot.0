From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 22:20:00 +0100
Subject: [Buildroot] [git commit] nginx: bump to version 1.15.7
Message-ID: <20181213211604.33A8A8D29B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc60c57f6920ce055acb11ef4e3e7c2123ce9bf7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

1.15.7 contains a number of bugfixes. From the changes file:

     *) Bugfix: memory leak on errors during reconfiguration.

    *) Bugfix: in the $upstream_response_time, $upstream_connect_time, and
       $upstream_header_time variables.

    *) Bugfix: a segmentation fault might occur in a worker process if the
       ngx_http_mp4_module was used on 32-bit platforms.

https://nginx.org/en/CHANGES

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index c3e6b6a720..40dba402e2 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	a3d8c67c2035808c7c0d475fffe263db8c353b11521aa7ade468b780ed826cc6	nginx-1.15.6.tar.gz
+sha256	8f22ea2f6c0e0a221b6ddc02b6428a3ff708e2ad55f9361102b1c9f4142bdf93	nginx-1.15.7.tar.gz
 # License files, locally calculated
 sha256	e18f05bcaad47528f8b21861d4a0fb9815ca1bbb4be946c51a51d36623758bcc	LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 5253174478..3bdd92b3f5 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.15.6
+NGINX_VERSION = 1.15.7
 NGINX_SITE = http://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Dec 2016 23:34:17 +0100
Subject: [Buildroot] [git commit] nginx: group the external modules enabling
	logic
Message-ID: <20161204223548.037C7819F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=47bf7119d566ececc97cc74bdaa45596f965b7f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit moves the logic that allows to enable the naxsi external
module below the "external modules" comment, which was already used for
the upload and dav-ext modules.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx/nginx.mk | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 79cc4ed..b7384a2 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -156,11 +156,6 @@ else
 NGINX_CONF_OPTS += --without-http_gzip_module
 endif
 
-ifeq ($(BR2_PACKAGE_NGINX_NAXSI),y)
-NGINX_DEPENDENCIES += nginx-naxsi
-NGINX_CONF_OPTS += --add-module=$(NGINX_NAXSI_DIR)/naxsi_src
-endif
-
 ifeq ($(BR2_PACKAGE_NGINX_HTTP_REWRITE_MODULE),y)
 NGINX_DEPENDENCIES += pcre
 else
@@ -250,6 +245,11 @@ NGINX_CONF_OPTS += --add-module=$(NGINX_DAV_EXT_DIR)
 NGINX_DEPENDENCIES += nginx-dav-ext
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_NAXSI),y)
+NGINX_DEPENDENCIES += nginx-naxsi
+NGINX_CONF_OPTS += --add-module=$(NGINX_NAXSI_DIR)/naxsi_src
+endif
+
 # Debug logging
 NGINX_CONF_OPTS += $(if $(BR2_PACKAGE_NGINX_DEBUG),--with-debug)
 

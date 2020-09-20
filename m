From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 20 Sep 2020 15:31:41 +0200
Subject: [Buildroot] [git commit] package/nginx: add random modules
Message-ID: <20200920132339.A6E4C82658@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0cf6121d5174e7c8a68092fe8e11a9505f12f356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

http_upstream and stream_upstream random modules are available since
version 1.15.1 and
https://github.com/nginx/nginx/commit/0c4ccbea23813a50132df511d4445bc1686dbc2f
and are enabled by default, add two options to be able to disable them

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/Config.in | 12 ++++++++++++
 package/nginx/nginx.mk  |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 507b4dcfb4..15e63f4a76 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -290,6 +290,12 @@ config BR2_PACKAGE_NGINX_HTTP_UPSTREAM_KEEPALIVE_MODULE
 	help
 	  Enable ngx_http_upstream_keepalive_module
 
+config BR2_PACKAGE_NGINX_HTTP_UPSTREAM_RANDOM_MODULE
+	bool "ngx_http_upstream_random_module"
+	default y
+	help
+	  Enable ngx_http_upstream_random_module
+
 endif #BR2_PACKAGE_NGINX_HTTP
 
 config BR2_PACKAGE_NGINX_MAIL
@@ -393,6 +399,12 @@ config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_LEAST_CONN_MODULE
 	help
 	  Enable ngx_stream_upstream_least_conn_module
 
+config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_RANDOM_MODULE
+	bool "ngx_stream_upstream_random_module"
+	default y
+	help
+	  Enable ngx_stream_upstream_random_module
+
 config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_ZONE_MODULE
 	bool "ngx_stream_upstream_zone_module"
 	default y
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 9696d6b37d..06fc49d246 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -198,6 +198,7 @@ NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_BROWSER_MODULE),,--without-http_browser_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_IP_HASH_MODULE),,--without-http_upstream_ip_hash_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_LEAST_CONN_MODULE),,--without-http_upstream_least_conn_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_RANDOM_MODULE),,--without-http_upstream_random_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_UPSTREAM_KEEPALIVE_MODULE),,--without-http_upstream_keepalive_module)
 
 else # !BR2_PACKAGE_NGINX_HTTP
@@ -247,6 +248,7 @@ NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_RETURN_MODULE),,--without-stream_return_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_HASH_MODULE),,--without-stream_upstream_hash_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_LEAST_CONN_MODULE),,--without-stream_upstream_least_conn_module) \
+	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_RANDOM_MODULE),,--without-stream_upstream_random_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_ZONE_MODULE),,--without-stream_upstream_zone_module)
 
 endif # BR2_PACKAGE_NGINX_STREAM

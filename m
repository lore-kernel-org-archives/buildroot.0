From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 22 Jun 2020 21:31:11 +0200
Subject: [Buildroot] [PATCH 1/4] package/nginx: add stream map option
Message-ID: <20200622193114.291257-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

stream map module has been added in version 1.11.3 with
https://github.com/nginx/nginx/commit/05db6ddfa1ca120c1c348cc750acded2a01b090a
and is enabled by default, add an option to be able to disable it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx/Config.in | 6 ++++++
 package/nginx/nginx.mk  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 52711b1de3..64406664d3 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -346,6 +346,12 @@ config BR2_PACKAGE_NGINX_STREAM_ACCESS_MODULE
 	help
 	  Enable ngx_stream_access_module
 
+config BR2_PACKAGE_NGINX_STREAM_MAP_MODULE
+	bool "ngx_stream_map_module"
+	default y
+	help
+	  Enable ngx_stream_map_module
+
 config BR2_PACKAGE_NGINX_STREAM_UPSTREAM_HASH_MODULE
 	bool "ngx_stream_upstream_hash_module"
 	default y
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 0c81c63d13..22ee851454 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -232,6 +232,7 @@ endif
 NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_LIMIT_CONN_MODULE),,--without-stream_limit_conn_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_ACCESS_MODULE),,--without-stream_access_module) \
+	$(if $(BR2_PACKAGE_NGINX_STREAM_MAP_MODULE),,--without-stream_map_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_HASH_MODULE),,--without-stream_upstream_hash_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_LEAST_CONN_MODULE),,--without-stream_upstream_least_conn_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_ZONE_MODULE),,--without-stream_upstream_zone_module)
-- 
2.26.2

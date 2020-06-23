From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 23 Jun 2020 22:35:26 +0200
Subject: [Buildroot] [PATCH 1/1] package/nginx: add stream split clients
 option
Message-ID: <20200623203526.1024367-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

stream split clients module has been added in version 1.11.3 with
https://github.com/nginx/nginx/commit/6c2b086d0e10cab769f9321998dcb631796ec49b
and is enabled by default, add an option to be able to disable it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx/Config.in | 6 ++++++
 package/nginx/nginx.mk  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 9f742e3e6b..eba0d30329 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -364,6 +364,12 @@ config BR2_PACKAGE_NGINX_STREAM_MAP_MODULE
 	help
 	  Enable ngx_stream_map_module
 
+config BR2_PACKAGE_NGINX_STREAM_SPLIT_CLIENTS_MODULE
+	bool "ngx_stream_split_client_module"
+	default y
+	help
+	  Enable ngx_stream_split_clients_module
+
 config BR2_PACKAGE_NGINX_STREAM_RETURN_MODULE
 	bool "ngx_stream_return_module"
 	default y
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 52b91bcde5..db63531dd6 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -239,6 +239,7 @@ NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_ACCESS_MODULE),,--without-stream_access_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_GEO_MODULE),,--without-stream_geo_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_MAP_MODULE),,--without-stream_map_module) \
+	$(if $(BR2_PACKAGE_NGINX_STREAM_SPLIT_CLIENTS_MODULE),,--without-stream_split_clients_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_RETURN_MODULE),,--without-stream_return_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_HASH_MODULE),,--without-stream_upstream_hash_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_LEAST_CONN_MODULE),,--without-stream_upstream_least_conn_module) \
-- 
2.26.2

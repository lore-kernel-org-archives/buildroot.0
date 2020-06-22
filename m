From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 22:44:33 +0200
Subject: [Buildroot] [git commit] package/nginx: add stream geo option
Message-ID: <20200622204309.3AD9781312@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e9d985df7010f04b477249add9050ca8497fa29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

stream geo module has been added in version 1.11.3 with
https://github.com/nginx/nginx/commit/bb790f5d30025b634673fcb9939ded5b0c60301f
and is enabled by default, add an option to be able to disable it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/Config.in | 6 ++++++
 package/nginx/nginx.mk  | 1 +
 2 files changed, 7 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index cad5903882..09af4680ee 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -346,6 +346,12 @@ config BR2_PACKAGE_NGINX_STREAM_ACCESS_MODULE
 	help
 	  Enable ngx_stream_access_module
 
+config BR2_PACKAGE_NGINX_STREAM_GEO_MODULE
+	bool "ngx_stream_geo_module"
+	default y
+	help
+	  Enable ngx_stream_geo_module
+
 config BR2_PACKAGE_NGINX_STREAM_MAP_MODULE
 	bool "ngx_stream_map_module"
 	default y
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 344d41d410..9fdc53fc2a 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -232,6 +232,7 @@ endif
 NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_LIMIT_CONN_MODULE),,--without-stream_limit_conn_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_ACCESS_MODULE),,--without-stream_access_module) \
+	$(if $(BR2_PACKAGE_NGINX_STREAM_GEO_MODULE),,--without-stream_geo_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_MAP_MODULE),,--without-stream_map_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_RETURN_MODULE),,--without-stream_return_module) \
 	$(if $(BR2_PACKAGE_NGINX_STREAM_UPSTREAM_HASH_MODULE),,--without-stream_upstream_hash_module) \

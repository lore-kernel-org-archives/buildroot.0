From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Jun 2020 21:10:52 +0200
Subject: [Buildroot] [git commit] package/nginx: add support for slice module
Message-ID: <20200622191618.A9478840DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d80f6fe49219da31aac0af7285d63a6fd673b68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

slice module is available since version 1.9.8 and
https://github.com/nginx/nginx/commit/8ba626ccd71cbd704c7c69928d1d6fe58fd0445f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nginx/Config.in | 5 +++++
 package/nginx/nginx.mk  | 1 +
 2 files changed, 6 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 0dbeaae2ff..52711b1de3 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -134,6 +134,11 @@ config BR2_PACKAGE_NGINX_HTTP_DEGRADATION_MODULE
 	help
 	  Enable ngx_http_degradation_module
 
+config BR2_PACKAGE_NGINX_HTTP_SLICE_MODULE
+	bool "ngx_http_slice_module"
+	help
+	  Enable ngx_http_slice_module
+
 config BR2_PACKAGE_NGINX_HTTP_STUB_STATUS_MODULE
 	bool "ngx_http_stub_status_module"
 	help
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 3f249096bc..81708fd32f 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -175,6 +175,7 @@ NGINX_CONF_OPTS += \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_AUTH_REQUEST_MODULE),--with-http_auth_request_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_RANDOM_INDEX_MODULE),--with-http_random_index_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_DEGRADATION_MODULE),--with-http_degradation_module) \
+	$(if $(BR2_PACKAGE_NGINX_HTTP_SLICE_MODULE),--with-http_slice_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_STUB_STATUS_MODULE),--with-http_stub_status_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_CHARSET_MODULE),,--without-http_charset_module) \
 	$(if $(BR2_PACKAGE_NGINX_HTTP_SSI_MODULE),,--without-http_ssi_module) \

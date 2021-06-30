From: Adam Duskett <aduskett@gmail.com>
Date: Wed, 30 Jun 2021 10:36:57 -0700
Subject: [Buildroot] [PATCH v2 2/5] package/nginx: add stream_set_module
 support
In-Reply-To: <20210630173700.30975-1-aduskett@gmail.com>
References: <20210630173700.30975-1-aduskett@gmail.com>
Message-ID: <20210630173700.30975-3-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is a new module in 1.20

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/nginx/Config.in | 6 ++++++
 package/nginx/nginx.mk  | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/package/nginx/Config.in b/package/nginx/Config.in
index 6ae790a949..1200b2bf4c 100644
--- a/package/nginx/Config.in
+++ b/package/nginx/Config.in
@@ -339,6 +339,12 @@ config BR2_PACKAGE_NGINX_STREAM_REALIP_MODULE
 	help
 	  Enable ngx_stream_realip_module
 
+config BR2_PACKAGE_NGINX_STREAM_SET_MODULE
+	bool "ngx_stream_set_module"
+	default y
+	help
+	  Enable ngx_stream_set_module
+
 config BR2_PACKAGE_NGINX_STREAM_SSL_MODULE
 	bool "ngx_stream_ssl_module"
 	select BR2_PACKAGE_OPENSSL
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 36515e67cc..1f996cc613 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -232,6 +232,10 @@ ifeq ($(BR2_PACKAGE_NGINX_STREAM_REALIP_MODULE),y)
 NGINX_CONF_OPTS += --with-stream_realip_module
 endif
 
+ifeq ($(BR2_PACKAGE_NGINX_STREAM_SET_MODULE),)
+NGINX_CONF_OPTS += --without-stream_set_module
+endif
+
 ifeq ($(BR2_PACKAGE_NGINX_STREAM_SSL_MODULE),y)
 NGINX_DEPENDENCIES += openssl
 NGINX_CONF_OPTS += --with-stream_ssl_module
-- 
2.31.1

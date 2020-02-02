From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Feb 2020 17:27:03 +0100
Subject: [Buildroot] [PATCH 1/1] package/nginx-modsecurity: depends on
 BR2_PACKAGE_NGINX_HTTP
Message-ID: <20200202162703.142811-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/7babc12094f4d490569556824a2029e5f08ff866

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx-modsecurity/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index 68f6a81045..aa9d53a3fe 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_NGINX_MODSECURITY
 	bool "nginx-modsecurity"
+	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
 	depends on !BR2_STATIC_LIBS # libmodsecurity
 	select BR2_PACKAGE_PCRE # libmodsecurity
@@ -12,4 +13,5 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	  https://github.com/SpiderLabs/ModSecurity-nginx
 
 comment "nginx-modsecurity needs a toolchain w/ C++, dynamic library"
+	depends on BR2_PACKAGE_NGINX_HTTP
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
-- 
2.24.1

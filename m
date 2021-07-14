From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 14 Jul 2021 10:53:44 +0200
Subject: [Buildroot] [PATCH 1/3] package/nginx-modsecurity: drop unneeded
 select on pcre
Message-ID: <20210714085346.2464634-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop unneeded select on pcre which has been added by commit
d35873ab0ce5921974239354f8c6e1b4ccc6e565

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nginx-modsecurity/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/nginx-modsecurity/Config.in b/package/nginx-modsecurity/Config.in
index 2af11eeee2..e754aab71e 100644
--- a/package/nginx-modsecurity/Config.in
+++ b/package/nginx-modsecurity/Config.in
@@ -4,7 +4,6 @@ config BR2_PACKAGE_NGINX_MODSECURITY
 	depends on BR2_INSTALL_LIBSTDCPP # libmodsecurity
 	depends on !BR2_STATIC_LIBS # libmodsecurity
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libmodsecurity
-	select BR2_PACKAGE_PCRE # libmodsecurity
 	select BR2_PACKAGE_LIBMODSECURITY
 	help
 	  The ModSecurity-nginx connector is the connection
-- 
2.30.2

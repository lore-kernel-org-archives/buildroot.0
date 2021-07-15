From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Jul 2021 22:41:02 +0200
Subject: [Buildroot] [git commit] package/nginx-modsecurity: drop unneeded
 select on pcre
Message-ID: <20210715200837.CB0D090FA0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=4f2629973aa762614b137aa7a56f2892ffb34871
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop unneeded select on pcre which has been added by commit
d35873ab0ce5921974239354f8c6e1b4ccc6e565

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

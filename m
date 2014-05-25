From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 25 May 2014 07:41:21 +0300
Subject: [Buildroot] [PATCH] lesstif: needs MMU
Message-ID: <deaccc2e665b5480b06ee2948ff5217c78a97f2e.1400992881.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/9f7/9f718c9c9907d9aa2a7a0c45c872f5a8f34b8399/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/lesstif/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lesstif/Config.in b/package/lesstif/Config.in
index 3a999ead3783..a6a88ec46648 100644
--- a/package/lesstif/Config.in
+++ b/package/lesstif/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LESSTIF
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XLIB_LIBXEXT
 	select BR2_PACKAGE_FREETYPE
+	depends on BR2_USE_MMU # fork()
 	help
 	  lesstif is the Hungry Programmers' version of OSF/Motif
 
-- 
2.0.0.rc2

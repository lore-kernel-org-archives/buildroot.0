From: Baruch Siach <baruch@tkos.co.il>
Date: Sun,  1 Jun 2014 06:07:14 +0300
Subject: [Buildroot] [PATCH] xapp_xedit: needs MMU
Message-ID: <9994e810927e9adfcf2f6caafbb8702ca65b7a49.1401592034.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/6b9/6b941b5992c73acd19e8077dbe6cb9fc65e5eba1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/x11r7/xapp_xedit/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xapp_xedit/Config.in b/package/x11r7/xapp_xedit/Config.in
index 5a7045907c4e..feaea7486f68 100644
--- a/package/x11r7/xapp_xedit/Config.in
+++ b/package/x11r7/xapp_xedit/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_XAPP_XEDIT
 	bool "xedit"
 	select BR2_PACKAGE_XLIB_LIBXAW
+	depends on BR2_USE_MMU # fork()
 	help
 	  simple text editor for X
-- 
2.0.0.rc2

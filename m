From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 10 Sep 2013 15:13:36 -0300
Subject: [Buildroot] [PATCH] libroxml: needs threads
Message-ID: <1378836816-27308-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/169/169b607993cd7ae4a8a79c2a00c00f820ec1c747/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libroxml/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libroxml/Config.in b/package/libroxml/Config.in
index b6b253f..e1a646f 100644
--- a/package/libroxml/Config.in
+++ b/package/libroxml/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_LIBROXML
 	bool "roxml"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libroxml is a light and powerful xml parsing library with
 	  xpath handling. Roxml is a binary using libroxml to explore
 	  xml file from shell scripts.
 
 	  http://www.libroxml.net
+
+comment "libroxml needs a toolchain with thread support"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
1.8.1.5

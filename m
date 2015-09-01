From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  1 Sep 2015 10:43:31 -0300
Subject: [Buildroot] [PATCH] znc: needs gcc >= 4.7
Message-ID: <1441115011-20223-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/aba/aba13674fb3624e0bd6a3b1e17f28883e298c8ca/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/znc/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/znc/Config.in b/package/znc/Config.in
index 4328c8b..154d4b0 100644
--- a/package/znc/Config.in
+++ b/package/znc/Config.in
@@ -3,11 +3,13 @@ config BR2_PACKAGE_ZNC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	help
 	  Advanced IRC bouncer
 
 	  http://www.znc.in
 
-comment "znc needs a toolchain w/ C++, dynamic library"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
+comment "znc needs a toolchain w/ C++, dynamic library, gcc >= 4.7"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
 	depends on BR2_USE_MMU
-- 
2.4.6

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 13 Nov 2015 12:06:42 -0300
Subject: [Buildroot] [PATCH] zxing-cpp: needs dynamic library
Message-ID: <1447427202-17942-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/982/982bd00de9da8cedd47209ece4fac92bbcccb04b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/zxing-cpp/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/zxing-cpp/Config.in b/package/zxing-cpp/Config.in
index 1695d27..c110921 100644
--- a/package/zxing-cpp/Config.in
+++ b/package/zxing-cpp/Config.in
@@ -1,8 +1,9 @@
-comment "zxing-cpp needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "zxing-cpp needs a toolchain w/ C++, dynamic library"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
 
 config BR2_PACKAGE_ZXING_CPP
 	bool "zxing-cpp"
+	depends on !BR2_STATIC_LIBS
 	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  ZXing-cpp (pronounced "zebra crossing") is an open-source,
-- 
2.4.10

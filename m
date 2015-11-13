From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 13 Nov 2015 16:39:29 +0100
Subject: [Buildroot] [git commit] zxing-cpp: needs dynamic library
Message-ID: <20151113154009.92A537FB9C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bc7c2e009ac08ae80cbf3ce736ade16a6cfcb26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/982/982bd00de9da8cedd47209ece4fac92bbcccb04b/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zxing-cpp/Config.in |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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

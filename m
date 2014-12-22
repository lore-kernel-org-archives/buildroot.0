From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 Dec 2014 10:33:10 +0200
Subject: [Buildroot] [PATCH] liblinear: needs C++
Message-ID: <6dade243be7400bc9321485065203557498387bb.1419237190.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/1be/1be890ece519ebc0d0ff4f3f31abc06eb0b7356c/
http://autobuild.buildroot.net/results/f59/f59e0fade9dbf851cfee5f82751390df87706e6a/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/liblinear/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/liblinear/Config.in b/package/liblinear/Config.in
index 08e8365a77ad..17c5a74d4a24 100644
--- a/package/liblinear/Config.in
+++ b/package/liblinear/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_LIBLINEAR
 	bool "liblinear"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  liblinear is a linear classifier for data with millions of instances and
 	  features.
 
 	  http://www.csie.ntu.edu.tw/~cjlin/liblinear/
+
+comment "liblinear needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
-- 
2.1.3

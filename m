From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 21 Aug 2016 20:18:06 +0300
Subject: [Buildroot] [PATCH] tstools: requires dynamic library support
Message-ID: <a130ad0abb0b921de5a8f1998ce2cde407082f09.1471799886.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

tstools Makefile tries to build shared libtstools.so library unconditionally.

Fixes:
http://autobuild.buildroot.net/results/208/20830bccab8508aab215c5fc8010e180cc68af51/
http://autobuild.buildroot.net/results/988/9882f93e11dbaba8c6973bedc9d00dbb238a4c06/
http://autobuild.buildroot.net/results/11c/11c802bcfab70a0a2593079657529c763fd82aa1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/tstools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tstools/Config.in b/package/tstools/Config.in
index f5dd138c4d12..ca5f8fc2ca3d 100644
--- a/package/tstools/Config.in
+++ b/package/tstools/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TSTOOLS
 	bool "tstools"
 	depends on BR2_USE_MMU # fork()
+	depends on !BR2_STATIC_LIBS
 	help
 	  This is a set of cross-platform command line tools for working with
 	  MPEG data.
@@ -14,3 +15,7 @@ config BR2_PACKAGE_TSTOOLS
 	  data on DVDs.
 
 	  https://github.com/kynesim/tstools/
+
+comment "tstools needs a toolchain w/ dynamic library"
+	depends on BR2_USE_MMU
+	depends on BR2_STATIC_LIBS
-- 
2.8.1

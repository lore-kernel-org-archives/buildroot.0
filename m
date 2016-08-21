From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Aug 2016 22:22:18 +0200
Subject: [Buildroot] [git commit] tstools: requires dynamic library support
Message-ID: <20160821202221.8A38E8213B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=614710f4c3a82d60a7590ec55d14459d81f3764b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tstools Makefile tries to build shared libtstools.so library unconditionally.

Fixes:
http://autobuild.buildroot.net/results/208/20830bccab8508aab215c5fc8010e180cc68af51/
http://autobuild.buildroot.net/results/988/9882f93e11dbaba8c6973bedc9d00dbb238a4c06/
http://autobuild.buildroot.net/results/11c/11c802bcfab70a0a2593079657529c763fd82aa1/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tstools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tstools/Config.in b/package/tstools/Config.in
index f5dd138..ca5f8fc 100644
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

From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 9 Jul 2016 00:21:29 +0200
Subject: [Buildroot] [PATCH v2] directfb: depends on NPTL threading
Message-ID: <20160708222129.GA22796@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes following autobuild failure:
http://autobuild.buildroot.net/results/162db0d62075a16c7abae1229676e2cdb29fe953/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1 -> v2:
  - rather adding an experimental patch without runtime testing for
    an unmaintained software, we depend on NPTL as discussed with
    Thomas Petazzoni on IRC
---
 package/directfb/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index f0bcaaa..f38f051 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_DIRECTFB
 	bool "directfb"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_5
 	depends on !BR2_TOOLCHAIN_USES_MUSL # sigval_t issue
-- 
2.1.4

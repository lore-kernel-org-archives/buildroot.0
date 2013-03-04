From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 4 Mar 2013 09:31:25 +0100
Subject: [Buildroot] [git commit] ltp-testsuite: add warning about bessel
	function support if uclibc toolchain
Message-ID: <20130304093035.54CC29AE31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88685c9dd5dc0cc0b406e48d196dc73ca3f672e1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: Reword, add SV4_DEPRECATED, move to help text]
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/ltp-testsuite/Config.in |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 86aa4fb..4146274 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,3 +1,7 @@
+comment "ltp-testsuite needs specific uClibc options, see help"
+	depends on BR2_PACKAGE_LTP_TESTSUITE
+	depends on BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_UCLIBC || BR2_TOOLCHAIN_CTNG_uClibc
+
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
@@ -7,8 +11,9 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	  The LTP testsuite uses several functions that are considered
 	  obsolete, such as sigset() and others. Therefore, the LTP
 	  testsuite does not build with Buildroot's default uClibc
-	  configuration, and options such as
-	  UCLIBC_HAS_OBSOLETE_BSD_SIGNAL are needed.
+	  configuration, and options such as DO_XSI_MATH,
+	  UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and UCLIBC_SV4_DEPRECATED
+	  are needed.
 
 	  http://ltp.sourceforge.net/
 

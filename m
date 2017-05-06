From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 May 2017 15:29:33 +0200
Subject: [Buildroot] [git commit] ltp-testsuite: builds fine with our uClibc
	configuration
Message-ID: <20170506133012.BFE828270B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f3facc15bffad4cedcfc1b270af37fc146f76a1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ltp-testsuite now builds fine with our default uClibc
configuration, so remove the Config.in comment and the part of the
Config.in help text related to building with uClibc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ltp-testsuite/Config.in | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/package/ltp-testsuite/Config.in b/package/ltp-testsuite/Config.in
index 04868d7..5309107 100644
--- a/package/ltp-testsuite/Config.in
+++ b/package/ltp-testsuite/Config.in
@@ -1,7 +1,3 @@
-comment "ltp-testsuite needs specific uClibc options, see help"
-	depends on BR2_PACKAGE_LTP_TESTSUITE
-	depends on BR2_TOOLCHAIN_USES_UCLIBC
-
 config BR2_PACKAGE_LTP_TESTSUITE
 	bool "ltp-testsuite"
 	depends on BR2_USE_MMU # fork()
@@ -13,13 +9,6 @@ config BR2_PACKAGE_LTP_TESTSUITE
 	help
 	  The Linux Test Project provides a huge testsuite for Linux.
 
-	  The LTP testsuite uses several functions that are considered
-	  obsolete, such as sigset() and others. Therefore, the LTP
-	  testsuite does not build with Buildroot's default uClibc
-	  configuration, and options such as DO_XSI_MATH,
-	  UCLIBC_HAS_OBSOLETE_BSD_SIGNAL and UCLIBC_SV4_DEPRECATED
-	  are needed.
-
 	  http://linux-test-project.github.io
 
 comment "ltp-testsuite needs a glibc or uClibc toolchain w/ threads"

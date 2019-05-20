From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 11:05:10 +0200
Subject: [Buildroot] [git commit branch/next] package/ltp-testsuite: bump to
 version 20190517
Message-ID: <20190520085943.5AE7181213@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8148b7b878047e9df20b0ed01ba2304cfa5b468b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Also remove workaround deleting testcases/kernel/controllers/cpuset/.
Upstream commit b24f3d32c ("cpuset: Detect missing fts.h") detect fts.h
presence, thus it's working with '#undef __UCLIBC_HAS_FTS__'.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ltp-testsuite/ltp-testsuite.hash | 4 ++--
 package/ltp-testsuite/ltp-testsuite.mk   | 3 +--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index ba0dcbe7e8..01111a8a30 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,2 +1,2 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20190115/ltp-full-20190115.tar.xz.sha1
-sha1 d87e2f96dc628f927e98ecba2e9dae581fc115b4  ltp-full-20190115.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20190517/ltp-full-20190517.tar.xz.sha1
+sha1 464d09ee1d3b43eecd0d78a9818596e6e1f2234e  ltp-full-20190517.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index ebc386d0cf..173c3bfe8c 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20190115
+LTP_TESTSUITE_VERSION = 20190517
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 LTP_TESTSUITE_LICENSE = GPL-2.0, GPL-2.0+
@@ -60,7 +60,6 @@ LTP_TESTSUITE_CONF_ENV += \
 # Requires uClibc fts and bessel support, normally not enabled
 ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 define LTP_TESTSUITE_REMOVE_UNSUPPORTED
-	rm -rf $(@D)/testcases/kernel/controllers/cpuset/
 	rm -rf $(@D)/testcases/misc/math/float/bessel/
 	rm -f $(@D)/testcases/misc/math/float/float_bessel.c
 endef

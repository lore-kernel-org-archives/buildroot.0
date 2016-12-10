From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 10 Dec 2016 15:12:46 +0100
Subject: [Buildroot] [PATCH] uclibc-ng-test: fix compile errors with glibc
	toolchains
Message-ID: <20161210141246.GA8753@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We need to link with -lrt for some tests.
Update to latest upstream version.

Fixes:
 http://autobuild.buildroot.net/results/7388ffcc51a6686b8b708d7373427368d3755870
 http://autobuild.buildroot.net/results/926716ed127dea879c5b26c4d04dc7f0615c8f34
 http://autobuild.buildroot.net/results/737f1651a8bba7d3d815f46ec796955d09ba96bd
 http://autobuild.buildroot.net/results/56a8d67a45469d2a478da8d7d1ad7c5fb5e6c0c5

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc-ng-test/uclibc-ng-test.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index bb8b9ed..9a0240c 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UCLIBC_NG_TEST_VERSION = 189b47080068d431302beec0e627dcaa5358eae8
+UCLIBC_NG_TEST_VERSION = c9b9876cefc142a23aa622b821290ed16af80058
 UCLIBC_NG_TEST_SITE = git://uclibc-ng.org/git/uclibc-ng-test
 UCLIBC_NG_TEST_LICENSE = LGPLv2.1+
 UCLIBC_NG_TEST_LICENSE_FILES = COPYING.LIB
-- 
2.1.4

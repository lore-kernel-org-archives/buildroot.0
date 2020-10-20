From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 20 Oct 2020 11:05:19 +0200
Subject: [Buildroot] [PATCH] uclibc-ng-test: disable TLS for nds32 and s390x
Message-ID: <20201020090518.GA3322@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/dac2a477a4de28d671c165e940db25364e291636
http://autobuild.buildroot.net/results/84ca7104669bdc4fe538e526f3522e36b9bf666b
Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc-ng-test/uclibc-ng-test.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 1d1722adee..9f866f5d71 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -38,6 +38,10 @@ endif
 ifeq ($(BR2_STATIC_LIBS),y)
 UCLIBC_NG_TEST_MAKE_ENV += NO_TLS=1 NO_NPTL=1 NO_DL=1
 endif
+# no TLS macros available
+ifeq ($(BR2_nds32)$(BR2_s390x),y)
+UCLIBC_NG_TEST_MAKE_ENV += NO_TLS=1
+endif
 
 # to execute tests in a deterministic order, call test_gen separately
 define UCLIBC_NG_TEST_BUILD_CMDS
-- 
2.20.1

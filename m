From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 22 Feb 2017 19:27:43 +0100
Subject: [Buildroot] [PATCH] uclibc-ng-test: pass LDFLAGS while building
Message-ID: <20170222182743.GA16529@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When static linking is in use we need to pass -static while
linking.

Fixes:
  http://autobuild.buildroot.net/results/37ca35854a36fab1690f6ae789e338a1e55307f6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/uclibc-ng-test/uclibc-ng-test.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc-ng-test/uclibc-ng-test.mk b/package/uclibc-ng-test/uclibc-ng-test.mk
index 9a0240c..610ca01 100644
--- a/package/uclibc-ng-test/uclibc-ng-test.mk
+++ b/package/uclibc-ng-test/uclibc-ng-test.mk
@@ -39,6 +39,7 @@ define UCLIBC_NG_TEST_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(UCLIBC_NG_TEST_MAKE_ENV) $(MAKE) -C $(@D) \
 		CC="$(TARGET_CC)" \
 		UCLIBC_EXTRA_CFLAGS="$(TARGET_CFLAGS)" \
+		UCLIBC_EXTRA_LDFLAGS="$(TARGET_LDFLAGS)" \
 		test_compile
 	$(TARGET_MAKE_ENV) $(UCLIBC_NG_TEST_MAKE_ENV) $(MAKE1) -C $(@D) \
 		CC="$(TARGET_CC)" \
-- 
2.1.4

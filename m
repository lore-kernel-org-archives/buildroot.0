From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Feb 2017 21:32:45 +0100
Subject: [Buildroot] [git commit] uclibc-ng-test: pass LDFLAGS while building
Message-ID: <20170222203250.3C06B807B2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0aac65bd6371ab5fb1b30ebec05a59dbe1a87d5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When static linking is in use we need to pass -static while
linking.

Fixes:
  http://autobuild.buildroot.net/results/37ca35854a36fab1690f6ae789e338a1e55307f6

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

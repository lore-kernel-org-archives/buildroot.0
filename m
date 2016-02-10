From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Feb 2016 11:17:58 -0300
Subject: [Buildroot] [PATCH] uclibc: fix testsuite
Message-ID: <1455113878-32655-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Unless the tests are built with TEST_INSTALLED_UCLIBC their rpath will
point to the build directory rather than runtime directory, resulting in
non-executable tests for the target.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/uclibc/uclibc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 773b22a..200de04 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -386,6 +386,7 @@ ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
 define UCLIBC_BUILD_TEST_SUITE
 	$(MAKE1) -C $(@D) \
 		$(UCLIBC_MAKE_FLAGS) \
+		TEST_INSTALLED_UCLIBC=1 \
 		UCLIBC_ONLY=1 \
 		test_compile
 endef
-- 
2.4.10

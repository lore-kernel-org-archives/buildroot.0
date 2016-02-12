From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Feb 2016 14:50:56 +0100
Subject: [Buildroot] [git commit] uclibc: fix testsuite
Message-ID: <20160212135102.2D07081954@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bb1324288a38f30d42190b9d8b254ef084a3691c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unless the tests are built with TEST_INSTALLED_UCLIBC their rpath will
point to the build directory rather than runtime directory, resulting in
non-executable tests for the target.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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

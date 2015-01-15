From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 Jan 2015 09:19:36 +0200
Subject: [Buildroot] [PATCH] rt-tests: fix build of NTPL dependent tests
Message-ID: <e8a70d168927c7e195ed376137ebec128762427f.1421306376.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 143fe5b443da4 (rt-tests: allow building subset of tests with non-NPTL
toolchains) disabled build of NPTL dependent tests unconditionally. Fix this.

Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Reported-by: "Williams Jr., Ernest L." <ernesto@slac.stanford.edu>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/rt-tests/rt-tests.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index e0c7748c9c3b..009e9a6818ce 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -15,6 +15,8 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),)
 RT_TESTS_HAVE_NPTL=no
+else
+RT_TESTS_HAVE_NPTL=yes
 endif
 
 define RT_TESTS_BUILD_CMDS
-- 
2.1.4

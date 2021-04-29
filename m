From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 29 Apr 2021 21:21:03 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: enable ebizzy
Message-ID: <20210429192103.7487-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ebizzy has been fixed in 20200930 (commit 967612c45).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 43ee134d1c..978d01b7a6 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -76,8 +76,7 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_MUSL) += \
 	testcases/kernel/syscalls/getcontext/getcontext01.c \
 	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
 	testcases/kernel/syscalls/timer_create/timer_create01.c \
-	testcases/kernel/syscalls/timer_create/timer_create03.c \
-	utils/benchmark/ebizzy-0.3
+	testcases/kernel/syscalls/timer_create/timer_create03.c
 
 # ldd command build system tries to build a shared library unconditionally.
 LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_STATIC_LIBS) += \
-- 
2.31.1

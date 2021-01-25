From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 25 Jan 2021 02:33:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: update musl related
 cleanup
Message-ID: <20210125013329.31989-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compile getdents0{1,2}.c which has been fixed in upstream in commit
8a85a2d61 ("getdents: update to the new api, don't mix libc and kernel
types").

Fixes: 84968aa495 ("package/ltp-testsuite: bump version to 20210121")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/ltp-testsuite/ltp-testsuite.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 577fdf1131..4d7aa451b5 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -75,8 +75,6 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES = \
 	testcases/kernel/syscalls/confstr/confstr01.c \
 	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
 	testcases/kernel/syscalls/getcontext/getcontext01.c \
-	testcases/kernel/syscalls/getdents/getdents01.c \
-	testcases/kernel/syscalls/getdents/getdents02.c \
 	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
 	testcases/kernel/syscalls/timer_create/timer_create01.c \
 	testcases/kernel/syscalls/timer_create/timer_create03.c \
-- 
2.30.0

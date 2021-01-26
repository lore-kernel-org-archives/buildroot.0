From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2021 18:28:49 +0100
Subject: [Buildroot] [git commit] package/ltp-testsuite: update musl related
 cleanup
Message-ID: <20210126171114.87AD483B7D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8640e8ffde3f61c583843c36bf4660ff751f55ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Compile getdents0{1,2}.c which has been fixed in upstream in commit
8a85a2d61 ("getdents: update to the new api, don't mix libc and kernel
types").

Fixes: 84968aa495 ("package/ltp-testsuite: bump version to 20210121")

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

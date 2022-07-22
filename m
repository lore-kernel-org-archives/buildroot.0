Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17F1C43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 21:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31695422E2;
	Fri, 22 Jul 2022 21:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31695422E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2E-_1r_JKSlP; Fri, 22 Jul 2022 21:13:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 279EE42384;
	Fri, 22 Jul 2022 21:13:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 279EE42384
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EDEB91BF215
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C82D484888
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 21:13:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C82D484888
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id anTLlqxDNkg7 for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 21:13:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73A9C84887
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 21:13:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A9C84887
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 15132841CF; Fri, 22 Jul 2022 20:59:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 23:13:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e766f73c49c529216a96bf7fa083b4c56e56820
X-Git-Newrev: 3d867408b012788d264735a6a71fa362863e081e
X-Patchwork-Hint: ignore
Message-Id: <20220722205951.15132841CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ltp-testsuite: bump version to
 20220527
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3d867408b012788d264735a6a71fa362863e081e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add 2 patches from upstream which are required to fix compilation,
Remove patch accepted upstream.

Update list of broken tests under musl (confstr01.c was fixed).

Refresh 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
(still carry it case there is somebody using old musl based toolchain).

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch | 50 +++++++-------
 .../0002-kvm-Fix-compilation-on-x86.patch          | 40 +++++++++++
 ...s-kernel-fs-declare-int-openlog-as-static.patch | 77 ----------------------
 ...x-undefined-reference-to-__stack_chk_fail.patch | 41 ++++++++++++
 package/ltp-testsuite/ltp-testsuite.hash           |  6 +-
 package/ltp-testsuite/ltp-testsuite.mk             |  3 +-
 6 files changed, 110 insertions(+), 107 deletions(-)

diff --git a/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
index 2ceba64ed5..1553908cf8 100644
--- a/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
+++ b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
@@ -29,7 +29,7 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 
 [ upstream status:
 https://patchwork.ozlabs.org/project/ltp/patch/20201001231256.6930-1-petr.vorel@gmail.com/,
-rebased for 20210927 ]
+rebased for 20220527 ]
 
 But this patch is not going to get upstreamed because it got fixed in Linux kernel:
 a85cbe6159ff "uapi: move constants from <linux/kernel.h> to <linux/const.h>"
@@ -56,7 +56,7 @@ Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
 
 diff --git a/include/lapi/sysinfo.h b/include/lapi/sysinfo.h
 new file mode 100644
-index 0000000000..d0e0e93d7f
+index 000000000..d0e0e93d7
 --- /dev/null
 +++ b/include/lapi/sysinfo.h
 @@ -0,0 +1,22 @@
@@ -83,7 +83,7 @@ index 0000000000..d0e0e93d7f
 +
 +#endif /* SYSINFO_H__ */
 diff --git a/include/tst_safe_macros.h b/include/tst_safe_macros.h
-index d99441c86f..0d26e9d455 100644
+index 81c4b0844..a8c02d7df 100644
 --- a/include/tst_safe_macros.h
 +++ b/include/tst_safe_macros.h
 @@ -12,7 +12,7 @@
@@ -96,7 +96,7 @@ index d99441c86f..0d26e9d455 100644
  #include <libgen.h>
  #include <signal.h>
 diff --git a/lib/safe_macros.c b/lib/safe_macros.c
-index a5b6bc5047..87d922a928 100644
+index a5b6bc504..87d922a92 100644
 --- a/lib/safe_macros.c
 +++ b/lib/safe_macros.c
 @@ -11,7 +11,7 @@
@@ -109,7 +109,7 @@ index a5b6bc5047..87d922a928 100644
  #include <fcntl.h>
  #include <libgen.h>
 diff --git a/lib/tst_memutils.c b/lib/tst_memutils.c
-index 4a49747613..000688f5a3 100644
+index 0d20bb17c..21a3a5ba0 100644
 --- a/lib/tst_memutils.c
 +++ b/lib/tst_memutils.c
 @@ -6,7 +6,7 @@
@@ -119,15 +119,15 @@ index 4a49747613..000688f5a3 100644
 -#include <sys/sysinfo.h>
 +#include "lapi/sysinfo.h"
  #include <stdlib.h>
- 
+
  #define TST_NO_DEFAULT_MAIN
 diff --git a/testcases/kernel/mem/mtest01/mtest01.c b/testcases/kernel/mem/mtest01/mtest01.c
-index 20cb95191d..3462dc3f82 100644
+index fb991ce8b..0fccd5405 100644
 --- a/testcases/kernel/mem/mtest01/mtest01.c
 +++ b/testcases/kernel/mem/mtest01/mtest01.c
 @@ -20,7 +20,6 @@
   */
- 
+
  #include <sys/types.h>
 -#include <sys/sysinfo.h>
  #include <sys/wait.h>
@@ -135,14 +135,14 @@ index 20cb95191d..3462dc3f82 100644
  #include <signal.h>
 @@ -29,6 +28,7 @@
  #include <unistd.h>
- 
+
  #include "lapi/abisize.h"
 +#include "lapi/sysinfo.h"
  #include "tst_test.h"
- 
+
  #define FIVE_HUNDRED_MB         (500ULL*1024*1024)
 diff --git a/testcases/kernel/syscalls/madvise/madvise06.c b/testcases/kernel/syscalls/madvise/madvise06.c
-index 263b8e78bf..4fa52e6eae 100644
+index 6d218801c..8af11a030 100644
 --- a/testcases/kernel/syscalls/madvise/madvise06.c
 +++ b/testcases/kernel/syscalls/madvise/madvise06.c
 @@ -46,7 +46,7 @@
@@ -152,10 +152,10 @@ index 263b8e78bf..4fa52e6eae 100644
 -#include <sys/sysinfo.h>
 +#include "lapi/sysinfo.h"
  #include "tst_test.h"
- #include "tst_cgroup.h"
- 
+
+ #define CHUNK_SZ (400*1024*1024L)
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo01.c b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
-index 2ea44a2beb..a237345ef7 100644
+index 2ea44a2be..a237345ef 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo01.c
 +++ b/testcases/kernel/syscalls/sysinfo/sysinfo01.c
 @@ -69,7 +69,7 @@
@@ -164,11 +164,11 @@ index 2ea44a2beb..a237345ef7 100644
  #include <sys/signal.h>
 -#include <sys/sysinfo.h>
 +#include "lapi/sysinfo.h"
- 
+
  #include "test.h"
- 
+
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo02.c b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
-index 7ad0e8bdcf..61fa1ab757 100644
+index 7ad0e8bdc..61fa1ab75 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo02.c
 +++ b/testcases/kernel/syscalls/sysinfo/sysinfo02.c
 @@ -65,7 +65,7 @@
@@ -178,23 +178,23 @@ index 7ad0e8bdcf..61fa1ab757 100644
 -#include <sys/sysinfo.h>
 +#include "lapi/sysinfo.h"
  #include <stdint.h>
- 
+
  #include "test.h"
 diff --git a/testcases/kernel/syscalls/sysinfo/sysinfo03.c b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
-index af7cb6421e..dc5ae65e35 100644
+index af7cb6421..dc5ae65e3 100644
 --- a/testcases/kernel/syscalls/sysinfo/sysinfo03.c
 +++ b/testcases/kernel/syscalls/sysinfo/sysinfo03.c
 @@ -13,7 +13,7 @@
- 
+
   */
- 
+
 -#include <sys/sysinfo.h>
 +#include "lapi/sysinfo.h"
  #include "lapi/namespaces_constants.h"
  #include "lapi/posix_clocks.h"
  #include "tst_test.h"
 diff --git a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
-index 22e7c36386..572701f9fd 100644
+index 22e7c3638..572701f9f 100644
 --- a/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
 +++ b/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast/1-2.c
 @@ -43,7 +43,7 @@
@@ -204,8 +204,8 @@ index 22e7c36386..572701f9fd 100644
 -#include <sys/sysinfo.h>
 +#include "lapi/sysinfo.h"
  #endif
- 
+
  #include "../testfrmw/testfrmw.h"
--- 
-2.34.1
+--
+2.36.1
 
diff --git a/package/ltp-testsuite/0002-kvm-Fix-compilation-on-x86.patch b/package/ltp-testsuite/0002-kvm-Fix-compilation-on-x86.patch
new file mode 100644
index 0000000000..0dfa652eb5
--- /dev/null
+++ b/package/ltp-testsuite/0002-kvm-Fix-compilation-on-x86.patch
@@ -0,0 +1,40 @@
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Mon, 6 Jun 2022 20:43:19 +0200
+Subject: [PATCH] kvm: Fix compilation on x86
+
+Buildroot supports i386 pentium toolchains (br-i386-pentium-mmx-musl,
+br-i386-pentium4-full) which fail to compile because as is run without --32.
+
+[ upstream status: a471d87ef ("kvm: Fix compilation on x86") ]
+
+Suggested-by: Martin Doucha <mdoucha@suse.cz>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ testcases/kernel/kvm/Makefile | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
+index adab56952..8d5193d8e 100644
+--- a/testcases/kernel/kvm/Makefile
++++ b/testcases/kernel/kvm/Makefile
+@@ -17,11 +17,14 @@ FILTER_OUT_MAKE_TARGETS := lib_guest lib_host lib_x86
+ ifeq ($(HOST_CPU),x86_64)
+ 	ifneq (,$(findstring m32,$(CFLAGS)))
+ 		HOST_CPU = x86
+-		GUEST_CFLAGS += -m32
+-		ASFLAGS += --32
+ 	endif
+ endif
+ 
++ifeq ($(HOST_CPU),x86)
++	GUEST_CFLAGS += -m32
++	ASFLAGS += --32
++endif
++
+ # Some distros enable -pie by default. That breaks KVM payload linking.
+ ifdef LTP_CFLAGS_NOPIE
+ 	GUEST_CFLAGS += -fno-pie
+-- 
+2.36.1
+
diff --git a/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch b/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch
deleted file mode 100644
index ae10bfcfdd..0000000000
--- a/package/ltp-testsuite/0002-testcases-kernel-fs-declare-int-openlog-as-static.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From 002ca0320cd2c5e1515bf202f470d4becdf01532 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 24 Apr 2022 21:56:36 +0200
-Subject: [PATCH] testcases/kernel/fs: declare int openlog as static
-
-Declare int openlog as static to avoid the following build failure when
-building statically (e.g. on buildroot):
-
-/nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../lib/gcc/mipsel-buildroot-linux-uclibc/10.3.0/../../../../mipsel-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-15/output-1/per-package/ltp-testsuite/host/bin/../mipsel-buildroot-linux-uclibc/sysroot/usr/lib/libc.a(syslog.os): in function `openlog':
-syslog.c:(.text+0x6b8): multiple definition of `openlog'; /tmp/ccvRnqfT.o:/nvmedata/autobuild/instance-15/output-1/build/ltp-testsuite-20220121/testcases/kernel/fs/fs-bench/random-access.c:14: first defined here
-
-Fixes:
- - http://autobuild.buildroot.org/results/bfd0d906a05564a4f323db604f3b908abf552b20
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-[Retrieved from:
-https://github.com/linux-test-project/ltp/commit/002ca0320cd2c5e1515bf202f470d4becdf01532]
----
- testcases/kernel/fs/fs-bench/random-access-del-create.c | 2 --
- testcases/kernel/fs/fs-bench/random-access.c            | 2 +-
- testcases/kernel/fs/fs-bench/random-del-create.c        | 2 +-
- testcases/kernel/fs/scsi/ltpfs/main.c                   | 2 +-
- 4 files changed, 3 insertions(+), 5 deletions(-)
-
-diff --git a/testcases/kernel/fs/fs-bench/random-access-del-create.c b/testcases/kernel/fs/fs-bench/random-access-del-create.c
-index 1f62a76b5e..1878fd78b5 100644
---- a/testcases/kernel/fs/fs-bench/random-access-del-create.c
-+++ b/testcases/kernel/fs/fs-bench/random-access-del-create.c
-@@ -11,8 +11,6 @@
- #define FAIL 0
- #define SUCCESS 1
- 
--int openlog[2] = { 0, 0 };
--
- #define MAXNUM 0x100000
- 
- #define  MAXERROR 1024
-diff --git a/testcases/kernel/fs/fs-bench/random-access.c b/testcases/kernel/fs/fs-bench/random-access.c
-index cf41d6e81c..c2f32b86e7 100644
---- a/testcases/kernel/fs/fs-bench/random-access.c
-+++ b/testcases/kernel/fs/fs-bench/random-access.c
-@@ -11,7 +11,7 @@
- #define FAIL 0
- #define SUCCESS 1
- 
--int openlog[2] = { 0, 0 };
-+static int openlog[2] = { 0, 0 };
- 
- #define MAXNUM 0x100000
- 
-diff --git a/testcases/kernel/fs/fs-bench/random-del-create.c b/testcases/kernel/fs/fs-bench/random-del-create.c
-index 0a86f976f3..345031f283 100644
---- a/testcases/kernel/fs/fs-bench/random-del-create.c
-+++ b/testcases/kernel/fs/fs-bench/random-del-create.c
-@@ -11,7 +11,7 @@
- #define FAIL 0
- #define SUCCESS 1
- 
--int openlog[2] = { 0, 0 };
-+static int openlog[2] = { 0, 0 };
- 
- #define MAXNUM 0x100000
- 
-diff --git a/testcases/kernel/fs/scsi/ltpfs/main.c b/testcases/kernel/fs/scsi/ltpfs/main.c
-index 2c67c7a478..90a5531ac3 100644
---- a/testcases/kernel/fs/scsi/ltpfs/main.c
-+++ b/testcases/kernel/fs/scsi/ltpfs/main.c
-@@ -38,7 +38,7 @@ int startc = 0;
- int showchar[] = { 124, 47, 45, 92, 124, 47, 45, 92 };
- 
- int nullFileHandle;
--int openlog[2] = { 0, 0 };
-+static int openlog[2] = { 0, 0 };
- 
- int cFileCount, dFileCount, errorCount;
- static int disk_space_pool = 0;
diff --git a/package/ltp-testsuite/0003-kvm-Fix-undefined-reference-to-__stack_chk_fail.patch b/package/ltp-testsuite/0003-kvm-Fix-undefined-reference-to-__stack_chk_fail.patch
new file mode 100644
index 0000000000..07b17d9e4b
--- /dev/null
+++ b/package/ltp-testsuite/0003-kvm-Fix-undefined-reference-to-__stack_chk_fail.patch
@@ -0,0 +1,41 @@
+From: Petr Vorel <petr.vorel@gmail.com>
+Date: Fri, 10 Jun 2022 09:13:09 +0200
+Subject: [PATCH] kvm: Fix undefined reference to __stack_chk_fail()
+
+Some x86_64 buildroot toolchains (bootlin-x86-64-glibc,
+bootlin-x86-64-musl) try to link to __stack_chk_fail().
+-nostdlib is not enough, it requires also -fno-stack-protector.
+
+x86_64-buildroot-linux-gnu/bin/ld: /tmp/ccgBXEoR.o: in function `handle_page_fault':
+kvm_pagefault01.c:(.text+0x5d): undefined reference to `__stack_chk_fail'
+collect2: error: ld returned 1 exit status
+
+[ upstream status: 1a51aa710 ("kvm: Fix undefined reference to __stack_chk_fail()") ]
+
+Suggested-by: Martin Doucha <mdoucha@suse.cz>
+Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
+Reviewed-by: Martin Doucha <mdoucha@suse.cz>
+Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
+Reviewed-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
+Tested-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
+Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
+---
+ testcases/kernel/kvm/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
+index 8d5193d8e..c5a09719c 100644
+--- a/testcases/kernel/kvm/Makefile
++++ b/testcases/kernel/kvm/Makefile
+@@ -9,7 +9,7 @@ ASFLAGS =
+ CPPFLAGS += -I$(abs_srcdir)/include
+ GUEST_CPPFLAGS = $(CPPFLAGS) -DCOMPILE_PAYLOAD
+ GUEST_CFLAGS = -ffreestanding -O2 -Wall -fno-asynchronous-unwind-tables -mno-mmx -mno-sse
+-GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none
++GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none -fno-stack-protector
+ GUEST_LDLIBS =
+ 
+ FILTER_OUT_MAKE_TARGETS := lib_guest lib_host lib_x86
+-- 
+2.36.1
+
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index 53429fd59f..e13661c08c 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,5 +1,5 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20220121/ltp-full-20220121.tar.xz.sha1
-sha1  211935e901afea1010ec4f70369b782fbee93ed4  ltp-full-20220121.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20220527/ltp-full-20220527.tar.xz.sha1
+sha1  9741b6938ca79ad1f4bea32788a483f86d12fd65  ltp-full-20220527.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  ad002520616fac52362229ea0f1bb9d304fc03ff0096ccb5b1820cee9fc8413a  ltp-full-20220121.tar.xz
+sha256  d635afb5ec7b0de763ab50713baf9fbf65cf089da6e6768f816e4a166cbd17c4  ltp-full-20220527.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index d9b7133b07..ef70174a55 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20220121
+LTP_TESTSUITE_VERSION = 20220527
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
@@ -80,7 +80,6 @@ LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_UCLIBC) += \
 	testcases/misc/math/float/float_bessel.c
 
 LTP_TESTSUITE_UNSUPPORTED_TEST_CASES_$(BR2_TOOLCHAIN_USES_MUSL) += \
-	testcases/kernel/syscalls/confstr/confstr01.c \
 	testcases/kernel/syscalls/fmtmsg/fmtmsg01.c \
 	testcases/kernel/syscalls/getcontext/getcontext01.c \
 	testcases/kernel/syscalls/rt_tgsigqueueinfo/rt_tgsigqueueinfo01.c \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

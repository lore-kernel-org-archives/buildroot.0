Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F255C433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 266A360F7A;
	Sat,  1 Oct 2022 16:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 266A360F7A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s9XWBs6cld3Q; Sat,  1 Oct 2022 16:11:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DE9860EA6;
	Sat,  1 Oct 2022 16:11:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5DE9860EA6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCE191BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A87CF830E2
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:11:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A87CF830E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W5LRqir2iRTr for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:11:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06F2382EA4
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:11:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06F2382EA4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E687E8628C; Sat,  1 Oct 2022 16:11:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Oct 2022 18:10:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c738c47e4d896398b7a0f2b0f7a30967e6b7862
X-Git-Newrev: 40c160f5300642379c1c25945301b0eb99237532
X-Patchwork-Hint: ignore
Message-Id: <20221001161129.E687E8628C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] ltp-testsuite: bump version to 20220930
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=40c160f5300642379c1c25945301b0eb99237532
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove all patches from this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../0002-kvm-Fix-compilation-on-x86.patch          |  40 ------
 ...x-undefined-reference-to-__stack_chk_fail.patch |  41 ------
 ...004-nfs05_make_tree-Restore-5-min-timeout.patch |  31 -----
 ...lls-migrate_pages03-restore-runtime-to-5m.patch |  44 ------
 ...1-3-wait-for-umount-completed-in-thread_b.patch |  63 ---------
 .../0007-netstress-Restore-runtime-to-5m.patch     |  53 -------
 ...ss-Fix-usage-of-variables-from-tst_net.sh.patch | 154 ---------------------
 ...ional-Fix-usage-of-PAGESIZE-from-memcg_li.patch | 121 ----------------
 package/ltp-testsuite/ltp-testsuite.hash           |   6 +-
 package/ltp-testsuite/ltp-testsuite.mk             |   2 +-
 10 files changed, 4 insertions(+), 551 deletions(-)

diff --git a/package/ltp-testsuite/0002-kvm-Fix-compilation-on-x86.patch b/package/ltp-testsuite/0002-kvm-Fix-compilation-on-x86.patch
deleted file mode 100644
index 0dfa652eb5..0000000000
--- a/package/ltp-testsuite/0002-kvm-Fix-compilation-on-x86.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Mon, 6 Jun 2022 20:43:19 +0200
-Subject: [PATCH] kvm: Fix compilation on x86
-
-Buildroot supports i386 pentium toolchains (br-i386-pentium-mmx-musl,
-br-i386-pentium4-full) which fail to compile because as is run without --32.
-
-[ upstream status: a471d87ef ("kvm: Fix compilation on x86") ]
-
-Suggested-by: Martin Doucha <mdoucha@suse.cz>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- testcases/kernel/kvm/Makefile | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
-index adab56952..8d5193d8e 100644
---- a/testcases/kernel/kvm/Makefile
-+++ b/testcases/kernel/kvm/Makefile
-@@ -17,11 +17,14 @@ FILTER_OUT_MAKE_TARGETS := lib_guest lib_host lib_x86
- ifeq ($(HOST_CPU),x86_64)
- 	ifneq (,$(findstring m32,$(CFLAGS)))
- 		HOST_CPU = x86
--		GUEST_CFLAGS += -m32
--		ASFLAGS += --32
- 	endif
- endif
- 
-+ifeq ($(HOST_CPU),x86)
-+	GUEST_CFLAGS += -m32
-+	ASFLAGS += --32
-+endif
-+
- # Some distros enable -pie by default. That breaks KVM payload linking.
- ifdef LTP_CFLAGS_NOPIE
- 	GUEST_CFLAGS += -fno-pie
--- 
-2.36.1
-
diff --git a/package/ltp-testsuite/0003-kvm-Fix-undefined-reference-to-__stack_chk_fail.patch b/package/ltp-testsuite/0003-kvm-Fix-undefined-reference-to-__stack_chk_fail.patch
deleted file mode 100644
index 07b17d9e4b..0000000000
--- a/package/ltp-testsuite/0003-kvm-Fix-undefined-reference-to-__stack_chk_fail.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From: Petr Vorel <petr.vorel@gmail.com>
-Date: Fri, 10 Jun 2022 09:13:09 +0200
-Subject: [PATCH] kvm: Fix undefined reference to __stack_chk_fail()
-
-Some x86_64 buildroot toolchains (bootlin-x86-64-glibc,
-bootlin-x86-64-musl) try to link to __stack_chk_fail().
--nostdlib is not enough, it requires also -fno-stack-protector.
-
-x86_64-buildroot-linux-gnu/bin/ld: /tmp/ccgBXEoR.o: in function `handle_page_fault':
-kvm_pagefault01.c:(.text+0x5d): undefined reference to `__stack_chk_fail'
-collect2: error: ld returned 1 exit status
-
-[ upstream status: 1a51aa710 ("kvm: Fix undefined reference to __stack_chk_fail()") ]
-
-Suggested-by: Martin Doucha <mdoucha@suse.cz>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-Reviewed-by: Martin Doucha <mdoucha@suse.cz>
-Reviewed-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Reviewed-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
-Tested-by: Joerg Vehlow <joerg.vehlow@aox-tech.de>
-Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
----
- testcases/kernel/kvm/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/testcases/kernel/kvm/Makefile b/testcases/kernel/kvm/Makefile
-index 8d5193d8e..c5a09719c 100644
---- a/testcases/kernel/kvm/Makefile
-+++ b/testcases/kernel/kvm/Makefile
-@@ -9,7 +9,7 @@ ASFLAGS =
- CPPFLAGS += -I$(abs_srcdir)/include
- GUEST_CPPFLAGS = $(CPPFLAGS) -DCOMPILE_PAYLOAD
- GUEST_CFLAGS = -ffreestanding -O2 -Wall -fno-asynchronous-unwind-tables -mno-mmx -mno-sse
--GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none
-+GUEST_LDFLAGS = -nostdlib -Wl,--build-id=none -fno-stack-protector
- GUEST_LDLIBS =
- 
- FILTER_OUT_MAKE_TARGETS := lib_guest lib_host lib_x86
--- 
-2.36.1
-
diff --git a/package/ltp-testsuite/0004-nfs05_make_tree-Restore-5-min-timeout.patch b/package/ltp-testsuite/0004-nfs05_make_tree-Restore-5-min-timeout.patch
deleted file mode 100644
index c12449d814..0000000000
--- a/package/ltp-testsuite/0004-nfs05_make_tree-Restore-5-min-timeout.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 463da729537faa6d5ef206912fdec871c1059dac Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Thu, 16 Jun 2022 16:33:31 +0200
-Subject: [PATCH] nfs05_make_tree: Restore 5 min timeout
-
-nfs05_make_tree is a long running test. The previous default timeout 5
-min was enough after reducing runtime in 05be61cf6.
-
-But the new default 30 sec introduced in the concept of max runtime is
-definitely not enough. Restore the previous timeout 5 min.
-
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-
-[ upstream status: 463da729537faa6d5ef206912fdec871c1059dac ]
----
- testcases/network/nfs/nfs_stress/nfs05_make_tree.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-index fdc13bd5d..5456c1bf0 100644
---- a/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-+++ b/testcases/network/nfs/nfs_stress/nfs05_make_tree.c
-@@ -215,4 +215,5 @@ static struct tst_test test = {
- 	.options = opts,
- 	.test_all = do_test,
- 	.setup = setup,
-+	.max_runtime = 300,
- };
--- 
-2.37.1
-
diff --git a/package/ltp-testsuite/0005-syscalls-migrate_pages03-restore-runtime-to-5m.patch b/package/ltp-testsuite/0005-syscalls-migrate_pages03-restore-runtime-to-5m.patch
deleted file mode 100644
index 8229f98d26..0000000000
--- a/package/ltp-testsuite/0005-syscalls-migrate_pages03-restore-runtime-to-5m.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 9fb28002bb2ce988b99d1756ff7b902f76e3472a Mon Sep 17 00:00:00 2001
-From: Jan Stancek <jstancek@redhat.com>
-Date: Tue, 21 Jun 2022 10:37:17 +0200
-Subject: [PATCH] syscalls/migrate_pages03: restore runtime to 5m
-
-Arches with large pages have trouble completing all loops in 30s,
-restore runtime to 5m. Also check for remaining runtime and
-exit if we run out.
-
-Signed-off-by: Jan Stancek <jstancek@redhat.com>
-Reviewed-by: Cyril Hrubis <chrubis@suse.cz>
-Signed-off-by: Li Wang <liwang@redhat.com>
-[ upstream status: 9fb28002bb2ce988b99d1756ff7b902f76e3472a ]
----
- testcases/kernel/syscalls/migrate_pages/migrate_pages03.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
-index c6afb4cce..2866c96e6 100644
---- a/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
-+++ b/testcases/kernel/syscalls/migrate_pages/migrate_pages03.c
-@@ -127,6 +127,11 @@ static void migrate_test(void)
- 			tst_res(TFAIL | TERRNO, "migrate_pages() failed");
- 			return;
- 		}
-+
-+		if (!tst_remaining_runtime()) {
-+			tst_res(TINFO, "Out of runtime, exitting...");
-+			break;
-+		}
- 	}
- 	SAFE_SETEUID(0);
- 
-@@ -134,6 +139,7 @@ static void migrate_test(void)
- }
- 
- static struct tst_test test = {
-+	.max_runtime = 300,
- 	.min_kver = "2.6.32",
- 	.needs_root = 1,
- 	.setup = setup,
--- 
-2.37.1
-
diff --git a/package/ltp-testsuite/0006-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch b/package/ltp-testsuite/0006-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
deleted file mode 100644
index 73904806fd..0000000000
--- a/package/ltp-testsuite/0006-mountns0-1-3-wait-for-umount-completed-in-thread_b.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 6d4c8343d33e7d8fa059246310413f029a9e8573 Mon Sep 17 00:00:00 2001
-From: Li Wang <liwang@redhat.com>
-Date: Thu, 7 Jul 2022 17:38:45 +0800
-Subject: [PATCH] mountns0[1-3]: wait for umount completed in thread_b
-
-To get rid of race condition (occurs with umount_folders):
-
-    mountns01.c:42: TPASS: shared mount in parent passed
-    mountns01.c:83: TPASS: shared mount in child passed
-    tst_device.c:394: TWARN: umount('B') failed with EINVAL
-    mountns.h:39: TWARN: umount(B) failed: EINVAL (22)
-
-Signed-off-by: Li Wang <liwang@redhat.com>
-Reviewed-by: Yang Xu <xuyang2018.jy@fujitsu.com>
-[ upstream status: 6d4c8343d33e7d8fa059246310413f029a9e8573 ]
----
- testcases/kernel/containers/mountns/mountns01.c | 2 ++
- testcases/kernel/containers/mountns/mountns02.c | 2 ++
- testcases/kernel/containers/mountns/mountns03.c | 2 ++
- 3 files changed, 6 insertions(+)
-
-diff --git a/testcases/kernel/containers/mountns/mountns01.c b/testcases/kernel/containers/mountns/mountns01.c
-index e99134aba..e8f176920 100644
---- a/testcases/kernel/containers/mountns/mountns01.c
-+++ b/testcases/kernel/containers/mountns/mountns01.c
-@@ -86,6 +86,8 @@ static void run(void)
- 
- 	TST_CHECKPOINT_WAKE(0);
- 
-+	SAFE_WAIT(NULL);
-+
- 	SAFE_UMOUNT(DIRA);
- }
- 
-diff --git a/testcases/kernel/containers/mountns/mountns02.c b/testcases/kernel/containers/mountns/mountns02.c
-index 258b61217..4b85fa79b 100644
---- a/testcases/kernel/containers/mountns/mountns02.c
-+++ b/testcases/kernel/containers/mountns/mountns02.c
-@@ -87,6 +87,8 @@ static void run(void)
- 
- 	TST_CHECKPOINT_WAKE(0);
- 
-+	SAFE_WAIT(NULL);
-+
- 	SAFE_UMOUNT(DIRA);
- }
- 
-diff --git a/testcases/kernel/containers/mountns/mountns03.c b/testcases/kernel/containers/mountns/mountns03.c
-index f37ae7902..1d26a25d8 100644
---- a/testcases/kernel/containers/mountns/mountns03.c
-+++ b/testcases/kernel/containers/mountns/mountns03.c
-@@ -97,6 +97,8 @@ static void run(void)
- 
- 	TST_CHECKPOINT_WAKE(0);
- 
-+	SAFE_WAIT(NULL);
-+
- 	SAFE_UMOUNT(DIRA);
- }
- 
--- 
-2.37.1
-
diff --git a/package/ltp-testsuite/0007-netstress-Restore-runtime-to-5m.patch b/package/ltp-testsuite/0007-netstress-Restore-runtime-to-5m.patch
deleted file mode 100644
index acaccf1e1f..0000000000
--- a/package/ltp-testsuite/0007-netstress-Restore-runtime-to-5m.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From cc4a27c235d0cf69a55cd8829b232566b0223333 Mon Sep 17 00:00:00 2001
-From: Petr Vorel <pvorel@suse.cz>
-Date: Wed, 13 Jul 2022 09:46:14 +0200
-Subject: [PATCH] netstress: Restore runtime to 5m
-
-netstress requires the previous default timeout 5m due longer timeout
-for higher message sizes (e.g. 65535):
-
-./sctp_ipsec.sh -6 -p comp -m transport -s 100:1000:65535:R65535
-sctp_ipsec 1 TPASS: netstress passed, median time 5 ms, data: 5 9 6 5 5
-sctp_ipsec 2 TINFO: run server 'netstress -T sctp -S fd00:1:1:1::1 -D ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa'
-sctp_ipsec 2 TINFO: run client 'netstress -l -T sctp -H fd00:1:1:1::1 -n 1000 -N 1000 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d /tmp/LTP_sctp_ipsec.ARZbGkvjPa/tst_netload.res' 5 times
-sctp_ipsec 2 TPASS: netstress passed, median time 6 ms, data: 8 6 6 5 6
-sctp_ipsec 3 TINFO: run server 'netstress -T sctp -S fd00:1:1:1::1 -D ltp_ns_veth1 -R 500000 -B /tmp/LTP_sctp_ipsec.ARZbGkvjPa'
-sctp_ipsec 3 TINFO: run client 'netstress -l -T sctp -H fd00:1:1:1::1 -n 65535 -N 65535 -S fd00:1:1:1::2 -D ltp_ns_veth2 -a 2 -r 100 -d /tmp/LTP_sctp_ipsec.ARZbGkvjPa/tst_netload.res' 5 times
-sctp_ipsec 3 TWARN: netstress failed, ret: 2
-tst_test.c:1526: TINFO: Timeout per run is 0h 00m 30s
-netstress.c:896: TINFO: IP_BIND_ADDRESS_NO_PORT is used
-netstress.c:898: TINFO: connection: addr 'fd00:1:1:1::1', port '55097'
-netstress.c:900: TINFO: client max req: 100
-netstress.c:901: TINFO: clients num: 2
-netstress.c:906: TINFO: client msg size: 65535
-netstress.c:907: TINFO: server msg size: 65535
-netstress.c:979: TINFO: SCTP client
-netstress.c:475: TINFO: Running the test over IPv6
-Test timeouted, sending SIGKILL!
-tst_test.c:1577: TINFO: If you are running on slow machine, try exporting LTP_TIMEOUT_MUL > 1
-tst_test.c:1579: TBROK: Test killed! (timeout?)
-
-Converting netstress.c to use TST_NO_DEFAULT_MAIN (i.e. implementing main)
-would require more changes, because it uses .forks_child, .needs_checkpoints,
-cleanup function.
-
-Signed-off-by: Petr Vorel <pvorel@suse.cz>
-[ upstream status: cc4a27c235d0cf69a55cd8829b232566b0223333 ]
----
- testcases/network/netstress/netstress.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/testcases/network/netstress/netstress.c b/testcases/network/netstress/netstress.c
-index 6c9e83112..7c222531d 100644
---- a/testcases/network/netstress/netstress.c
-+++ b/testcases/network/netstress/netstress.c
-@@ -1028,5 +1028,6 @@ static struct tst_test test = {
- 		{"B:", &server_bg, "Run in background, arg is the process directory"},
- 		{}
- 	},
-+	.max_runtime = 300,
- 	.needs_checkpoints = 1,
- };
--- 
-2.37.1
-
diff --git a/package/ltp-testsuite/0008-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch b/package/ltp-testsuite/0008-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
deleted file mode 100644
index ba187366ff..0000000000
--- a/package/ltp-testsuite/0008-net_stress-Fix-usage-of-variables-from-tst_net.sh.patch
+++ /dev/null
@@ -1,154 +0,0 @@
-From 33c156e295e35d4839a135d8ba5db485b7712ced Mon Sep 17 00:00:00 2001
-From: Joerg Vehlow <joerg.vehlow@aox.de>
-Date: Mon, 27 Jun 2022 09:27:09 +0200
-Subject: [PATCH] net_stress: Fix usage of variables from tst_net.sh
-
-These tests use variables (NS_TIMES, IP_TOTAL, ROUTE_TOTAL
-and IF_UPDOWN_TIMES) from tst_net.sh, before sourcing it.
-
-Fixes: 04021637f ("tst_test.sh: Cleanup getopts usage")
-
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
-[ upstream status: 33c156e295e35d4839a135d8ba5db485b7712ced ]
----
- testcases/network/stress/interface/if-addr-adddel.sh    | 7 ++++---
- testcases/network/stress/interface/if-addr-addlarge.sh  | 7 ++++---
- testcases/network/stress/interface/if-route-adddel.sh   | 5 +++--
- testcases/network/stress/interface/if-route-addlarge.sh | 5 +++--
- testcases/network/stress/interface/if-updown.sh         | 5 +++--
- testcases/network/stress/interface/if4-addr-change.sh   | 4 +++-
- 6 files changed, 20 insertions(+), 13 deletions(-)
-
-diff --git a/testcases/network/stress/interface/if-addr-adddel.sh b/testcases/network/stress/interface/if-addr-adddel.sh
-index cb453e612..0750501f0 100755
---- a/testcases/network/stress/interface/if-addr-adddel.sh
-+++ b/testcases/network/stress/interface/if-addr-adddel.sh
-@@ -7,9 +7,6 @@
- 
- IF_CMD='ifconfig'
- 
--# The interval of the check interface activity
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
--
- test_body()
- {
- 	local cmd="$CMD"
-@@ -89,4 +86,8 @@ test_body()
- }
- 
- . if-lib.sh
-+
-+# The interval of the check interface activity
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
-+
- tst_run
-diff --git a/testcases/network/stress/interface/if-addr-addlarge.sh b/testcases/network/stress/interface/if-addr-addlarge.sh
-index 3c876c17d..d0759c86b 100755
---- a/testcases/network/stress/interface/if-addr-addlarge.sh
-+++ b/testcases/network/stress/interface/if-addr-addlarge.sh
-@@ -7,9 +7,6 @@
- 
- IF_CMD='ifconfig'
- 
--# The interval of the check interface activity
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IP_TOTAL / 20))}
--
- test_body()
- {
- 	local cmd="$CMD"
-@@ -110,4 +107,8 @@ test_body()
- }
- 
- . if-lib.sh
-+
-+# The interval of the check interface activity
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IP_TOTAL / 20))}
-+
- tst_run
-diff --git a/testcases/network/stress/interface/if-route-adddel.sh b/testcases/network/stress/interface/if-route-adddel.sh
-index b50da268a..51445e4f7 100755
---- a/testcases/network/stress/interface/if-route-adddel.sh
-+++ b/testcases/network/stress/interface/if-route-adddel.sh
-@@ -7,8 +7,6 @@
- 
- IF_CMD='route'
- 
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
--
- test_body()
- {
- 	local cmd="$CMD"
-@@ -64,4 +62,7 @@ test_body()
- }
- 
- . if-lib.sh
-+
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
-+
- tst_run
-diff --git a/testcases/network/stress/interface/if-route-addlarge.sh b/testcases/network/stress/interface/if-route-addlarge.sh
-index 7d09d1216..355b6b4ab 100755
---- a/testcases/network/stress/interface/if-route-addlarge.sh
-+++ b/testcases/network/stress/interface/if-route-addlarge.sh
-@@ -7,8 +7,6 @@
- 
- IF_CMD='route'
- 
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($ROUTE_TOTAL / 20))}
--
- test_body()
- {
- 	local cmd="$CMD"
-@@ -76,4 +74,7 @@ test_body()
- }
- 
- . if-lib.sh
-+
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($ROUTE_TOTAL / 20))}
-+
- tst_run
-diff --git a/testcases/network/stress/interface/if-updown.sh b/testcases/network/stress/interface/if-updown.sh
-index 9a5709c85..71c78d785 100755
---- a/testcases/network/stress/interface/if-updown.sh
-+++ b/testcases/network/stress/interface/if-updown.sh
-@@ -8,8 +8,6 @@
- IF_CMD='ifconfig'
- TST_CLEANUP="if_cleanup_restore"
- 
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IF_UPDOWN_TIMES / 20))}
--
- test_body()
- {
- 	local cmd="$CMD"
-@@ -47,4 +45,7 @@ test_body()
- }
- 
- . if-lib.sh
-+
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($IF_UPDOWN_TIMES / 20))}
-+
- tst_run
-diff --git a/testcases/network/stress/interface/if4-addr-change.sh b/testcases/network/stress/interface/if4-addr-change.sh
-index b9ece2af9..f162e6a51 100755
---- a/testcases/network/stress/interface/if4-addr-change.sh
-+++ b/testcases/network/stress/interface/if4-addr-change.sh
-@@ -9,7 +9,6 @@ TST_CLEANUP="do_cleanup"
- TST_TESTFUNC="test_body"
- TST_NEEDS_CMDS="ifconfig"
- 
--CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
- # Maximum host portion of the IPv4 address on the local host
- LHOST_IPV4_HOST_MAX="254"
- 
-@@ -61,4 +60,7 @@ test_body()
- }
- 
- . tst_net.sh
-+
-+CHECK_INTERVAL=${CHECK_INTERVAL:-$(($NS_TIMES / 20))}
-+
- tst_run
--- 
-2.37.1
-
diff --git a/package/ltp-testsuite/0009-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch b/package/ltp-testsuite/0009-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
deleted file mode 100644
index 6cc36cda79..0000000000
--- a/package/ltp-testsuite/0009-memcg-functional-Fix-usage-of-PAGESIZE-from-memcg_li.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From bda92ad659a52d38ac810099f69adff626b064c6 Mon Sep 17 00:00:00 2001
-From: Joerg Vehlow <joerg.vehlow@aox.de>
-Date: Mon, 27 Jun 2022 10:44:49 +0200
-Subject: [PATCH] memcg/functional: Fix usage of PAGESIZE from memcg_lib.sh
-
-$PAGESIZES is set in memcg_lib.sh, which was moved to the bottom of the file.
-
-Fixes: 04021637f ("tst_test.sh: Cleanup getopts usage")
-
-Reviewed-by: Petr Vorel <pvorel@suse.cz>
-Signed-off-by: Joerg Vehlow <joerg.vehlow@aox.de>
-[ upstream status: bda92ad659a52d38ac810099f69adff626b064c6 ]
----
- .../controllers/memcg/functional/memcg_failcnt.sh      |  7 ++++---
- .../memcg/functional/memcg_max_usage_in_bytes_test.sh  | 10 +++++-----
- .../memcg/functional/memcg_subgroup_charge.sh          |  8 ++++----
- .../memcg/functional/memcg_usage_in_bytes_test.sh      | 10 +++++-----
- 4 files changed, 18 insertions(+), 17 deletions(-)
-
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
-index 1fed01569..1be98a056 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_failcnt.sh
-@@ -12,9 +12,6 @@ MEMCG_TESTFUNC=test
- MEMCG_SHMMAX=1
- TST_TEST_DATA="--mmap-anon --mmap-file --shm"
- 
--MEMORY_LIMIT=$PAGESIZE
--MEMORY_TO_ALLOCATE=$((MEMORY_LIMIT * 2))
--
- test()
- {
- 	ROD echo $MEMORY_LIMIT \> memory.limit_in_bytes
-@@ -36,4 +33,8 @@ test()
- }
- 
- . memcg_lib.sh
-+
-+MEMORY_LIMIT=$PAGESIZE
-+MEMORY_TO_ALLOCATE=$((MEMORY_LIMIT * 2))
-+
- tst_run
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
-index d1ffbe053..302810513 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_max_usage_in_bytes_test.sh
-@@ -9,11 +9,6 @@
- MEMCG_TESTFUNC=test
- TST_CNT=4
- 
--
--MEM_TO_ALLOC=$((PAGESIZE * 1024))
--MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
--MEM_LIMIT=$((MEM_TO_ALLOC * 2))
--
- # Run test cases which checks memory.[memsw.]max_usage_in_bytes after make
- # some memory allocation
- test_max_usage_in_bytes()
-@@ -88,4 +83,9 @@ test4()
- }
- 
- . memcg_lib.sh
-+
-+MEM_TO_ALLOC=$((PAGESIZE * 1024))
-+MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
-+MEM_LIMIT=$((MEM_TO_ALLOC * 2))
-+
- tst_run
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
-index 08b6697d4..9bcc01258 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_subgroup_charge.sh
-@@ -12,10 +12,6 @@
- MEMCG_TESTFUNC=test
- TST_CNT=3
- 
--
--# Allocate memory bigger than per-cpu kernel memory
--MEM_TO_ALLOC=$((PAGESIZES * 2))
--
- # Test the memory charge won't move to subgroup
- # $1 - memory.limit_in_bytes in sub group
- test_subgroup()
-@@ -67,4 +63,8 @@ test3()
- }
- 
- . memcg_lib.sh
-+
-+# Allocate memory bigger than per-cpu kernel memory
-+MEM_TO_ALLOC=$((PAGESIZES * 2))
-+
- tst_run
-diff --git a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
-index 6f932124e..125d88e55 100755
---- a/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
-+++ b/testcases/kernel/controllers/memcg/functional/memcg_usage_in_bytes_test.sh
-@@ -9,11 +9,6 @@
- MEMCG_TESTFUNC=test
- TST_CNT=2
- 
--
--MEM_TO_ALLOC=$((PAGESIZE * 1024))
--MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
--MEM_LIMIT=$((MEM_TO_ALLOC * 2))
--
- test1()
- {
- 	tst_res TINFO "Test memory.usage_in_bytes"
-@@ -35,4 +30,9 @@ test2()
- }
- 
- . memcg_lib.sh
-+
-+MEM_TO_ALLOC=$((PAGESIZE * 1024))
-+MEM_EXPECTED_UPPER=$((MEM_TO_ALLOC + MEM_USAGE_RANGE))
-+MEM_LIMIT=$((MEM_TO_ALLOC * 2))
-+
- tst_run
--- 
-2.37.1
-
diff --git a/package/ltp-testsuite/ltp-testsuite.hash b/package/ltp-testsuite/ltp-testsuite.hash
index e13661c08c..8b411a8ffe 100644
--- a/package/ltp-testsuite/ltp-testsuite.hash
+++ b/package/ltp-testsuite/ltp-testsuite.hash
@@ -1,5 +1,5 @@
-# From: https://github.com/linux-test-project/ltp/releases/download/20220527/ltp-full-20220527.tar.xz.sha1
-sha1  9741b6938ca79ad1f4bea32788a483f86d12fd65  ltp-full-20220527.tar.xz
+# From: https://github.com/linux-test-project/ltp/releases/download/20220527/ltp-full-20220527.tar.bz2.sha1
+sha1  c8d658cd3ab1f5a5c7b5bf56398d3a9525012c6b  ltp-full-20220930.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
-sha256  d635afb5ec7b0de763ab50713baf9fbf65cf089da6e6768f816e4a166cbd17c4  ltp-full-20220527.tar.xz
+sha256  533ab63915b916640667ecce17ee4998006d80d394d4b1f1d105a7aa1df50d38  ltp-full-20220930.tar.xz
diff --git a/package/ltp-testsuite/ltp-testsuite.mk b/package/ltp-testsuite/ltp-testsuite.mk
index 23be3d25c9..34412d562f 100644
--- a/package/ltp-testsuite/ltp-testsuite.mk
+++ b/package/ltp-testsuite/ltp-testsuite.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTP_TESTSUITE_VERSION = 20220527
+LTP_TESTSUITE_VERSION = 20220930
 LTP_TESTSUITE_SOURCE = ltp-full-$(LTP_TESTSUITE_VERSION).tar.xz
 LTP_TESTSUITE_SITE = https://github.com/linux-test-project/ltp/releases/download/$(LTP_TESTSUITE_VERSION)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E70C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C08281496;
	Sat,  8 Jan 2022 18:59:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sHw0bE-Css9b; Sat,  8 Jan 2022 18:59:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6270081493;
	Sat,  8 Jan 2022 18:59:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FF981BF95D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C84860A90
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:59:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 82F4bnixmLfG for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:59:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6240B60A89
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:59:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 88EE3832FF; Sat,  8 Jan 2022 18:52:55 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 19:57:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6691d122ce25fc580ca88243f79f75cc2808ca7
X-Git-Newrev: f88a08aeedfb1d0ad57ee6b7f8ff306252308d6d
X-Patchwork-Hint: ignore
Message-Id: <20220108185255.88EE3832FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/babeltrace2: bump to version 2.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=f88a08aeedfb1d0ad57ee6b7f8ff306252308d6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop second patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/efficios/babeltrace/releases/tag/v2.0.4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...test_trace_ir_ref.c-rename-user-structure.patch | 57 ----------------------
 package/babeltrace2/babeltrace2.hash               | 12 ++---
 package/babeltrace2/babeltrace2.mk                 |  2 +-
 3 files changed, 7 insertions(+), 64 deletions(-)

diff --git a/package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch b/package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch
deleted file mode 100644
index ac9eee82d8..0000000000
--- a/package/babeltrace2/0002-tests-lib-test_trace_ir_ref.c-rename-user-structure.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From 7a27f13c192d15cae47740f3e884bba16f15ed41 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 26 Sep 2020 22:03:10 +0200
-Subject: [PATCH] tests/lib/test_trace_ir_ref.c: rename user structure
-
-Rename user structure to bt_user to avoid the following build failure
-with uclibc:
-
-test_trace_ir_ref.c:41:8: error: redefinition of 'struct user'
- struct user {
-        ^
-In file included from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/procfs.h:33,
-                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/ucontext.h:25,
-                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/signal.h:329,
-                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0/glib/gbacktrace.h:36,
-                 from /home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/bin/../arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/glib-2.0/glib.h:34,
-                 from ../../src/common/assert.h:28,
-                 from ../../src/lib/object.h:28,
-                 from test_trace_ir_ref.c:25:
-/home/naourr/work/instance-0/output-1/per-package/babeltrace2/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/sys/user.h:48:8: note: originally defined here
- struct user
-        ^~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/e4229e2b9c892b419a9d2eaa6929b80ea62dd130
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/efficios/babeltrace/pull/115]
----
- tests/lib/test_trace_ir_ref.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/tests/lib/test_trace_ir_ref.c b/tests/lib/test_trace_ir_ref.c
-index d5dfa9cf..70caf29c 100644
---- a/tests/lib/test_trace_ir_ref.c
-+++ b/tests/lib/test_trace_ir_ref.c
-@@ -25,7 +25,7 @@
- 
- #define NR_TESTS 37
- 
--struct user {
-+struct bt_user {
- 	bt_trace_class *tc;
- 	bt_stream_class *sc;
- 	bt_event_class *ec;
-@@ -265,7 +265,7 @@ static void test_example_scenario(bt_self_component_source *self_comp)
- 	bt_stream_class *weak_sc1 = NULL, *weak_sc2 = NULL;
- 	bt_event_class *weak_ec1 = NULL, *weak_ec2 = NULL,
- 			*weak_ec3 = NULL;
--	struct user user_a = { 0 }, user_b = { 0 }, user_c = { 0 };
-+	struct bt_user user_a = { 0 }, user_b = { 0 }, user_c = { 0 };
- 
- 	/* The only reference which exists at this point is on TC1. */
- 	tc1 = create_tc1(self_comp);
--- 
-2.28.0
-
diff --git a/package/babeltrace2/babeltrace2.hash b/package/babeltrace2/babeltrace2.hash
index 27c47ba26f..164e65cded 100644
--- a/package/babeltrace2/babeltrace2.hash
+++ b/package/babeltrace2/babeltrace2.hash
@@ -1,8 +1,8 @@
-# From https://www.efficios.com/files/babeltrace/babeltrace2-2.0.3.tar.bz2.sha256
-sha256 a53625152554102d868ba8395347d0daba0bec9c4b854c3e9bd97c77b0bf04a0  babeltrace2-2.0.3.tar.bz2
+# From https://www.efficios.com/files/babeltrace/babeltrace2-2.0.4.tar.bz2.sha256
+sha256  774f116685dab5db9c51577dde43c8c1df482aae6bb78a089b1e9e7c8b489bca  babeltrace2-2.0.4.tar.bz2
 
 # Hash for license files
-sha256 d919c6347409efde6dea63c6f349fb06bc060a2b721fc3df07b5f720b5f1d60e  LICENSE
-sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
-sha256 c68fd1ffc1623ea0dace21abf57305818e4998a4ae0c79010aaaa943eb660b55  lgpl-2.1.txt
-sha256 2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
+sha256  d919c6347409efde6dea63c6f349fb06bc060a2b721fc3df07b5f720b5f1d60e  LICENSE
+sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  gpl-2.0.txt
+sha256  c68fd1ffc1623ea0dace21abf57305818e4998a4ae0c79010aaaa943eb660b55  lgpl-2.1.txt
+sha256  2f801b7c2494850c3d91da820eb230502dc0192c9d0db024db37ec08d0be1434  mit-license.txt
diff --git a/package/babeltrace2/babeltrace2.mk b/package/babeltrace2/babeltrace2.mk
index 1e03f5fdd2..eedfc72b8c 100644
--- a/package/babeltrace2/babeltrace2.mk
+++ b/package/babeltrace2/babeltrace2.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 BABELTRACE2_SITE = https://www.efficios.com/files/babeltrace
-BABELTRACE2_VERSION = 2.0.3
+BABELTRACE2_VERSION = 2.0.4
 BABELTRACE2_SOURCE = babeltrace2-$(BABELTRACE2_VERSION).tar.bz2
 BABELTRACE2_LICENSE = MIT, LGPL-2.1 (src/common/list.h), GPL-2.0 (test code)
 BABELTRACE2_LICENSE_FILES = mit-license.txt lgpl-2.1.txt gpl-2.0.txt LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

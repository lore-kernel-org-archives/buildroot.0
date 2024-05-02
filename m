Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 978DAC04FFE
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 11:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D44A60EA7;
	Thu,  2 May 2024 11:30:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T655GKBTSnmU; Thu,  2 May 2024 11:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A4FD60EAC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A4FD60EAC;
	Thu,  2 May 2024 11:30:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E8E681BF990
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 11:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D214040124
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 11:30:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-n9nSE77tW2 for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 11:30:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07CAB400AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 07CAB400AB
 for <buildroot@buildroot.org>; Thu,  2 May 2024 11:30:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8BB186622; Thu,  2 May 2024 11:30:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 2 May 2024 13:28:45 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3b0771d4d5834eb39af313e065efd4623ec3f338
X-Git-Newrev: 344bcb651b944105cea6b5c3b7c442a1f135f9f2
X-Patchwork-Hint: ignore
Message-Id: <20240502113002.E8BB186622@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libtracefs: fix
 musl build
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

commit: https://git.buildroot.net/buildroot/commit/?id=344bcb651b944105cea6b5c3b7c442a1f135f9f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fix the following musl build failure raised since the addition of the
package in commit b1dbd3f679e6660325472e3fdca72127d74e6929 if cunit is
found:

../utest/tracefs-utest.c: In function 'test_uprobes_instance':
../utest/tracefs-utest.c:2492:19: error: 'PATH_MAX' undeclared (first use in this function)
 2492 |         char self[PATH_MAX] = { 0 };
      |                   ^~~~~~~~

Fixes: b1dbd3f679e6660325472e3fdca72127d74e6929
 - http://autobuild.buildroot.org/results/1a01883231dbc8a7688de26db9a08751165fe8fe

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit dece32b6f3957320bcb689394164151dd8707f3b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Add-PATH_MAX-if-it-is-not-already-defined.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch b/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
new file mode 100644
index 0000000000..121fee5adf
--- /dev/null
+++ b/package/libtracefs/0002-libtracefs-utest-Add-PATH_MAX-if-it-is-not-already-defined.patch
@@ -0,0 +1,40 @@
+From ba750812f68f0f3314494558496c23f934f8faff Mon Sep 17 00:00:00 2001
+From: "Steven Rostedt (Google)" <rostedt@goodmis.org>
+Date: Thu, 22 Feb 2024 11:02:46 -0500
+Subject: libtracefs utest: Add PATH_MAX if it is not already defined
+
+In some setups PATH_MAX may not be defined (it is usually defined in
+linux/limits.h), but we just use PATH_MAX as something to hold the paths
+to the tracing files. In that case, just define it to 1024 if it's not
+already defined.
+
+Link: https://lore.kernel.org/linux-trace-devel/20240222-utest-fixes-v2-1-7b8ee8dca0b7@gmail.com/
+
+Fixes: 845f16976929 ("libtracefs: Add unit tests")
+Reported-by: Miko Larsson <mikoxyzzz@gmail.com>
+Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
+
+Upstream: https://git.kernel.org/pub/scm/libs/libtrace/libtracefs.git/commit/?id=ba750812f68f0f3314494558496c23f934f8faff
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ utest/tracefs-utest.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/utest/tracefs-utest.c b/utest/tracefs-utest.c
+index 963fac7..07ecd32 100644
+--- a/utest/tracefs-utest.c
++++ b/utest/tracefs-utest.c
+@@ -26,6 +26,10 @@
+ 
+ #define gettid() syscall(__NR_gettid)
+ 
++#ifndef PATH_MAX
++#define PATH_MAX 1024
++#endif
++
+ #define TRACEFS_SUITE		"tracefs library"
+ #define TEST_INSTANCE_NAME	"cunit_test_iter"
+ #define TEST_TRACE_DIR		"/tmp/trace_utest.XXXXXX"
+-- 
+cgit 1.2.3-korg
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

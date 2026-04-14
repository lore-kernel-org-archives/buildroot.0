Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680E1F9D0EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25A7542740;
	Tue, 14 Apr 2026 17:48:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONdYY_G1CUMv; Tue, 14 Apr 2026 17:48:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 484A742741
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188935;
	bh=kU7lwAIeUTx2kLv8IJU5F8ujpne21laMBF8vvPWg5YM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lLFJbBOxfUcz+mUzufW5/nwg4b+UEVt34PvCkUSbQF/sJYHyffYrj2tea6FxZDLnh
	 08nigif8AVlvN3YzhkZYbX52Yt47/vKd46KhOUMmr9YKwntx7J3iY3Hy4lFQkN3x4J
	 FnN/jAibJqytsD7io5NPDD2HdCkpNEU5IVAzhgKGn2XkF8XJcI77tc+A1EO7dbUbMs
	 t9JTYF/6sBCpZWN9muzgBarCaUgWthsV1+VVmwEs4NGSx2ITdaCBz+SW0yx212ATPl
	 FoemQldtMNPnIUrdiDiRZjmGK7EDG27FGZHrI49DFQpSS/19NSppEO/2vcIujL/KOD
	 KuXwBY61b5nsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 484A742741;
	Tue, 14 Apr 2026 17:48:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E277A375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8ECC40422
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5BeIL9j5g8OP for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBB2C4004E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBB2C4004E
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E1917FB2D; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20a87376c74f1640fa45dfee6a23600a30d3e715
X-Git-Newrev: 428e0e292be4d6b41af9db893a97e90cc1730e4e
X-Patchwork-Hint: ignore
Message-Id: <20260414174849.4E1917FB2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-icap: fix musl build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/428e0e292be4d6b41af9db893a97e90cc1730e4e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/33b/33bb3ea8ac36da7f40a82c580d3614f0b34a7ab2/

The oldest build error dates back to June 2024 so this patch should be
backported to LTS branches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...-printing-in-various-printf-to-avoid-warn.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch b/package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch
new file mode 100644
index 0000000000..7183efa46f
--- /dev/null
+++ b/package/c-icap/0006-Fix-integer-printing-in-various-printf-to-avoid-warn.patch
@@ -0,0 +1,47 @@
+From 8ef8966237865ec699ab16d208ff56edaac4ff7b Mon Sep 17 00:00:00 2001
+From: Christos Tsantilas <christos@chtsanti.net>
+Date: Fri, 1 Nov 2019 08:00:52 -0700
+Subject: [PATCH] Fix integer printing in various printf to avoid warnings
+ about integer sizes
+
+Upstream: https://github.com/c-icap/c-icap-server/commit/8ef8966237865ec699ab16d208ff56edaac4ff7b
+
+[Bernd: partially backported to 0.5.10]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ mpmt_server.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/mpmt_server.c b/mpmt_server.c
+index a30d55d4..9b178a66 100644
+--- a/mpmt_server.c
++++ b/mpmt_server.c
+@@ -74,7 +74,7 @@ typedef struct server_decl {
+ 
+ ci_thread_mutex_t threads_list_mtx;
+ server_decl_t **threads_list = NULL;
+-ci_thread_t listener_thread_id = -1;
++ci_thread_t listener_thread_id;
+ int listener_running = 0;
+ 
+ ci_thread_cond_t free_server_cond;
+@@ -242,8 +242,8 @@ static void cancel_all_threads()
+         for (i=0; i<CI_CONF.THREADS_PER_CHILD; i++) {
+             if (threads_list[i] != NULL) { /* if the i thread is still alive*/
+                 if (!threads_list[i]->running) { /*if the i thread is not running any more*/
+-                    ci_debug_printf(5, "Cancel server %d, thread_id %lu (%d)\n",
+-                                    threads_list[i]->srv_id, threads_list[i]->srv_pthread,
++                    ci_debug_printf(5, "Cancel server %" PRIu64 ", thread_id %" PRIu64 " (%d)\n",
++                                    (uint64_t)threads_list[i]->srv_id, (uint64_t)threads_list[i]->srv_pthread,
+                                     i);
+                     ci_thread_join(threads_list[i]->srv_pthread);
+                     release_thread_i(i);
+@@ -252,7 +252,7 @@ static void cancel_all_threads()
+                     /*The thread is still running, and we have a timeout for waiting
+                       the thread to exit. */
+                     if (wait_for_workers <= 2) {
+-                        ci_debug_printf(5, "Thread %ld still running near the timeout. Try to kill it\n", threads_list[i]->srv_pthread);
++		        ci_debug_printf(5, "Thread %" PRIu64 " still running near the timeout. Try to kill it\n", (uint64_t)threads_list[i]->srv_pthread);
+                         pthread_kill( threads_list[i]->srv_pthread, SIGTERM);
+                     }
+                 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

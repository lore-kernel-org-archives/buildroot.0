Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EFCC4332F
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 08:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3301E607CE;
	Mon, 26 Dec 2022 08:46:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3301E607CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xRfuVgTnbMo8; Mon, 26 Dec 2022 08:46:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E0C8607FE;
	Mon, 26 Dec 2022 08:46:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E0C8607FE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AB591BF3A9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 08:46:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D858081264
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 08:46:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D858081264
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aQMxU4TjLLH8 for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 08:46:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D332781260
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 08:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D332781260
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFFA386D4A; Mon, 26 Dec 2022 08:46:05 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 09:43:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b0ac1d62bb2b998cba17699216e9fed7caeb976
X-Git-Newrev: b9b155e45faa9fb941c1a4fc51baea82b6496dff
X-Patchwork-Hint: ignore
Message-Id: <20221226084605.BFFA386D4A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liboping: fix build with
 ncurses-6.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=b9b155e45faa9fb941c1a4fc51baea82b6496dff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.busybox.net/buildroot/commit/?id=a38a30eb3a46570705642dc37235ddcc1471b434
bumped ncurses to version 6.3 which breaks build of liboping.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...-always-use-s-style-format-for-printf-sty.patch | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch b/package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch
new file mode 100644
index 0000000000..3b68feea3d
--- /dev/null
+++ b/package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch
@@ -0,0 +1,59 @@
+From 670834fd8fbd2533ea25ca83065800e924116579 Mon Sep 17 00:00:00 2001
+From: Sergei Trofimovich <slyich@gmail.com>
+Date: Mon, 15 Nov 2021 08:05:43 +0000
+Subject: [PATCH] src/oping.c: always use "%s"-style format for
+ printf()-style functions
+
+`ncuses-6.3` added printf-style function attributes and now makes
+it easier to catch cases when user input is used in palce of format
+string when built with CFLAGS=-Werror=format-security:
+
+    oping.c:1265:41: error: format not a string literal and no format arguments [-Werror=format-security]
+     1265 |                                         hist_symbols_utf8[index]);
+          |                                         ^~~~~~~~~~~~~~~~~
+
+Let's wrap all the missing places with "%s" format.
+
+Downloaded from upstream PR https://github.com/octo/liboping/pull/61
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for liboping version 1.10.0]
+---
+ src/oping.c | 7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/src/oping.c b/src/oping.c
+index c087c80..af4a0cb 100644
+--- a/src/oping.c
++++ b/src/oping.c
+@@ -1156,7 +1156,7 @@ static int update_graph_prettyping (ping_context_t *ctx, /* {{{ */
+ 			wattron (ctx->window, COLOR_PAIR(color));
+ 
+ 		if (has_utf8())
+-			mvwprintw (ctx->window, /* y = */ 3, /* x = */ x + 2, symbol);
++			mvwprintw (ctx->window, /* y = */ 3, /* x = */ x + 2, "%s", symbol);
+ 		else
+ 			mvwaddch (ctx->window, /* y = */ 3, /* x = */ x + 2, symbolc);
+ 
+@@ -1262,7 +1262,7 @@ static int update_graph_histogram (ping_context_t *ctx) /* {{{ */
+ 			mvwaddch (ctx->window, /* y = */ 3, /* x = */ x + 2, ' ');
+ 		else if (has_utf8 ())
+ 			mvwprintw (ctx->window, /* y = */ 3, /* x = */ x + 2,
+-					hist_symbols_utf8[index]);
++					"%s", hist_symbols_utf8[index]);
+ 		else
+ 			mvwaddch (ctx->window, /* y = */ 3, /* x = */ x + 2,
+ 					hist_symbols_acs[index] | A_ALTCHARSET);
+@@ -1639,8 +1639,7 @@ static void update_host_hook (pingobj_iter_t *iter, /* {{{ */
+ 
+ 			HOST_PRINTF ("%zu bytes from %s (%s): icmp_seq=%u ttl=%i ",
+ 					data_len, context->host, context->addr,
+-					sequence, recv_ttl,
+-					format_qos (recv_qos, recv_qos_str, sizeof (recv_qos_str)));
++					sequence, recv_ttl);
+ 			if ((recv_qos != 0) || (opt_send_qos != 0))
+ 			{
+ 				HOST_PRINTF ("qos=%s ",
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

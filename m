Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5AEBC4167B
	for <buildroot@archiver.kernel.org>; Sun, 25 Dec 2022 23:12:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35EDF812F5;
	Sun, 25 Dec 2022 23:12:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35EDF812F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AAVVn88ob0QC; Sun, 25 Dec 2022 23:12:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B157812F1;
	Sun, 25 Dec 2022 23:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B157812F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CBD261BF591
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 23:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEEC340195
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 23:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEEC340195
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5VUe_pFLoidZ for <buildroot@lists.busybox.net>;
 Sun, 25 Dec 2022 23:12:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4DC340017
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4DC340017
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 23:12:08 +0000 (UTC)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
 by mailout04.t-online.de (Postfix) with SMTP id BB522E343;
 Mon, 26 Dec 2022 00:11:35 +0100 (CET)
Received: from fli4l.lan.fli4l ([84.161.180.73]) by fwd87.t-online.de
 with (TLSv1:ECDHE-RSA-AES256-SHA encrypted)
 esmtp id 1p9a9N-0aJpVB0; Mon, 26 Dec 2022 00:11:25 +0100
Received: from bruckner.lan.fli4l ([192.168.1.1]:45128)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd.kuhls@t-online.de>) id 1p9a9N-0004KT-1a;
 Mon, 26 Dec 2022 00:11:25 +0100
From: Bernd Kuhls <bernd.kuhls@t-online.de>
To: buildroot@buildroot.org
Date: Mon, 26 Dec 2022 00:11:25 +0100
Message-Id: <20221225231125.3955545-1-bernd.kuhls@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672009885-3BFEC81E-5C79AD36/0/0 CLEAN NORMAL
X-TOI-MSGID: 265c6af8-19b9-40cc-80fb-623f3eb61347
Subject: [Buildroot] [PATCH 1/1] package/liboping: fix build with ncurses-6.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://git.busybox.net/buildroot/commit/?id=a38a30eb3a46570705642dc37235ddcc1471b434
bumped ncurses to version 6.3 which breaks build of liboping.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...ys-use-s-style-format-for-printf-sty.patch | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)
 create mode 100644 package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

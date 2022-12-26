Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 043A1C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 26 Dec 2022 08:44:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8024640104;
	Mon, 26 Dec 2022 08:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8024640104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jko7F3NGS8E3; Mon, 26 Dec 2022 08:44:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86D1B40323;
	Mon, 26 Dec 2022 08:44:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86D1B40323
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C2A4D1BF3A9
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 08:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9DFCC607FE
 for <buildroot@lists.busybox.net>; Mon, 26 Dec 2022 08:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DFCC607FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n7FKr2jVTAQq for <buildroot@lists.busybox.net>;
 Mon, 26 Dec 2022 08:44:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6793C607CE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6793C607CE
 for <buildroot@buildroot.org>; Mon, 26 Dec 2022 08:44:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:bc00:ef48:c4a5:90b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7ACAAB00579;
 Mon, 26 Dec 2022 09:44:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 26 Dec 2022 09:44:46 +0100
Date: Mon, 26 Dec 2022 09:44:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20221226084446.GD2893@scaer>
References: <20221225231125.3955545-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221225231125.3955545-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672044289;
 bh=TzQNv+YNCLt+8GmC8JfR6A9YytqeO+Q3S52DzIL7ExE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S7xNN40dLqjMNd/MrMGHoadZw/4y1ZkgWO2+w6YisGl41TTt+v4/7ZCFNHL2V9OpG
 /jcYSkjiSzQiVHFaDXFQzoyyObWBDrjcYEC0dyNT5uhq87la76DPBeL9DohndmOYiu
 S98o6mdg+BzXe5TNGlmsUFqKi5Iq89P87Gt6iC0DudnO+uwQf5q3hNtlULyMYeVVgB
 6J13wccu6rKwHPq/nSiwc6iGcfWsJMuQxW7rL6afiikQNtHtJrkQzTlcXQ4ysMIAvh
 2wxAOa8pJzPFzFU+aPjB96X05YckwfFDXYRsmbVQW1/MVNMIj0Gb2MCxTd1T0KtlUy
 1ZXzNXXe91n/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=S7xNN40d
Subject: Re: [Buildroot] [PATCH 1/1] package/liboping: fix build with
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-12-26 00:11 +0100, Bernd Kuhls spake thusly:
> https://git.busybox.net/buildroot/commit/?id=a38a30eb3a46570705642dc37235ddcc1471b434
> bumped ncurses to version 6.3 which breaks build of liboping.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ys-use-s-style-format-for-printf-sty.patch | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100644 package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch
> 
> diff --git a/package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch b/package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch
> new file mode 100644
> index 0000000000..3b68feea3d
> --- /dev/null
> +++ b/package/liboping/0005-src-oping.c-always-use-s-style-format-for-printf-sty.patch
> @@ -0,0 +1,59 @@
> +From 670834fd8fbd2533ea25ca83065800e924116579 Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyich@gmail.com>
> +Date: Mon, 15 Nov 2021 08:05:43 +0000
> +Subject: [PATCH] src/oping.c: always use "%s"-style format for
> + printf()-style functions
> +
> +`ncuses-6.3` added printf-style function attributes and now makes
> +it easier to catch cases when user input is used in palce of format
> +string when built with CFLAGS=-Werror=format-security:
> +
> +    oping.c:1265:41: error: format not a string literal and no format arguments [-Werror=format-security]
> +     1265 |                                         hist_symbols_utf8[index]);
> +          |                                         ^~~~~~~~~~~~~~~~~
> +
> +Let's wrap all the missing places with "%s" format.
> +
> +Downloaded from upstream PR https://github.com/octo/liboping/pull/61
> +
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +[Bernd: rebased for liboping version 1.10.0]
> +---
> + src/oping.c | 7 +++----
> + 1 file changed, 3 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/oping.c b/src/oping.c
> +index c087c80..af4a0cb 100644
> +--- a/src/oping.c
> ++++ b/src/oping.c
> +@@ -1156,7 +1156,7 @@ static int update_graph_prettyping (ping_context_t *ctx, /* {{{ */
> + 			wattron (ctx->window, COLOR_PAIR(color));
> + 
> + 		if (has_utf8())
> +-			mvwprintw (ctx->window, /* y = */ 3, /* x = */ x + 2, symbol);
> ++			mvwprintw (ctx->window, /* y = */ 3, /* x = */ x + 2, "%s", symbol);
> + 		else
> + 			mvwaddch (ctx->window, /* y = */ 3, /* x = */ x + 2, symbolc);
> + 
> +@@ -1262,7 +1262,7 @@ static int update_graph_histogram (ping_context_t *ctx) /* {{{ */
> + 			mvwaddch (ctx->window, /* y = */ 3, /* x = */ x + 2, ' ');
> + 		else if (has_utf8 ())
> + 			mvwprintw (ctx->window, /* y = */ 3, /* x = */ x + 2,
> +-					hist_symbols_utf8[index]);
> ++					"%s", hist_symbols_utf8[index]);
> + 		else
> + 			mvwaddch (ctx->window, /* y = */ 3, /* x = */ x + 2,
> + 					hist_symbols_acs[index] | A_ALTCHARSET);
> +@@ -1639,8 +1639,7 @@ static void update_host_hook (pingobj_iter_t *iter, /* {{{ */
> + 
> + 			HOST_PRINTF ("%zu bytes from %s (%s): icmp_seq=%u ttl=%i ",
> + 					data_len, context->host, context->addr,
> +-					sequence, recv_ttl,
> +-					format_qos (recv_qos, recv_qos_str, sizeof (recv_qos_str)));
> ++					sequence, recv_ttl);
> + 			if ((recv_qos != 0) || (opt_send_qos != 0))
> + 			{
> + 				HOST_PRINTF ("qos=%s ",
> +-- 
> +2.34.1
> +
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

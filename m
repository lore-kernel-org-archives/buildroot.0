Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1360C7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 18:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDE0880C5E;
	Mon, 24 Apr 2023 18:43:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DDE0880C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rV3sRQnZcZ77; Mon, 24 Apr 2023 18:43:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1619E801E4;
	Mon, 24 Apr 2023 18:43:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1619E801E4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8CB1BF831
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 18:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 544DC405E7
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 18:43:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 544DC405E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcFePlj1CQoP for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 18:43:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF30B405D8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BF30B405D8
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 18:43:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f3de:bddc:c766:c327])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8E56E19F73F;
 Mon, 24 Apr 2023 20:43:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 24 Apr 2023 20:43:18 +0200
Date: Mon, 24 Apr 2023 20:43:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230424184318.GR2696@scaer>
References: <20230322162538.19202-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230322162538.19202-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682361800;
 bh=fS2ATsfHSYPoutgNP4GSQbWJ45n/FSZRzh/seFJlvyM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MFpkieLsOjn87YWOQbeIB2ROUq3iMfv96eKKGNyZCaOuTsPyQWej632sWRzUWH3Ar
 6cBAH5iMmMTH5a/J/djQGE7C/8XKZuhWoayMMACstIhZZqOcXkEhggwQL+xqcfGRdf
 R1aOylbcOkJggYuuJ5WNj5OCl9bsF9PpgE1bwym+gbakbDCmOZweywTUXmbCufzAkX
 E9XabOqqHHulGBHFPI9ogSoEckWNYF1eGpbU2iU5OVJxjqQgkc0r0hwcLvbTfjUorc
 OLFyqenXnwv2CX2tyv9gueMUeGzkeFQ6RtXzRJobur+Xnf1pDWBB118Ui4kViNE6D9
 dtAdW5hKCg74g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MFpkieLs
Subject: Re: [Buildroot] [PATCH v1] package/readline: add upstream patch to
 fix crash with invalid locale specification
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-03-22 17:25 +0100, Peter Seiderer spake thusly:
> Add upstream patch to fix crash with invalid locale specification (see [1]
> for details).
> 
> Fixes:
> 
>   - https://bugs.busybox.net/show_bug.cgi?id=15456
> 
> [1] https://lists.gnu.org/archive/html/bug-readline/2022-10/msg00002.html
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ch-1-fix-crash-when-readline-is-star.patch | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
> 
> diff --git a/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
> new file mode 100644
> index 0000000000..b0f784b8ba
> --- /dev/null
> +++ b/package/readline/0002-Readline-8.2-patch-1-fix-crash-when-readline-is-star.patch
> @@ -0,0 +1,41 @@
> +From b8d91eab12603fa88e095248855f5f772d182d05 Mon Sep 17 00:00:00 2001
> +From: Chet Ramey <chet.ramey@case.edu>
> +Date: Wed, 5 Oct 2022 10:41:16 -0400
> +Subject: [PATCH] Readline-8.2 patch 1: fix crash when readline is started with
> + an invalid locale specification
> +
> +[Upstream: https://git.savannah.gnu.org/cgit/readline.git/patch/?id=7274faabe97ce53d6b464272d7e6ab6c1392837b
> + Stripped unrelated ._.gitignore change]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +---
> + nls.c      | 4 ++++
> + patchlevel | 2 +-
> + 2 files changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/nls.c b/nls.c
> +index 5c6a13b..8c027d6 100644
> +--- a/nls.c
> ++++ b/nls.c
> +@@ -141,6 +141,10 @@ _rl_init_locale (void)
> +   if (lspec == 0)
> +     lspec = "";
> +   ret = setlocale (LC_CTYPE, lspec);	/* ok, since it does not change locale */
> ++  if (ret == 0 || *ret == 0)
> ++    ret = setlocale (LC_CTYPE, (char *)NULL);
> ++  if (ret == 0 || *ret == 0)
> ++    ret = RL_DEFAULT_LOCALE;
> + #else
> +   ret = (lspec == 0 || *lspec == 0) ? RL_DEFAULT_LOCALE : lspec;
> + #endif
> +diff --git a/patchlevel b/patchlevel
> +index d8c9df7..fdf4740 100644
> +--- a/patchlevel
> ++++ b/patchlevel
> +@@ -1,3 +1,3 @@
> + # Do not edit -- exists only for use by patch
> + 
> +-0
> ++1
> +-- 
> +2.39.2
> +
> -- 
> 2.39.2
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

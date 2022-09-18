Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078D3C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 14:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2755B80024;
	Sun, 18 Sep 2022 14:58:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2755B80024
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N4WVjhL7d_2x; Sun, 18 Sep 2022 14:58:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EF1584003;
	Sun, 18 Sep 2022 14:58:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EF1584003
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8657E1BF34A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 14:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E9CB8401E
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 14:58:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E9CB8401E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zV1E2M56RP-a for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 14:58:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56D0D83F2A
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 56D0D83F2A
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 14:58:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4908:486:8484:20b8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 2D92519F5B4;
 Sun, 18 Sep 2022 16:58:17 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Sep 2022 16:58:16 +0200
Date: Sun, 18 Sep 2022 16:58:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220918145816.GI1419013@scaer>
References: <20220918133049.3180533-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918133049.3180533-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663513099;
 bh=BnL44i8nj3jgvule6npm3xgXPJIFV0i3Nb2TVhlANOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ngOL9HfvYSxxQssgV4Yh3hyNGQx6/NjUZvwJ7gb3LDUdLGw3qPH9gOkMI1VTYlBZ4
 oZH9B+g+jYnNmrRe7hMy6IU6pm048gZK2m20CAUsP8O+QNg2FWWTd3kih7LqO3fxFk
 bSYUtmRscM4P0TO7rcobOcmG3Zv+6pagHiScg9PENCTI52U7h2jnTQIEhDT+aPs+xl
 kzVcy4Vbd7F1iY/WWSBiy1w5svB6zs1WXYIJH6isUZnAgY4S/s779ftbCVFFMUVp1W
 xSZEFrNrhel6TmjKkvI18EQX+xd9xjyi/iAdEgMlkd6xhOBYaW5Mu+bXd6MSU+Fg0V
 W8EM1haXM0o/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ngOL9Hfv
Subject: Re: [Buildroot] [PATCH] package/openssh: allow sandboxing to be
 disabled as workaround for seccomp issues
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

On 2022-09-18 15:30 +0200, Peter Korsgaard spake thusly:
> As explained in bug #14796, there are situations where the seccomp based
> sandboxing in openssh can get confused, leading to connection issues.
[--SNIP--]
> As a workaround, add a _OPENSSH_SANDBOX option (defaulting to y) to decide
> if sandboxing should be used or not.
[--SNIP--]
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 63a28f3af5..9fab2c9038 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -24,6 +24,7 @@ OPENSSH_CPE_ID_VENDOR = openbsd
>  OPENSSH_CONF_OPTS = \
>  	--sysconfdir=/etc/ssh \
>  	--with-default-path=$(BR2_SYSTEM_DEFAULT_PATH) \
> +	$(if $(BR2_PACKAGE_OPENSSH_SANDBOX),--with-sandbox,--without-sandbox) \

--with-sandbox expects an argument that specifies what type of sandbox
to use:

    --with-sandbox=style Specify privilege separation sandbox (no,
                         capsicum, darwin, rlimit, seccomp_filter,
                         systrace, pledge)

If we just pass --with-sandbox without a value, configure will try to
look for a list of available sabdboxing mechanisms, and use the first it
finds:

    https://github.com/openssh/openssh-portable/blob/1875042c52a3b950ae5963c9ca3774a4cc7f0380/configure.ac#L3642

All that is before looks like it is BSD-only: pledge and systrace, or
darwin. But then, after seccomp, there is also capsicum and rlimit.
Capsicum on linux does not exist, and rlimit is probably does not bring
much security-wise...

So, in all practical matters, on Linux, sandboxing uses seccomp
filtering, or there is no sandboxing.

I've added a blurb to explain the above, and applied to master, thanks.

Note that it looks like we can disable seccomp with:

    ac_cv_have_decl_SECCOMP_MODE_FILTER=no

Regards,
Yann E. MORIN.

>  	--disable-lastlog \
>  	--disable-utmp \
>  	--disable-utmpx \
> -- 
> 2.30.2
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

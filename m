Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0ED8C38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 07:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 534AE817D3;
	Wed,  7 Sep 2022 07:46:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 534AE817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3_ltwQBIHj04; Wed,  7 Sep 2022 07:46:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6984081497;
	Wed,  7 Sep 2022 07:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6984081497
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 27FF71BF365
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:46:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 025A640320
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:46:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 025A640320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KXhcz5NICBF9 for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 07:46:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0B57E40199
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0B57E40199
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 07:46:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f72e:cac9:64c4:382d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2CC5413F86F;
 Wed,  7 Sep 2022 09:46:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 07 Sep 2022 09:46:48 +0200
Date: Wed, 7 Sep 2022 09:46:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220907074648.GH1490660@scaer>
References: <20220906161557.2645766-1-peter@korsgaard.com>
 <20220906213513.GC1490660@scaer> <20220906214119.GD1490660@scaer>
 <87v8pzy6yi.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87v8pzy6yi.fsf@dell.be.48ers.dk>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662536811;
 bh=+Dto1y0CoETf1S43zWd8QoVCCBxDEvLBazmmcKKUv+8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Lvr2BgBqhOKXYuGKbYXgqzEqhKQ9X/NI7vp9vmCLJXkzDO9Le/2d2luf1jw21ttZm
 abgy8cXjgP7ZBUYlRwTkS9D6JVAvEtJAE1vHohk5cK6UkuDPjimNlLiXXpxxO7i6q5
 VWzCxaL835omcyepmvd+3CogBkyrtlq1+wppyc/EqdxBozjBNHI7lGKVyxvuWpVpUk
 0TAiU4kHTapq7v8ep8/6MwS+TMWBALLyxNOj7PtDW9Nurv2kjUB1QAp7Qn39+3x3O3
 BF958YlehjO3dwQqrnmUEj7TdITWASokoImIMHRkfUNfhhnY3msMqKBAeK1ksVpfFf
 Ng+3zn78BNPTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Lvr2BgBq
Subject: Re: [Buildroot] [PATCH-next 1/2] nezha_defconfig: bump opensbi,
 u-boot and linux
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

On 2022-09-07 09:33 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  > And the build did actually succeed with PPD when running in our docker
>  > ref image which does not have flex or bison, and removing those two
>  > lines:
>  >     BR2_LINUX_KERNEL_DTS_SUPPORT=y
>  >     BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-nezha"
> Hmm, perhaps the comment in linux.mk is wrong then and modern kernels no
> longer need flex and bison? No, it does look like it generated
> dtc-lexer.lex.c / dtc-parser.tab.c:
[--SNIP--]
> So I am not sure how it could work for you?

Because host-flex and host-bison are pulled in because... they are in
LINUX_KCONFIG_DEPENDENCIES... So, they do end up in linux' PPD.

OK, this is an accident that they end up here. We may need to fix that
in a cleaner way, though...

Regards,
Yann E. MORIN.

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

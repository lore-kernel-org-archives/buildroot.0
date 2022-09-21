Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 035ABECAAD8
	for <buildroot@archiver.kernel.org>; Wed, 21 Sep 2022 18:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62A76409A4;
	Wed, 21 Sep 2022 18:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62A76409A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aM8eyHhkEKCN; Wed, 21 Sep 2022 18:57:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EE3F4098A;
	Wed, 21 Sep 2022 18:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EE3F4098A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 032461BF3FC
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2F0A4014B
 for <buildroot@lists.busybox.net>; Wed, 21 Sep 2022 18:57:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2F0A4014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WrBeqGbTyBLZ for <buildroot@lists.busybox.net>;
 Wed, 21 Sep 2022 18:57:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D61400EA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D9D61400EA
 for <buildroot@buildroot.org>; Wed, 21 Sep 2022 18:57:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3556:b9e6:5304:8eb5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 87C2A5FFAC;
 Wed, 21 Sep 2022 20:57:16 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 21 Sep 2022 20:57:16 +0200
Date: Wed, 21 Sep 2022 20:57:16 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220921185716.GT1419013@scaer>
References: <20220920194645.670432-1-yann.morin.1998@free.fr>
 <20220921201320.0a7f80c0@windsurf>
 <2a3ca783-079b-bca6-7fc9-6647b0307eae@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a3ca783-079b-bca6-7fc9-6647b0307eae@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663786640;
 bh=V5l3tgSKtuj76jJF6Z6Ep2jc+20bLpjQ/HcLno/8XJM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jpKHnYa+HHuk2qlhrutXnzLQDnxSJgE9DGYtEGU3TfFLB9sJ4E3RV6LMlpgbOGfia
 z8bUrl32zIeuR3jEbmBRU7PiBQvcNE2O+qolwmBNTawIfoLjtVfbi1qbBiGsxk81C8
 PaKjKF5bniEPFzvWRPk2bXSjUxVA6e+ko31z99kk5SqRkGBFsm6yRvzVMjxev2Z0oX
 YVsznLjZxcwlLiGe+f5DP/UcFdE8HaKDNot9o6NtvvgPsfR9gLxG6NZjb1OAYsIwBc
 yOeQvkl5AboktaSAfvZMFxthyicjnJqxRrHRUhVeF/UFz5XXP6p5F/bDniUXWzHSVW
 D0yo96v0yUxzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jpKHnYa+
Subject: Re: [Buildroot] [PATCH v3] Makefile: fix use of many br2-external
 trees
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
Cc: David Lawson <david.lawson1@tx.rr.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-09-21 20:32 +0200, Arnout Vandecappelle spake thusly:
> On 21/09/2022 20:13, Thomas Petazzoni wrote:
> >On Tue, 20 Sep 2022 21:46:45 +0200
> >"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> >>One of the rationale behind this code, is that we want the defconfig
> >>files from br2-external trees further down the list, to override
> >>defconfig files from those earlier in the list, even overriding the
> >>defconfig files from Buildroot itself.
> >This is the part I would like to challenge. Why do we want to allow
> >BR2_EXTERNAL to override defconfigs from the main tree? We do not allow
> >this for packages, why should we allow it for defconfigs?
>  And indeed, this is exactly the reverse of what we would have now. We have
> two pattern rules that match with the same stem. In this case, according to
> 'info make': "'make' will choose the first one found in the makefile." Since
> we put $(TOPDIR) before the externals in the foreach loop, the internal one
> will be the one that gets used.

As discussed on IRC: except we do not put TOPDIR first; we do:
    $(call reverse,TOPDIR BR2_EXTERNALS)

so the last external does win.

I.e. that patch does not change the current behaviour; it just fixes the
use of more than 5 br2-extenal trees at once.

Sorry, I may not have been clear about the explanations in my commit
log: the rationale part refers to the current code, not the change I
did. Whoever applies it can amend as they see fit, or I can respin if
needed.

Oh, and by the way, I got that privately, so I'll paste it here so that
patchwork catches it:

Tested-by: David Lawson <david.lawson1@tx.rr.com>

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

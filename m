Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11D7C46467
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E80081F4A;
	Mon, 16 Jan 2023 20:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E80081F4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LbGrh_Wullje; Mon, 16 Jan 2023 20:55:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A743881ECB;
	Mon, 16 Jan 2023 20:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A743881ECB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 728CE1BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:55:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48D22404F6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48D22404F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9fTAKC_ivrPH for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:55:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 593FD402BC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 593FD402BC
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:55:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AB8B15FFA8;
 Mon, 16 Jan 2023 21:55:14 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 21:55:14 +0100
Date: Mon, 16 Jan 2023 21:55:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Casey Reeves <casey@xogium.me>
Message-ID: <20230116205514.GG2770@scaer>
References: <20230116083352.160100-1-casey@xogium.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116083352.160100-1-casey@xogium.me>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673902516;
 bh=vCarkrJ7Z5Gvp3g22MSxVXGqNUOJP06B8mi5UlL5qMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tpz4C0QcbUZOkYOgFtU71aOZ07AdKmirMW/5HseJ3ihF9TuhU4AClQt0ut/7KBOd9
 ig9StIBFmkPL+7d6J0hIzmdg2yYk2taxu2qDXgWe7H/6hha4Q5WDWyCClsuWUBCNWN
 jJ6fvO6iHILaakDWrbWIUdC2dLAhWy1RbsiLGo04rXJ5qDBQTjgFR41IqZERt3wZaG
 5jKgFpSHihQD8KkWmYUXH8mnfrIJipmIm76AAcqRrgvRv7A/MIPMZyKQ7OkiFvMgKT
 PpCDZQX7llS5dIjlXYRfQZngrBT7ZBl9C7TaJ2Mqu+lpoYpf55ziGeFtaCxGpmQne0
 uC/10YMs969+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tpz4C0Qc
Subject: Re: [Buildroot] [PATCH] fs/erofs: enable support for reproducible
 build
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

Casey, All,

On 2023-01-16 09:33 +0100, Casey Reeves spake thusly:
> When BR2_REPRODUCIBLE is selected, this sets the filesystem timestamps
> to $SOURCE_DATE_EPOCH.
> 
> It also sets the filesystem UUID to the nil uuid, to ensure a random one
> isn't picked during generation.
> 
> Signed-off-by: Casey Reeves <casey@xogium.me>

Thank you for this patch. We did a review in private, but I let a minor
nit split through the cracks (probably because of -ECOFFEE), so I fixed
it: I made the two assignments a single one, split on two lines.

I also slightly reworded the commit to start with an explanation of the
issue (mkfs.erofs uses the current date, and random data for the UUID),
followed by the solution to fix it.

Thanks, I know it's been a bit stressing for you to submit a patch, so,
I'll reiterate: no stess! ;-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  fs/erofs/erofs.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/fs/erofs/erofs.mk b/fs/erofs/erofs.mk
> index 0e9d4401a9..5567cd43ef 100644
> --- a/fs/erofs/erofs.mk
> +++ b/fs/erofs/erofs.mk
> @@ -10,6 +10,11 @@ ifeq ($(BR2_TARGET_ROOTFS_EROFS_LZ4HC),y)
>  ROOTFS_EROFS_ARGS += -zlz4hc
>  endif
>  
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +ROOTFS_EROFS_ARGS += -T $(SOURCE_DATE_EPOCH)
> +ROOTFS_EROFS_ARGS += -U 00000000-0000-0000-0000-000000000000
> +endif
> +
>  ifneq ($(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE),0)
>  ROOTFS_EROFS_ARGS += -C$(strip $(BR2_TARGET_ROOTFS_EROFS_PCLUSTERSIZE))
>  endif
> -- 
> 2.39.0
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8212EC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42383612D1;
	Tue,  6 Feb 2024 17:06:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42383612D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UML11Z0dzc9J; Tue,  6 Feb 2024 17:06:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 907E960BA1;
	Tue,  6 Feb 2024 17:06:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 907E960BA1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 22A1F1BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE87660BA1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:06:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE87660BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2U8U1Kpc-pVp for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:06:14 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D234A60B58
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D234A60B58
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 76A1D13FA35;
 Tue,  6 Feb 2024 18:06:07 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 18:06:07 +0100
Date: Tue, 6 Feb 2024 18:06:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <buildroot@bubu1.eu>
Message-ID: <ZcJm_zUm5zABN1NN@landeda>
References: <20240206105246.1220945-1-buildroot@bubu1.eu>
 <20240206105246.1220945-6-buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206105246.1220945-6-buildroot@bubu1.eu>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707239170;
 bh=+L4FelcMIorI4VXw8cMFjBOJWpMC6nc+w/jGnevbt/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gAIpF3+Or1/VKCHHIOOr0DihQEm9MvuGEtpzcFxDQRHNpucHDWzTjajfo0ZpsGcIW
 HRP5CuPJzD8KzuCOKR2pM/b6zs17kyjja0KwbYoICf86oGmjpDMPzMmpVBFb8vYLeI
 P0cudjEypnTlHPBnpikdVwy/3cyttPjEQu6QVFIcULrR5SNp8cbfbQgg0vdhJnDHKa
 rvBBWK00Z2H0gH8TjoV8nWqtlU/s9LDkOp/Gu4jjZfevDwXarTdvKrNBKGoaa9HvV6
 39VXYZwTtzx6WlSr27e9qkncrg2O0N3DYsZrQ73o7xJOzpE0Fut3UBCq04FObfxkc5
 aOtUiUK2ChWag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gAIpF3+O
Subject: Re: [Buildroot] [PATCH 6/6] docs/manual/contribute.adoc: mention
 sr.ht as an alternative for sending patches
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2024-02-06 11:52 +0100, Marcus Hoffmann via buildroot spake thusly:
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
> ---
>  docs/manual/contribute.adoc | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
> index 684e9f4809..7d0611be28 100644
> --- a/docs/manual/contribute.adoc
> +++ b/docs/manual/contribute.adoc
> @@ -375,6 +375,14 @@ If you do not use +git send-email+, make sure posted *patches are not
>  line-wrapped*, otherwise they cannot easily be applied. In such a case,
>  fix your e-mail client, or better yet, learn to use +git send-email+.
>  
> +https://sr.ht also has a light-weight UI for
> +https://man.sr.ht/git.sr.ht/#sending-patches-upstream[preparing patchseries]
> +and can also send out the patches for you. There are a few drawbacks to
> +this, as you cannot edit your patches' status in Patchwork and you
> +currently can't edit your display name with which the match emails are
> +sent out but it is an option if you cannot get git send-email to work
> +with your mail provider (i.e. O365).

As seen IRL, I extended that with a blurb explicitly stating that it's
not the official way of sneding patches, just a fallback.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  ==== Cover letter
>  
>  If you want to present the whole patch set in a separate mail, add
> -- 
> 2.43.0
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

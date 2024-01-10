Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89195C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 20:32:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 317EC400C1;
	Wed, 10 Jan 2024 20:32:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 317EC400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ox5Eo6Xw2vu; Wed, 10 Jan 2024 20:32:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D7E1443784;
	Wed, 10 Jan 2024 20:32:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D7E1443784
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F5E31BF5B3
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:32:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2870283D95
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 20:32:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2870283D95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bil3mvpbN5bj for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 20:32:34 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34A4F83D8C
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 20:32:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34A4F83D8C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 29BEBB00576;
 Wed, 10 Jan 2024 21:32:26 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Jan 2024 21:32:25 +0100
Date: Wed, 10 Jan 2024 21:32:25 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Antoine Coutant <antoine.coutant@smile.fr>
Message-ID: <ZZ7-2b0Hv75GJAA0@landeda>
References: <20240110163412.3977522-1-antoine.coutant@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240110163412.3977522-1-antoine.coutant@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704918752;
 bh=Mq4NPU0romJLJo0iG4Q7AXDPx7aeEASpJPAUWYl6r4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=exKAuXZ++aBZgnmIrrxyc6y0d7w6B0J9KNRj7b4G0xZwTlmSDSxBsJ/Iot/CRd0vf
 qNWdJyi/2DOfHQzkavOEbDkIDBLzzq9Z8QOpuH9EtzPrMRinhO46OiLl/YMbx2CYt1
 XW79cJ8vCyPxOfTcrK2J/PTdFZ+u3hgMQbyv0IjurCbZZd8Lx+iMaqzFGDItpmhSSQ
 iRJrHFjepbjo4/0dpnPInQ2jILfdcFKFJsREfpq6syVpz1NjLc4hi+se2aF6cuBdwM
 F8ahFKF7Tng9V6ofWIcanINRiHb28TZy24CpCtxGECP/oKgzQMcryt7xkbH4AwW9/1
 W0xijX2768E7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=exKAuXZ+
Subject: Re: [Buildroot] [PATCH v3 1/3] Revert "support/download: generate
 even more reproducible tarballs"
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
Cc: sebastian.weyer@smile.fr, romain.naour@smile.fr,
 Vincent Fazio <vfazio@xes-inc.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Antoine, All,

On 2024-01-10 17:34 +0100, Antoine Coutant spake thusly:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Commit 768f9f80f62c (support/download: generate even more reproducible
> tarballs) causes non-reproducibility in tarballs we previousy
> generated, especially the archives for two cargo-vendored packages,
> ripgrep and sentry-cli.
[--SNIP--]
> Reported-by: Antoine Coutant <antoine.coutant@smile.fr>
> Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Vincent Fazio <vfazio@xes-inc.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Romain Naour <romain.naour@smile.fr>
> Tested-by: Antoine Coutant <antoine.coutant@smile.fr>

You should have added your own SoB line here. The SoB line is abot the
chain of propagation of a patch. I was the author, so obviously I SoB-ed
it. Since you grabbed it and sent it, you are part of the chain of
propagation, so you should SoB it.

See: https://developercertificate.org/

I was case (a) as described in there, you were case (b).

Regards,
Yann E. MORIN.

> ---
>  support/download/helpers | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/support/download/helpers b/support/download/helpers
> index 265685eff5..90a7d6c1ec 100755
> --- a/support/download/helpers
> +++ b/support/download/helpers
> @@ -53,9 +53,6 @@ mk_tar_gz() {
>      tmp="$(mktemp --tmpdir="$(pwd)")"
>      pushd "${in_dir}" >/dev/null
>  
> -    # Enforce group/others mode bits
> -    chmod -R go-wx+X .
> -
>      # Establish list
>      find . -not -type d -and -not \( -false "${find_opts[@]}" \) >"${tmp}.list"
>      # Sort list for reproducibility
> -- 
> 2.25.1
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

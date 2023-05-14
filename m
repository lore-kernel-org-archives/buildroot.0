Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0785CC7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 14:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97794415DF;
	Sun, 14 May 2023 14:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97794415DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OT7ErLYBd0q2; Sun, 14 May 2023 14:09:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71FA5415D9;
	Sun, 14 May 2023 14:09:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71FA5415D9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FEE11BF3B9
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 767C040487
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 14:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 767C040487
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G9oyDo_e7Q5W for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 14:09:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 870F2402F4
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 870F2402F4
 for <buildroot@buildroot.org>; Sun, 14 May 2023 14:09:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BD248B0054E;
 Sun, 14 May 2023 16:09:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 16:09:03 +0200
Date: Sun, 14 May 2023 16:09:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230514140903.GI2582048@scaer>
References: <20230514133637.3556558-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230514133637.3556558-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684073347;
 bh=wozS2JltjBe3BK8Xmr3sgr6JzARpgQUAdEXmZPGfpOc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SLYQwvpJO4G/Z/gtXy4gYagduWMl6P3m+F2ZFgn4A+vwWrByvbsXEPfselWM9gaXJ
 4ZkcpdPD9RXSVIM0pkDPXi0CMApGMKM+P6iDy+9v4YgEDke008pxMFB2pzeWzk9cWa
 0ARfDUqFKwvyy8uB50l+rYO9tDB57qtgtUaahVQrSRoO/VLOj9zOEyy3guu7xWTuQz
 edpzViBb7QtkA1icDThJFnHTkSSgYhgUNHxZ8KJEKB9j1y9oZvHd1JDm0Gydgv/gAZ
 2aqKKiO5+3AYDTwylIRtLgfTj+riJN72w51JefPiJO+1//qgbUo6jOWIn9C3D8Fi81
 aWbiIF9ml3tUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SLYQwvpJ
Subject: Re: [Buildroot] [PATCH] package/{tzdata,zic}: fix hash origin URL
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
Cc: Richard Braun <rbraun@sceen.net>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-05-14 15:36 +0200, Daniel Lang spake thusly:
> 179ae2f ("package/tzdata: bump version to 2023c") forgot to update the
> URL of the hash files.
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>

Thanks for fixing my mess! :-)

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tzdata/tzdata.hash | 2 +-
>  package/zic/zic.hash       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/tzdata/tzdata.hash b/package/tzdata/tzdata.hash
> index 3422655a71..5488625ddd 100644
> --- a/package/tzdata/tzdata.hash
> +++ b/package/tzdata/tzdata.hash
> @@ -1,4 +1,4 @@
> -# From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
> +# From https://mm.icann.org/pipermail/tz-announce/2023-March/000079.html
>  sha512  608bd286ebcbd0004cfdc1da183273f08aff61f90c8867661154453d77a05d421e4c46ad6d066a1fe2e87d5c82ec0f1c0224667a3b35f3180a3eb7f6ff84cbf5  tzdata2023c.tar.gz
>  # Locally computed:
>  sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> diff --git a/package/zic/zic.hash b/package/zic/zic.hash
> index 6a7f9f2f94..a2720a27ba 100644
> --- a/package/zic/zic.hash
> +++ b/package/zic/zic.hash
> @@ -1,4 +1,4 @@
> -# From https://mm.icann.org/pipermail/tz-announce/2022-October/000075.html
> +# From https://mm.icann.org/pipermail/tz-announce/2023-March/000079.html
>  sha512  fa18bae9c0e7c061bc9d5f5f2eb9967f0e4ddb2baafdee9887fa30cd0c60f4aa6f21eacffb17df0d59d26ff54d08c5dcefa98159309eba497e86443624913a82  tzcode2023c.tar.gz
>  # Locally computed:
>  sha256  0613408568889f5739e5ae252b722a2659c02002839ad970a63dc5e9174b27cf  LICENSE
> -- 
> 2.40.1
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221EBC433F5
	for <buildroot@archiver.kernel.org>; Thu,  6 Jan 2022 13:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5CC9428A1;
	Thu,  6 Jan 2022 13:36:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HpNs-mKbX38G; Thu,  6 Jan 2022 13:36:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F31414287E;
	Thu,  6 Jan 2022 13:36:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CBBB1BF409
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 13:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69C754287E
 for <buildroot@lists.busybox.net>; Thu,  6 Jan 2022 13:36:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LQHk0uF1UjJZ for <buildroot@lists.busybox.net>;
 Thu,  6 Jan 2022 13:36:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3BFB5408CD
 for <buildroot@buildroot.org>; Thu,  6 Jan 2022 13:36:21 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5148:b9c:d8ec:b3b5])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 3613578035B;
 Thu,  6 Jan 2022 14:36:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641476178;
 bh=zbjby8yeGK6jpI4JmVf6/iJk3iGeYcio8RuBf3uvxBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SCDwMCwGHVwXWB4JY9XC9lB0reMqJJU3mWLsnli6dkYkAEfpesvFALGxwuJagOebq
 qt82aj7NT1/iaoiubv2OUtDgCXnR7cy2mVV6K2Ni2u32/RSXDeo2OZRg6gDVKV7Dg9
 /Z8krYeXg7dQBLYw9b+3C1utg92piCRIlOsqAKQWvnqf9/6xp3IFLnfh3EZyj5QfgK
 k9iyPtV8IP15xLEVGFK9rWv24KxghTUUa3ywwFomPyGJdHd2bv8bkI77e3E9wRFOKF
 qKojoiGovEKCa1/2TFumKAEK9JawRnbvvBbv9swRCP3JVT9W8EbejNLGn+ellUxxWu
 s3EeCWbMaPAbA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jan 2022 14:36:14 +0100
Date: Thu, 6 Jan 2022 14:36:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220106133614.GO614810@scaer>
References: <20220106130714.347453-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220106130714.347453-1-romain.naour@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/qt5: remove qt5webkit-examples from
 qt5/Config.in
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-01-06 14:07 +0100, Romain Naour spake thusly:
> qt5webkit-examples was removed by commit [1]
> 
> [1] b4841d722fb37f8c8c4715c7fe8b2502c9a3a9dd
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/qt5/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/qt5/Config.in b/package/qt5/Config.in
> index 6f2428d800..5751d6cb70 100644
> --- a/package/qt5/Config.in
> +++ b/package/qt5/Config.in
> @@ -67,7 +67,6 @@ source "package/qt5/qt5virtualkeyboard/Config.in"
>  source "package/qt5/qt5wayland/Config.in"
>  source "package/qt5/qt5webchannel/Config.in"
>  source "package/qt5/qt5webkit/Config.in"
> -source "package/qt5/qt5webkit-examples/Config.in"
>  source "package/qt5/qt5webengine/Config.in"
>  source "package/qt5/qt5websockets/Config.in"
>  source "package/qt5/qt5webview/Config.in"
> -- 
> 2.31.1
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

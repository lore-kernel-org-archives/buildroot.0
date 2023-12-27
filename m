Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F47C46CD4
	for <buildroot@archiver.kernel.org>; Wed, 27 Dec 2023 17:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEAD460EEC;
	Wed, 27 Dec 2023 17:33:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BEAD460EEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eMaSpKibOkwB; Wed, 27 Dec 2023 17:33:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0606560ED4;
	Wed, 27 Dec 2023 17:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0606560ED4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B70C1BF3E3
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:33:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D706560ED4
 for <buildroot@lists.busybox.net>; Wed, 27 Dec 2023 17:33:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D706560ED4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TVzCdrpB8IEd for <buildroot@lists.busybox.net>;
 Wed, 27 Dec 2023 17:33:00 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63C2960D4F
 for <buildroot@buildroot.org>; Wed, 27 Dec 2023 17:33:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63C2960D4F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1BC86B0055A;
 Wed, 27 Dec 2023 18:32:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Dec 2023 18:32:53 +0100
Date: Wed, 27 Dec 2023 18:32:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZYxfxXC4-vKZlmcZ@landeda>
References: <20231227165840.2900718-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231227165840.2900718-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703698377;
 bh=vm35EuGUwjlXnlLgHg3zl4Sc+xX/xkIYOYAJbWTC4vI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KX0vxyxgslHywn+hfBLsfnzoAryzxURJ0FD/iXWcQkdfpRR3V5JTcvQdTZOP36T8Y
 BSiOF40+K0ZAgNUNxlBsfmDPlqEnUhS5AQgawONGBPv8pHHgxOo1fHB57qTc8ox5ha
 6+zmJT/mYk80tH4a2zQBolKODgiO/aEJDecJRWauZujNiD9TNx6lEUi5UJ+6YU/hSA
 aaxL+Jd9DRbUVa5fqmcH8sKjB/XlBOnDt+/Wg/Zsb+6hkdQ68R9fvy7vjZba+Pqsop
 Uyu+8Ohx0Bpbx3z3QVcqabR1k0Qdlp2RhDY2XM0YjsylI7YT+PuCOKZDQsF65rzd7B
 0NbBUCci2lrXQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KX0vxyxg
Subject: Re: [Buildroot] [PATCH] Config.in: change default optimization
 level from -Os to -O2
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
Cc: louis.chauvet@bootlin.com, Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-12-27 17:58 +0100, Thomas Petazzoni via buildroot spake thusly:
> Historically, Buildroot has defaulted to -Os as the gcc optimization
> flags. However, this default is probably not the most appropriate
> anymore, and this commit therefore changes the default to -O2.
> 
> Here are some arguments in favor of this change:
> 
> - Most Buildroot uses use Buildroot for platforms that have a

s/uses/users/ maybe?

>   reasonable amount of storage, and the difference between -Os and -O2
>   in terms of code size is no longer than significant compared to the

s/than/as/

>   size of storage typically available on average embedded Linux
>   devices

... nowadays.

> - -Os can have a pretty bad performance impact, compared to -O2.

What impact are we speaking of? Basically, -Os is -O2 except for
optimisations that increase code size. Also, smaller code fit better
in caches, so there can be a speed gain to have smaller code too.

So, stating that -Os has a "pretty bad" performance impact is not that
obvious.

But otherwise, I agree that, -Os does not bring much size gain, compared
to storage of devices nowadays, so, except for those little nits:

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> - -Os is much less widely tested than -O2. For example, with recent
>    versions of gcc, there are parts of Qt5 that segfault when compiled
>    with -Os and work perfectly fine with -O2. Yes, it's a compiler bug
>    that should be fixed, but in the mean time, having a default that's
>    more widely used/tested makes sense.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index 554b4062eb..c38b1e6454 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -474,7 +474,7 @@ config BR2_STRIP_EXCLUDE_DIRS
>  
>  choice
>  	prompt "gcc optimization level"
> -	default BR2_OPTIMIZE_S
> +	default BR2_OPTIMIZE_2
>  	help
>  	  Set the optimization level for gcc
>  
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B462BC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 06:32:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2D6C60B9B;
	Wed, 28 Dec 2022 06:32:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2D6C60B9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wkiQ2BxI56bq; Wed, 28 Dec 2022 06:32:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E58360B13;
	Wed, 28 Dec 2022 06:32:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E58360B13
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8B0041BF410
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 06:32:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 734CA81291
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 06:32:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 734CA81291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n5EOr3DKxoh1 for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 06:32:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C1BA8127F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C1BA8127F
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 06:32:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.98.206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 058A313F85A;
 Wed, 28 Dec 2022 07:32:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 28 Dec 2022 07:32:22 +0100
Date: Wed, 28 Dec 2022 07:32:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221228063222.GD2498764@scaer>
References: <20221227222246.373638-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221227222246.373638-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1672209146;
 bh=f+j4qKLj5KeAmNCpAGg3XGt22p6QdzDZ2tQYEfzkoS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XboqgMAEIsOEAzvOM88BZewOVgBaQnQMht44h3yykp6Yb5KL5B3Bs9XauXshcCczZ
 aZ9fhLDjWyKd/dhiSPhZQ8Bc1YLd/UokTL0PEA/V7+A4gkXjW8dthV6F0vcCXSlA+k
 uOTko9OAsOdHQwbvssw4UnOuCtbNa2df2McfGc9nuL+7Pul4KLPE8hEYPCs10EfflU
 u9GLR8txzH5nOCwrCS5qN8u7bQhJGTIaHvDlB6bi6O7SrMUAshc/Kqj+ShtJY5h4S3
 a3UU1rDDv20OKAoFVw+OdE3zjLoejknOPfq3MiVwZ6GSFllSSCSzjwzAyoDrukDujP
 frCTzubL6rkdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XboqgMAE
Subject: Re: [Buildroot] [PATCH 1/1] DEVELOPERS: drop upx
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

Fabrice, All,

On 2022-12-27 23:22 +0100, Fabrice Fontaine spake thusly:
> Commit 85c5af46ad6c18841576c0f7abe241a617a44cb7 forgot to drop upx from
> DEVELOPERS file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  DEVELOPERS | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 277f0043e1..c2de0447c0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1094,7 +1094,6 @@ F:	package/php-amqp/
>  F:	package/python-cherrypy/
>  F:	package/sane-backends/
>  F:	package/ucl/
> -F:	package/upx/

Err... 85c5af46ad6c is about dropping ucl, not upx... And this is what
get-developers whines about:

    $ ./utils/get-developers -v
    WARNING: 'package/ucl/' doesn't match any file

Regards,
Yann E. MORIN.

>  F:	package/zxing-cpp/
>  
>  N:	Frank Vanbever <frank.vanbever@essensium.com>
> -- 
> 2.35.1
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

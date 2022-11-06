Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95C6C4332F
	for <buildroot@archiver.kernel.org>; Sun,  6 Nov 2022 10:51:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6BF9860B2C;
	Sun,  6 Nov 2022 10:51:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BF9860B2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yd4NptXcbj8W; Sun,  6 Nov 2022 10:51:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4466B60B28;
	Sun,  6 Nov 2022 10:51:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4466B60B28
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8EF161BF5AA
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68D3881DE6
 for <buildroot@lists.busybox.net>; Sun,  6 Nov 2022 10:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68D3881DE6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkvdRTczlA7x for <buildroot@lists.busybox.net>;
 Sun,  6 Nov 2022 10:51:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D9D481DE5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D9D481DE5
 for <buildroot@buildroot.org>; Sun,  6 Nov 2022 10:51:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b857:25fc:60e2:657f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 0C47D5FFB9;
 Sun,  6 Nov 2022 11:51:24 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Nov 2022 11:51:24 +0100
Date: Sun, 6 Nov 2022 11:51:24 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: jwood+buildroot@starry.com
Message-ID: <20221106105124.GP3918838@scaer>
References: <20221102165629.755750-1-jwood+buildroot@starry.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221102165629.755750-1-jwood+buildroot@starry.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667731888;
 bh=qp54nF78QRJkH9SqjKzd3inh3w826HeIU0S75/hfPWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QnVrRPSJlQNyirUq12kO2DiymC5uOXJtr7CTJEYp2Zj13asoOmZxN9is96MDcjkSr
 jHv5l4Man9RMKZwPH9f6ggVUdIJYHIYseJVOoGHxSpSu8RhiJkQ4+ljebb3stPU6MS
 iCgD709YHM7GL6tgrF2NdJi/tgQh5oytjSoJ+oinAvwJ/4heWvgZp1idgQtXC+X7Dh
 Gp3VghviJFB9aAGgYZlNe4XErrAPyYuuQtvzusL9DKfwMf7PbmN+ScVnTiIoG9QFeK
 kLglKaY0giTfrVFLfres8N9PBBjFEArebS7pzJKy+MqpJUk15iAp566mkOt+Ze+gan
 Xwc06yrirwapQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QnVrRPSJ
Subject: Re: [Buildroot] [PATCH 1/1] package/ca-certificates: add support
 for cryptography > 3.0
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
Cc: Martin Bark <martin@barkynet.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Justin, All,

On 2022-11-02 12:56 -0400, jwood+buildroot@starry.com spake thusly:
> From: Justin Wood <jwood@starry.com>
> 
> This patch was originally submitted upstream at https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1008244
> by Wataru Ashihara <wsh@iij.ad.jp>.  Minor changes by me to account for the Buildroot change in 0001-*.patch.
> 
> Building ca-certificates with a newer cryptography is breaking without this patch, and building buildroots
> `python-cryptography` package first doesn't change the broken behavior.

I've reworded the commit log in a more logical manner (explain what
breaks and why, then how we fix it).

I also notice that the bug report states that cryptography 3.0 is also
affected, so I tweaked the commit title accordingly.

> Signed-off-by: Justin Wood <jwood@starry.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...2pem.py-Fix-compat-with-cryptography.patch | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
> 
> diff --git a/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch b/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
> new file mode 100644
> index 0000000000..0537da9224
> --- /dev/null
> +++ b/package/ca-certificates/0002-mozilla-certdata2pem.py-Fix-compat-with-cryptography.patch
> @@ -0,0 +1,29 @@
> +From 5e493ca307a031e81528ceddb96f3da40bc062cf Mon Sep 17 00:00:00 2001
> +From: Wataru Ashihara <wsh@iij.ad.jp>
> +Date: Wed, 2 Nov 2022 12:40:05 -0400
> +Subject: [PATCH] mozilla/certdata2pem.py: Fix compat with cryptography > 3.0
> +
> +In newer cryptography packages, load_der_x509_certificate is enforced to be 'bytes' rather than currently used 'bytearray'.  This fixes that.
> +
> +https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1008244
> +Signed-off-by: Justin Wood <jwood@starry.com>
> +---
> + mozilla/certdata2pem.py | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/mozilla/certdata2pem.py b/mozilla/certdata2pem.py
> +index a6261f8..c0fa52c 100644
> +--- a/mozilla/certdata2pem.py
> ++++ b/mozilla/certdata2pem.py
> +@@ -122,7 +122,7 @@ for obj in objects:
> +         try:
> +             from cryptography import x509
> + 
> +-            cert = x509.load_der_x509_certificate(obj['CKA_VALUE'])
> ++            cert = x509.load_der_x509_certificate(bytes(obj['CKA_VALUE']))
> +             if cert.not_valid_after < datetime.datetime.now():
> +                 print('!'*74)
> +                 print('Trusted but expired certificate found: %s' % obj['CKA_LABEL'])
> +-- 
> +2.38.1
> +
> -- 
> 2.38.1
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

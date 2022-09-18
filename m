Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA88C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 14:15:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E13B4175A;
	Sun, 18 Sep 2022 14:15:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E13B4175A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMEDs7Fvjfpg; Sun, 18 Sep 2022 14:15:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8B954090D;
	Sun, 18 Sep 2022 14:15:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8B954090D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 723761BF34A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 14:15:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 593864088A
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 14:15:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 593864088A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AZ08sHt_L8uL for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 14:15:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3851403AC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3851403AC
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 14:15:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2a18:6673:cb9f:3864])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id CA00E13F88D;
 Sun, 18 Sep 2022 16:15:31 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Sep 2022 16:15:31 +0200
Date: Sun, 18 Sep 2022 16:15:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220918141531.GH1419013@scaer>
References: <20220918133815.3193915-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220918133815.3193915-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663510534;
 bh=xydqpXbNob3riMFdhwTsftN/FLiWsh54jkdQ/n/71ys=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zs4J9RdA87oXzm6dDcVUx92uGY9SU4qxR1gRoZLlOSdztLfXWKwKONkZIHqWOBWjT
 UYiaNtl24gyjHGi6h2b+gZtiWn83shSmzfATFM0nn3bvSoLnaL6mX7Y5xCeC76hkAr
 TN6WmrDkmN/VroBsDLwXsTVitoEkPWavNI+a1k7GrjhnP76cWDoClAIM+ENuysZnxJ
 F3vfDD9jVw1bsGmpZMbE2m0iGJuZ8DnL8r2hCBVwiovxvNjiSUO2MFWVyJeov1HHJz
 upZaKbnKuF8tW+EfjGBcsQBmNfIlPBHvZ8p/GJ2E6UgEnGFIl3UEhsSLlD3GMhpi2C
 bggvlLMjrNZRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zs4J9RdA
Subject: Re: [Buildroot] [PATCH] package/openssh: drop autoreconf
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

On 2022-09-18 15:38 +0200, Peter Korsgaard spake thusly:
> Commit b936a95d021d73e (package/openssh: bump to version 9.0p1) dropped the
> patch touching m4/openssh.m4, but forgot to remove autoreconf.  Fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openssh/openssh.mk | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
> index 63a28f3af5..a8c32f3d33 100644
> --- a/package/openssh/openssh.mk
> +++ b/package/openssh/openssh.mk
> @@ -13,9 +13,6 @@ OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
>  OPENSSH_LICENSE = BSD-3-Clause, BSD-2-Clause, Public Domain
>  OPENSSH_LICENSE_FILES = LICENCE
>  
> -# patch touching m4/openssh.m4
> -OPENSSH_AUTORECONF = YES
> -
>  OPENSSH_CONF_ENV = \
>  	LD="$(TARGET_CC)" \
>  	LDFLAGS="$(TARGET_CFLAGS)" \
> -- 
> 2.30.2
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

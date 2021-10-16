Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8375C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:02:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4592961027
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4592961027
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04945606E2;
	Sat, 16 Oct 2021 08:02:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LoHy-pSReAY8; Sat, 16 Oct 2021 08:02:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E683606CF;
	Sat, 16 Oct 2021 08:02:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 869211BF334
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82E5683B97
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:02:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mi9VX-b9R4cl for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:02:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9585C83B95
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:02:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id EDFF678032A;
 Sat, 16 Oct 2021 10:02:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634371365;
 bh=4LzE1vv2qMIOX/AtsITi+KmID26nowoEeSeQUG8vdrs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=if/lcyOk3xUbliovDRpl28UlSky2c4l5VIJCXMol0NtV903xn3yjTHGnfQITo+10P
 /4NTlhY4ux2yADnoBzRwojlCT7wiZ6OSEA5iRwGtahlB4yvJYw4nE5P5yo+DCo8JX0
 VEumgVQru5jUrvw8aR+2LzQmcgAKCdXoqu/xd0ESQxvTULNQUk1oC0DQa2QNb9CKKz
 Gp7exTxUEki6VJ5URZdGdYuqRqpXoqJs44djxtFKKy7qD5m6LE15qTHbflGYZnFvOz
 1SY+0co//+55ITdaA0GmQNhF8Gmmh2E4BWe+/wJyZ2+9zrkFAsR2Bdf7K5SHjSekht
 mtmgSP3lJzD/g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 10:02:38 +0200
Date: Sat, 16 Oct 2021 10:02:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Paul Cercueil <paul@crapouillou.net>
Message-ID: <20211016080238.GD4165837@scaer>
References: <20211015215003.181073-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015215003.181073-1-paul@crapouillou.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/lightning: stop spam!
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
Cc: "Weber, Matthew L Collins" <Matthew.Weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Paul, All,

+Matthew

On 2021-10-15 22:50 +0100, Paul Cercueil spake thusly:
> Every week I receive an automated email that tells me about the
> CVE-2020-7747 vulnerability in Lightning. This vulnerability however
> applies to the Javascript lightning-server project, and not to the
> GNU Lightning project.
> 
> Ignore this CVE in the Lightning package to reduce my stress levels.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

The goal of sending those automated emails, is explicitly to have people
registered on DEVELOPPERS, to take action on those CVE reports. Such
actions can be bumping the package to an non-affected version,
backporting an upstream patch, or, as you did, mark them to be ignored.

Bonus point if the NIST CPE DB is updated to avoid the mismatch, like
adding an entry for GNU lightning, and thus settign the correct CPE_ID
in Buildroot.

Matt: is there a process to update the NIST CPE DB? Can we add that in the
manual, even just as an URL?

Anyway: applied to master, after rewording the commit log to avoid the
personal-tone message, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lightning/lightning.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
> index 3bd17bef56..38b132e082 100644
> --- a/package/lightning/lightning.mk
> +++ b/package/lightning/lightning.mk
> @@ -12,6 +12,10 @@ LIGHTNING_INSTALL_STAGING = YES
>  # We're patching include/Makefile.am
>  LIGHTNING_AUTORECONF = YES
>  
> +# CVE-2020-7747 is for the Javascript lightning-server project, and not for
> +# GNU Lightning.
> +LIGHTNING_IGNORE_CVES = CVE-2020-7747
> +
>  ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
>  LIGHTNING_DEPENDENCIES += binutils zlib
>  LIGHTNING_CONF_OPTS += --enable-disassembler
> -- 
> 2.33.0
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

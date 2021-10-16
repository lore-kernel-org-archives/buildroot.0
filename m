Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 738A3C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:32:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D73C61261
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 08:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D73C61261
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D113840847;
	Sat, 16 Oct 2021 08:32:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFvBdbsoHJMT; Sat, 16 Oct 2021 08:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25F2F4082E;
	Sat, 16 Oct 2021 08:32:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D9BD1BF873
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D63283B80
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 08:32:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I8lPuB_TAVST for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 08:32:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6B94B83B7A
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 08:32:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A8AF6780306;
 Sat, 16 Oct 2021 10:32:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634373136;
 bh=ynxVJvPx4+JblRU2DPaxEzvrMawQn6DzHoYGuhKW2Dw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i7x/oZT4j7lgvP1em88ABkr5nsHjwCmDSuMoEkrx9ebEfZNxd5+8kHRkzrAa58N7u
 bv5QhlZ2yCmw+DoSmPvVd+UXOMvP44VLr1eAKYNDv725nJzy4kAiiHKwnSZuAyrvKb
 dqV+V3FB0/nfcbJdM8nAk1DfmrxNabL4Q1SwyFJGFg3Hfv1rHoWaSQGlEuaY3t9rQR
 8DUILP2XudhQTAKo/S6RhXQosntf1tDNHJ4qRbA3B7hDDs7NGrzcmB+NU4lHOgVfRb
 fsy1iPRlV8po8AwEUJ95LnP4PcsxDSJ/eHb+BqUGcDjAeOoYw4f/qNCzoRYEdQCksb
 jtn0AMQ8sjjUw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 10:32:09 +0200
Date: Sat, 16 Oct 2021 10:32:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20211016083209.GL4165837@scaer>
References: <20211015153225.1023067-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015153225.1023067-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpx: bump version to 1.11.0
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
Cc: Spenser Gilliland <spenser@gillilanding.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2021-10-15 17:32 +0200, Bernd Kuhls spake thusly:
> Changelog:
> https://github.com/webmproject/libvpx/blob/master/CHANGELOG
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libvpx/libvpx.hash | 2 +-
>  package/libvpx/libvpx.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvpx/libvpx.hash b/package/libvpx/libvpx.hash
> index 5b9568837c..4e9bd91dee 100644
> --- a/package/libvpx/libvpx.hash
> +++ b/package/libvpx/libvpx.hash
> @@ -1,4 +1,4 @@
>  # Locally computed:
> -sha256  85803ccbdbdd7a3b03d930187cb055f1353596969c1f92ebec2db839fa4f834a  libvpx-1.10.0.tar.gz
> +sha256  965e51c91ad9851e2337aebcc0f517440c637c506f3a03948062e3d5ea129a83  libvpx-1.11.0.tar.gz
>  sha256  8267348d5af1262c11d1a08de2f5afc77457755f1ac658627dd9acf71011d615  LICENSE
>  sha256  cc3273e0694ea5896145e0677699b53471b03ea43021ddc50e7923fbb9f5023c  PATENTS
> diff --git a/package/libvpx/libvpx.mk b/package/libvpx/libvpx.mk
> index 6ad558bc99..ece1ad2cb8 100644
> --- a/package/libvpx/libvpx.mk
> +++ b/package/libvpx/libvpx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBVPX_VERSION = 1.10.0
> +LIBVPX_VERSION = 1.11.0
>  LIBVPX_SITE = $(call github,webmproject,libvpx,v$(LIBVPX_VERSION))
>  LIBVPX_LICENSE = BSD-3-Clause
>  LIBVPX_LICENSE_FILES = LICENSE PATENTS
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E117C38A02
	for <buildroot@archiver.kernel.org>; Mon, 31 Oct 2022 10:00:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05AE840142;
	Mon, 31 Oct 2022 10:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05AE840142
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5kMTX3N4GQeN; Mon, 31 Oct 2022 10:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DC3400A7;
	Mon, 31 Oct 2022 10:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6DC3400A7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 15E9C1BF358
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5C5940185
 for <buildroot@lists.busybox.net>; Mon, 31 Oct 2022 09:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5C5940185
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gBiSnTe7ganP for <buildroot@lists.busybox.net>;
 Mon, 31 Oct 2022 09:58:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00B6640111
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00B6640111
 for <buildroot@buildroot.org>; Mon, 31 Oct 2022 09:58:03 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:afdc:c5f1:f1be:8b47])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 13F87B0055E;
 Mon, 31 Oct 2022 10:57:59 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 31 Oct 2022 10:57:58 +0100
Date: Mon, 31 Oct 2022 10:57:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221031095758.GN1058960@scaer>
References: <20221030224328.684577-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221030224328.684577-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1667210282;
 bh=xdrnWgLakGu1YAd6Kf2J+YebLPHVd+lvFKGdiQS3Z+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FPJU0EB/V4kR92zaeq992tcuu4mS/HSON3VOZX3DTJnBxyzNluwtBs+9JIliXvgNA
 KMAaa0fGDcqiQI5vwgHwYJ0orMPPqhpIMTc45zWyxe1hpej/xVxqi2tSUDNyUsJZxM
 PrKJ/3PW5ilVUdB9YDTeTt3SN6STGN1Vkzzs+roeybioh/5OMzMYqycHRH3mtAOA5d
 8p3nY82SoVUXRppseOc9VqmAGGfJkk45FUv9eN/hVyov520vzbZwVaiSb7TK6t+5Lq
 V0Wr4vej/62TyhUmciNLKk9qRKiuiWxQQK6+0AQjes4/wvjJosQTjvIUq57OmhWHCK
 FfsvBB5aBCu5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FPJU0EB/
Subject: Re: [Buildroot] [PATCH 1/1] package/msmtp: security bump to version
 1.8.22
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-10-30 23:43 +0100, Fabrice Fontaine spake thusly:
> - Fixed a security problem in msmtpd: mail addresses starting with '-' could be
>   interpreted as options of the pipe command.
> 
> https://github.com/marlam/msmtp-mirror/blob/msmtp-1.8.22/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/msmtp/msmtp.hash | 4 ++--
>  package/msmtp/msmtp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
> index 1e73d92470..c5571f2fb3 100644
> --- a/package/msmtp/msmtp.hash
> +++ b/package/msmtp/msmtp.hash
> @@ -1,7 +1,7 @@
>  # Locally calculated after checking signature
> -# https://marlam.de/msmtp/releases/msmtp-1.8.14.tar.xz.sig
> +# https://marlam.de/msmtp/releases/msmtp-1.8.22.tar.xz.sig
>  # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
> -sha256  d56f065d711486e9c234618515a02a48a48dab4051b34f3e108fbecb6fb773b4  msmtp-1.8.14.tar.xz
> +sha256  1b04206286a5b82622335e4eb09e17074368b7288e53d134543cbbc6b79ea3e7  msmtp-1.8.22.tar.xz
>  
>  # Hash for license file:
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
> index 3db36f4cd0..c3928ffcbb 100644
> --- a/package/msmtp/msmtp.mk
> +++ b/package/msmtp/msmtp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MSMTP_VERSION = 1.8.14
> +MSMTP_VERSION = 1.8.22
>  MSMTP_SITE = https://marlam.de/msmtp/releases
>  MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
>  MSMTP_DEPENDENCIES = host-pkgconf
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

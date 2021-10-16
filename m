Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E650C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:27:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB6B60F48
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:27:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DAB6B60F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A66B6606EB;
	Sat, 16 Oct 2021 10:27:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsDR5_XvpkJv; Sat, 16 Oct 2021 10:27:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F639606E2;
	Sat, 16 Oct 2021 10:27:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7E5B01BF870
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E02F83B37
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:27:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JnK2x7J4oHwu for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 10:26:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F0E483B09
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 10:26:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 038DB780344;
 Sat, 16 Oct 2021 12:26:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634380018;
 bh=ObCj07JSYNZsYZNwcwatybb+BxCionJCaRHZ5iVHIjo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jCzz7uLKQpqUrTGtuLzs85X5Ywz1BHYmfEDiYFS5X5vSwhVSM1GyxxlwgtfWcpsbZ
 GrTJAR5P7UzCEx6B6Oo2niA76jwcmw5I1XplvTYj8kyJqUmr0vYkyayb9MsJ7WHfK5
 AYTkvCfcFqAuk+zh/Naq/DLW+05SbguyHKxbywSucDvjjo4C28t8OfOPko/qYbHt5C
 uSpN3LlogtNr+FASrilyz5ubzdSnMH2pkzU+HjvLkrGWf/WTLxTWAAzi8+Nz0u7ZWJ
 pQjGrMZk4+jyJ2IJP0bE9lkHWAv++tCjKKr3ZKHlDDkb+lajNruRprG0caslf+bCfo
 HE6glEPIm4PLA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 12:26:53 +0200
Date: Sat, 16 Oct 2021 12:26:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211016102653.GR4165837@scaer>
References: <20211014220011.17230-1-ps.report@gmx.net>
 <20211014220011.17230-3-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014220011.17230-3-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 3/3] package/nftables: disable debug build
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

On 2021-10-15 00:00 +0200, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

I've added a commit log that explains why we do that, and applied to
master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nftables/nftables.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
> index 6a27975a53..2409eb0571 100644
> --- a/package/nftables/nftables.mk
> +++ b/package/nftables/nftables.mk
> @@ -10,7 +10,7 @@ NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
>  NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
>  NFTABLES_LICENSE = GPL-2.0
>  NFTABLES_LICENSE_FILES = COPYING
> -NFTABLES_CONF_OPTS = --disable-man-doc --disable-pdf-doc
> +NFTABLES_CONF_OPTS = --disable-debug --disable-man-doc --disable-pdf-doc
>  NFTABLES_SELINUX_MODULES = iptables
>  
>  ifeq ($(BR2_PACKAGE_GMP),y)
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

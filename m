Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B2CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:26:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328AB6101E
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 328AB6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1094606ED;
	Sat, 16 Oct 2021 10:26:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qoTwdOD2KquZ; Sat, 16 Oct 2021 10:26:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C9E56071F;
	Sat, 16 Oct 2021 10:26:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 700D51BF870
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5F194606CF
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:26:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WJtLd5faubyB for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 10:26:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8135C6068B
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 10:26:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id EF1467802D7;
 Sat, 16 Oct 2021 12:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634379982;
 bh=vecgH4r6uM2z+lmFWSimbqN2qsyXJb4MvMUt/DIAQF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eu8hpvh7eu6HIXfA7hzLOIHcdkwcbWvd/7z4m4G2L4YKP/hJL1hDOT1THddxBHhvY
 d7W1nWcsjwgTfhUxsr/5MlHj7Cf9C1+tBuGd4wn6L5eZmR0hKDjCM983s3F4BLwKx9
 VoLbjF8RMkt0VZoH/GqTWS9IJLSSmaVVxje5peVvqMslDdk7Hjt3YrzPCXIqQX0mmj
 HofDHnbDoTBaVyAvdH61gnZ6nE0aAzHsohtST/sfc9qCDOoldgCXRsLos1PjBdPHTx
 eiDeARLszFNJeNm/+GQAdjiMMSQ/Sm8AmSy+S8uia8fAyMO4AbV8BI653/A9NzkDZV
 AKiePpZ3u9Ezw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 12:26:17 +0200
Date: Sat, 16 Oct 2021 12:26:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211016102617.GQ4165837@scaer>
References: <20211014220011.17230-1-ps.report@gmx.net>
 <20211014220011.17230-2-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014220011.17230-2-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 2/3] package/nftables: bump version to
 1.0.0
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
> For changes (since 0.9.6) see [1], [2], [3] and [4].
> 
> [1] https://lists.netfilter.org/pipermail/netfilter-announce/2020/000247.html
> [2] https://lists.netfilter.org/pipermail/netfilter-announce/2021/000249.html
> [3] https://www.netfilter.org/projects/nftables/files/changes-nftables-0.9.9.txt
> [4] https://www.netfilter.org/projects/nftables/files/changes-nftables-1.0.0.txt
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nftables/nftables.hash | 2 +-
>  package/nftables/nftables.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
> index 1112b7a8ad..bbf7e5a2b1 100644
> --- a/package/nftables/nftables.hash
> +++ b/package/nftables/nftables.hash
> @@ -1,3 +1,3 @@
>  # From https://netfilter.org/projects/nftables/downloads.html
> -sha256  68d6fdfe8ab02303e6b1f13968a4022da5b0120110eaee3233d806857937b66e  nftables-0.9.6.tar.bz2
> +sha256  58bf547daf967a2b88ecb4f425f126006ebde22711db806b25c1d6cf84fe45f4  nftables-1.0.0.tar.bz2
>  sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
> diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
> index f9468c5250..6a27975a53 100644
> --- a/package/nftables/nftables.mk
> +++ b/package/nftables/nftables.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -NFTABLES_VERSION = 0.9.6
> +NFTABLES_VERSION = 1.0.0
>  NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
>  NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
>  NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
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

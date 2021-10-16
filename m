Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB54C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:26:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C324560F9D
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 10:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C324560F9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9475E606E2;
	Sat, 16 Oct 2021 10:26:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kvwP35n2gxxn; Sat, 16 Oct 2021 10:26:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6453606CF;
	Sat, 16 Oct 2021 10:26:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D51871BF870
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D111683AC7
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 10:26:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTQ3R9QUCaAo for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 10:26:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8EBB383AA7
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 10:26:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ae:6c95:da51:607e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9FFF6780350;
 Sat, 16 Oct 2021 12:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634379969;
 bh=SdyTQlWWMDc2S12arAP+mYHROr0zTA+qMe+6wkCMwKI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JtMh26AGIMW/WNTFpUQpt3Ks3LMyw5jfpwMjpVLs+68BQXecGcfVgnmoRtB69icah
 su2omA3l4FUx217jDZID1yhCx1ztXUk/gy6Pydka4KOXXgBpHWNKlJ5KZdBP0Bp5rr
 SF5DulWI/dkVblXFZrtwFkQvCiT+wYM4UT44n2BSlGVIyqj7G1hRea8U5lWBsnuPup
 CosSZc5gkRYKDE/mlb7wiXpHGqyMtCQTFP966de3ubvTzxi07Y2ifb+Iw0rbEaiDFU
 yqKhKtreE6gz7zGY4kxlXAI2L7+GFLBpg4Pv4CnPLQv5F7Xni66SaHccUO3aLSkxGG
 blPN22rjJFOxQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Oct 2021 12:26:05 +0200
Date: Sat, 16 Oct 2021 12:26:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211016102605.GP4165837@scaer>
References: <20211014220011.17230-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211014220011.17230-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1 1/3] package/libnftnl: bump version to
 1.2.0
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
> For changes (since 1.1.7) see [1], [2] and [3].
> 
> [1] https://lists.netfilter.org/pipermail/netfilter-announce/2020/000246.html
> [2] https://lists.netfilter.org/pipermail/netfilter-announce/2021/000248.html
> [3] https://netfilter.org/projects/libnftnl/files/changes-libnftnl-1.2.0.txt
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libnftnl/libnftnl.hash | 2 +-
>  package/libnftnl/libnftnl.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libnftnl/libnftnl.hash b/package/libnftnl/libnftnl.hash
> index f22b02af09..9737da1878 100644
> --- a/package/libnftnl/libnftnl.hash
> +++ b/package/libnftnl/libnftnl.hash
> @@ -1,3 +1,3 @@
>  # From http://www.netfilter.org/projects/libnftnl/downloads.html
> -sha256  20dbc13f11004aea2c9e479cfb90359cb11fe3446c3140811c18e4ec1648ed8f  libnftnl-1.1.7.tar.bz2
> +sha256  90b01fddfe9be8c3245c3ba5ff5a4424a8df708828f92b2b361976b658c074f5  libnftnl-1.2.0.tar.bz2
>  sha256  98193898c663001eff2fdcfb676e210c13042bc1a05e8d570c363efa396f8e24  COPYING
> diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
> index f4487bdebe..eff93b895f 100644
> --- a/package/libnftnl/libnftnl.mk
> +++ b/package/libnftnl/libnftnl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBNFTNL_VERSION = 1.1.7
> +LIBNFTNL_VERSION = 1.2.0
>  LIBNFTNL_SITE = https://netfilter.org/projects/libnftnl/files
>  LIBNFTNL_SOURCE = libnftnl-$(LIBNFTNL_VERSION).tar.bz2
>  LIBNFTNL_LICENSE = GPL-2.0+
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

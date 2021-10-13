Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EAD4C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:17:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4D061163
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 16:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB4D061163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C8DE60B48;
	Wed, 13 Oct 2021 16:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c_nuqujvQxRn; Wed, 13 Oct 2021 16:17:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D723860AC6;
	Wed, 13 Oct 2021 16:17:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7AB081BF2F0
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 697904017B
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 16:17:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EOglJTvG5njz for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 16:17:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD9074021F
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 16:17:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5b8:fa6c:9a56:27a6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2C75A780346;
 Wed, 13 Oct 2021 18:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634141826;
 bh=ueBdA1XK1Yo6oE7ney5mY6u+pKLn5p7bCMfvrfEb8qw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PXL+3w93qvjxbXn51Vj2zmv6V6bdYw47ij7nbsYKhICGKUokswpHYTbVBd9Qgdvkh
 gVNaI9X4LDzcBvb4dicqWeFAQiA2VZs1s9mR04ZD6+k+Fi6wz+7X42+HQMg62cZBCk
 W88Xwa2O34J1D0h9z1CqFz7ZN/HU0t3x+GZA/3bs5DCNkF1li0YHE+8wcRLvhGNm3x
 b6Je26kjnbaOz9lMj5pD/YmS5MsmKcbpy9e81lpNvVLtWwf4O7OwibvV2H/6hCYk2S
 RoQ3hzjLfjaNLta9ght5HEY5pn2A/OxLVBTpzITut3LnQgwqC+Cw/R/ZyklGfAzKrt
 sKV9CQ3ZXqHwA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 13 Oct 2021 18:16:59 +0200
Date: Wed, 13 Oct 2021 18:16:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211013161659.GA368016@scaer>
References: <20211013070105.1857677-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211013070105.1857677-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/dtbocfg: depends on kernel
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
Cc: =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-10-13 09:01 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit 9fc7b49ab193da55b0a72d27b5e0ea33245b4df0:
> 
> Makefile:587: *** linux is in the dependency chain of dtbocfg that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/449a731c0a1394c28f519e341ea145cb42af012d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/dtbocfg/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/dtbocfg/Config.in b/package/dtbocfg/Config.in
> index c1e8318e5c..862dc0ccc5 100644
> --- a/package/dtbocfg/Config.in
> +++ b/package/dtbocfg/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_DTBOCFG
>  	bool "dtbocfg"
> +	depends on BR2_LINUX_KERNEL

You forgot to add the corresponding comment: "dtbocfg needs a kernel to
be built", so I've done so when applying, and applied to master, thanks.

Regards,
Yann E. MORIN.

>  	help
>  	  dtbocfg, which stands for Device Tree Blob Overlay
>  	  Configuration File System, was developed to serve
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

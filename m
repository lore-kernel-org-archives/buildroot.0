Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 494C3C7EE24
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:14:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6338426FE;
	Sat,  6 May 2023 16:14:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6338426FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztPYxpSv9i4D; Sat,  6 May 2023 16:14:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67FE14283D;
	Sat,  6 May 2023 16:14:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67FE14283D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C3571BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:12:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35E7383B7E
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35E7383B7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KR2Tn6Pdv2jM for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:12:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49A4983B63
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 49A4983B63
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:12:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:ae89:1f5e:7283:231f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8CB5FB00565;
 Sat,  6 May 2023 18:12:21 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 06 May 2023 18:12:21 +0200
Date: Sat, 6 May 2023 18:12:21 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <20230506161221.GV252090@scaer>
References: <20230504073021.3450679-1-christian@aperture.us>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230504073021.3450679-1-christian@aperture.us>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683389544;
 bh=lLZqGEQh0o0oIE6rMF5d69O5iptQucwduVnQg+Ejrm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b3yy2wksT2gmZLfqOly7wFfU/L3CGzYSY+UilT/sITP3LAiMH+QcCKQlpIcYeAfF5
 Q4JXrBbvM2TpveZyiZfe1Zv1wqA5kybDIe9AM4sv6MwoAlUM9Tc63BWjcCn92wpnSS
 TKRBKyLGkETIT5xmPLiVJOPpzjuyDZcJEgRceTMXn/EaWo4K1GBf3+drC6bv/9YQ2f
 cwfTd4txvZNov1tmWEKaPfx5J+LD8+5sCCsUrZ7BAyxm1HXcr6YhQwAhf+ey8b6GJY
 J7ao3ojjgsTdNbVgulx7mVPWADUK5aYcJicFzDt3AtMtXw+jNzuKpAiBG9bzXSiPUh
 J7Lg6gdbKM0+Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b3yy2wks
Subject: Re: [Buildroot] [PATCH v1 1/1] package/mbpfan: bump version to
 v2.4.0
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

Christian, All,

On 2023-05-04 00:30 -0700, Christian Stewart via buildroot spake thusly:
>  - Add support for alternate SMC path used with newer MacBooks
>  - Improved systemd integration
>  - Removed developer tests which confused users
> 
> https://github.com/linux-on-mac/mbpfan/releases/tag/v2.4.0
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mbpfan/mbpfan.hash | 2 +-
>  package/mbpfan/mbpfan.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mbpfan/mbpfan.hash b/package/mbpfan/mbpfan.hash
> index 9195692d52..5b67744a00 100644
> --- a/package/mbpfan/mbpfan.hash
> +++ b/package/mbpfan/mbpfan.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  f690e9302da4cf97e582606614d91e1ee4ac495a4939aec7c0b3468c8988eb67  mbpfan-2.3.0.tar.gz
> +sha256  e1cdcffaba52be215ae40a8568949190866d500d6ae2a1e96b71ab5372f3580b  mbpfan-2.4.0.tar.gz
>  sha256  589ed823e9a84c56feb95ac58e7cf384626b9cbf4fda2a907bc36e103de1bad2  COPYING
> diff --git a/package/mbpfan/mbpfan.mk b/package/mbpfan/mbpfan.mk
> index 52d823cbdc..0ac161b327 100644
> --- a/package/mbpfan/mbpfan.mk
> +++ b/package/mbpfan/mbpfan.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -MBPFAN_VERSION = 2.3.0
> +MBPFAN_VERSION = 2.4.0
>  MBPFAN_SITE = $(call github,linux-on-mac,mbpfan,v$(MBPFAN_VERSION))
>  MBPFAN_LICENSE = GPL-3.0+
>  MBPFAN_LICENSE_FILES = COPYING
> -- 
> 2.40.1
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

Return-Path: <SRS0=TKET=PH=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7013C433FE
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:37:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A5FC60C4D
	for <buildroot@archiver.kernel.org>; Tue, 19 Oct 2021 19:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A5FC60C4D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00A16608A2;
	Tue, 19 Oct 2021 19:37:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dTnKGyH1YbPN; Tue, 19 Oct 2021 19:37:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0613606F5;
	Tue, 19 Oct 2021 19:37:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CAE171BF328
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C716F606F5
 for <buildroot@lists.busybox.net>; Tue, 19 Oct 2021 19:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TpZDhZgkJBT4 for <buildroot@lists.busybox.net>;
 Tue, 19 Oct 2021 19:36:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C66D6606B1
 for <buildroot@buildroot.org>; Tue, 19 Oct 2021 19:36:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dd94:aa5f:dfc1:b524])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 8377C19F5AB;
 Tue, 19 Oct 2021 21:36:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1634672215;
 bh=XLbTmAfl4GpNtJrldTLvcsaTDUHPscICCeODW/ITnP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DbQHhhnkU3KgjcQIaPtxYP42iIKzAN08IEy0vFoqgtHB2yFaAO5XmLPY47BlIgyXm
 b7ld22QBxCz0277dRMO1vVakPfIMsdQMAhz5ymVhb9IFxH/aNpu+YNmeKZJedrW744
 +23biKdVDxKDutYr2KNWL+RZWTWYACQuDsYsmEHS/fyyUUJLJg2WvaQ4fnHsyD5+y/
 wYDH8ymOFkF+0LfWH50FBSdy7JHY7JlOHOknPZkdF2g0lLJqyIAXuQQEgwmjAu+yug
 MTGK32rG93Q4b5ASODEa4pWbi6QVYMeyejM2Z9ttAHJLewaJwATwgqMo1qfXVqeckB
 DD5T++ZpHFo2g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 19 Oct 2021 21:36:51 +0200
Date: Tue, 19 Oct 2021 21:36:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Matthew Weber <matthew.weber@collins.com>
Message-ID: <20211019193651.GW2400@scaer>
References: <20211018214014.1202-1-matthew.weber@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211018214014.1202-1-matthew.weber@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/lightning: add
 LIGHTNING_CPE_ID_VENDOR
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

Matthew, All,

On 2021-10-18 16:40 -0500, Matthew Weber via buildroot spake thusly:
> cpe:2.3:a:gnu:lightning:*:*:*:*:*:*:*:* is a valid CPE for this pkg
> 
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Alightning
> 
> Signed-off-by: Matthew Weber <matthew.weber@collins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/lightning/lightning.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
> index 38b132e082..c0036e5cd1 100644
> --- a/package/lightning/lightning.mk
> +++ b/package/lightning/lightning.mk
> @@ -9,6 +9,7 @@ LIGHTNING_SITE = $(BR2_GNU_MIRROR)/lightning
>  LIGHTNING_LICENSE = LGPL-3.0+
>  LIGHTNING_LICENSE_FILES = COPYING.LESSER
>  LIGHTNING_INSTALL_STAGING = YES
> +LIGHTNING_CPE_ID_VENDOR = gnu
>  # We're patching include/Makefile.am
>  LIGHTNING_AUTORECONF = YES
>  
> -- 
> 2.17.1
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

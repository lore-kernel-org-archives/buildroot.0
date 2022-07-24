Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBECC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0485F40B8A;
	Sun, 24 Jul 2022 10:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0485F40B8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1biLvja1aZNt; Sun, 24 Jul 2022 10:17:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E91B6403B8;
	Sun, 24 Jul 2022 10:17:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E91B6403B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A66241BF85D
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E7D584BB9
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E7D584BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQ-fYiTwaD5g for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:17:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4AA584BB0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A4AA584BB0
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:17:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8acf:5600:88cd:5a50:8d8a:801])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C1EB913FA3B;
 Sun, 24 Jul 2022 12:17:14 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Jul 2022 12:17:14 +0200
Date: Sun, 24 Jul 2022 12:17:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220724101714.GR2641@scaer>
References: <20220724083748.1503238-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220724083748.1503238-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658657838;
 bh=uu+9POBvivogOm7dEWUmAPAbmL02SJt7YSws7FuSWuQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nZup2dzlf1xIZxOrzfOrwRL93vfC1JjnDwxNng81+ySzy5ToeE5oOv1u/9NcrV8r+
 NdNhHAN6x13qVPPvpHXwJOtS+syD6Au1W7Ny09P4GQzn0LkFowqsnICY4jiY01/ClF
 cqU5/J8MbpQuhMdurnkhO/5XyyjxBIQuRr/3DTA5l7T7/Os2MSX+/Upg3+pn0FHLmD
 4CMfu+jaXOzVkXF2gJ8n9ne3P24PQt40eso11JdmFTXXZcFu5hLuRhbsHCVzy8ODC/
 876SYVRc1JobFu4VicpIPBelD/Nvst5PBmCTgq9U5nWWYJl1aeVTlyoC+hRwqFM8zv
 0dS3ccYlqt0Dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nZup2dzl
Subject: Re: [Buildroot] [PATCH 1/1] package/python-{maturin,
 cryptograpy}: fix PYO3_CROSS_LIB_DIR path
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James,

On 2022-07-24 02:37 -0600, James Hilliard spake thusly:
> Host paths should not have /usr in them.

That was fixed in patches I had sent earlier, and that I applied.

Regards,
Yann E. MORIN.

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-cryptography/python-cryptography.mk | 2 +-
>  package/python-maturin/python-maturin.mk           | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/python-cryptography/python-cryptography.mk b/package/python-cryptography/python-cryptography.mk
> index 99eba3eeab..582a7f7891 100644
> --- a/package/python-cryptography/python-cryptography.mk
> +++ b/package/python-cryptography/python-cryptography.mk
> @@ -27,7 +27,7 @@ PYTHON_CRYPTOGRAPHY_ENV = \
>  	PYO3_CROSS_LIB_DIR="$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
>  HOST_PYTHON_CRYPTOGRAPHY_ENV = \
>  	$(HOST_PKG_CARGO_ENV) \
> -	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> +	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
>  # We need to vendor the Cargo crates at download time
>  PYTHON_CRYPTOGRAPHY_DOWNLOAD_POST_PROCESS = cargo
>  PYTHON_CRYPTOGRAPHY_DOWNLOAD_DEPENDENCIES = host-rustc
> diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
> index 3d5ba70391..9ac11f264b 100644
> --- a/package/python-maturin/python-maturin.mk
> +++ b/package/python-maturin/python-maturin.mk
> @@ -16,7 +16,7 @@ HOST_PYTHON_MATURIN_DEPENDENCIES = \
>  	host-rustc
>  HOST_PYTHON_MATURIN_ENV = \
>  	$(HOST_PKG_CARGO_ENV) \
> -	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)"
> +	PYO3_CROSS_LIB_DIR="$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)"
>  # We need to vendor the Cargo crates at download time
>  PYTHON_MATURIN_DOWNLOAD_POST_PROCESS = cargo
>  PYTHON_MATURIN_DOWNLOAD_DEPENDENCIES = host-rustc
> -- 
> 2.34.1
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107ECC25B46
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0DA542223;
	Mon, 23 Oct 2023 17:21:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A0DA542223
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHCSxfirfLjc; Mon, 23 Oct 2023 17:21:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D283C4222B;
	Mon, 23 Oct 2023 17:21:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D283C4222B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 26C3B1BF371
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F36F94222B
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:21:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F36F94222B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRF5Wn2Ere9X for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:21:02 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66C3242223
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66C3242223
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:8ed0:8cf1:4440:5c7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 63E342005A0;
 Mon, 23 Oct 2023 19:20:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Oct 2023 19:20:56 +0200
Date: Mon, 23 Oct 2023 19:20:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231023172056.GX2607@scaer>
References: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023092501.481436-1-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698081659;
 bh=ehlCKpgYWezk8PdOehf5LbNiPAD/wboIETNkU/aFH9A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bK7KZc/35HCn8UFfWWn6Sve9Kls2dBAjswd8wY+4bln/Wl0CxgBHKU3+2fWK4ytB5
 OTkdUfRR32a00RDwu4aGputNBoT7J5lgE7tkzNhmRyL+F0e8LWc11w5o5CsPRUmSWL
 jeVa/CgjI7iHdW9IczseUhYC5PISSgE5Y4tArngsnqOXGkeYuQ1CdFovecDCIGjiLi
 GT/8ogC65OEO6n23+/yE0tPqMkov41XGECThLIwifZ6teC1YF3uIWAVmr2Cdq+QWV9
 QjST41tBlCSbRaILEgSt9hvRYhlzDiP19I/IJnjdgw2zaP+Qcnx4WsoFASoaIpIDu0
 Yutq/vWfDnLQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bK7KZc/3
Subject: Re: [Buildroot] [PATCH 1/8] package/opkg: bump version to 0.6.2
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-10-23 11:24 +0200, Adam Duskett spake thusly:
> Tested in Fedora 39 and Debian 11 with:
> ./support/testing/run-tests tests.package.test_opkg.TestOpkg.test_run
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/opkg/opkg.hash | 2 +-
>  package/opkg/opkg.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/opkg/opkg.hash b/package/opkg/opkg.hash
> index b0c0ba6574..c6ecefba21 100644
> --- a/package/opkg/opkg.hash
> +++ b/package/opkg/opkg.hash
> @@ -1,4 +1,4 @@
>  # From http://downloads.yoctoproject.org/releases/opkg/SHA256SUMS
> -sha256  a1214a75fa34fb9228db8da47308e0e711b1c93fd8938cf164c10fd28eb50f1e  opkg-0.4.5.tar.gz
> +sha256  ac73a90a2549cd04948e563d915912c78e1b8ba0f43af75c5a53fcca474adbd5  opkg-0.6.2.tar.gz
>  # Locally calculated
>  sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
> diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
> index 501edcf8af..9b1ffb3c74 100644
> --- a/package/opkg/opkg.mk
> +++ b/package/opkg/opkg.mk
> @@ -4,13 +4,13 @@
>  #
>  ################################################################################
>  
> -OPKG_VERSION = 0.4.5
> +OPKG_VERSION = 0.6.2
>  OPKG_SITE = https://downloads.yoctoproject.org/releases/opkg
>  OPKG_DEPENDENCIES = host-pkgconf libarchive
>  OPKG_LICENSE = GPL-2.0+
>  OPKG_LICENSE_FILES = COPYING
>  OPKG_INSTALL_STAGING = YES
> -OPKG_CONF_OPTS = --disable-curl
> +OPKG_CONF_OPTS = --disable-curl --disable-zstd
>  
>  # Ensure directory for lockfile exists
>  define OPKG_CREATE_LOCKDIR
> -- 
> 2.41.0
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

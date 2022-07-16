Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFECC433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:23:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFC5960ED3;
	Sat, 16 Jul 2022 22:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFC5960ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NnsT52kEu36X; Sat, 16 Jul 2022 22:23:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB67B60B1C;
	Sat, 16 Jul 2022 22:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB67B60B1C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C22241BF3D0
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BF12404F6
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9BF12404F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id la4YgtQI5GLL for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:23:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B5011403E5
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B5011403E5
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:23:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DD1D5780502;
 Sun, 17 Jul 2022 00:23:22 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 00:23:22 +0200
Date: Sun, 17 Jul 2022 00:23:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220716222322.GR2543@scaer>
References: <20220714212610.15762-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220714212610.15762-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658010205;
 bh=YqjxM/ba/1f2gs7/vJJPHcrb1EmZ9x4GSS2KHP1515Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N2LHAItylr83NfEsYWV+D/x8J6Nr6WcRailbxaGs+3qZ7Ge87SgJCCUaoun5ZYOIr
 TNM2uG0Zn8El+GU3Y4ysrp1/ksDo3uZyknsGVWOBzd0DRQ9Nq3+r9zG/IGX4L+zruM
 xE8pAfKcni7vvTD5uu9Kk9cVIdq2X/2j2hxHqg4wKzdcHRYOFL/zez4cQcTMBmfbbc
 s9K+ILu0j+Iro7wGCUT6nT1lM3Ytfp1X+ubEt/RERLWVDtwrfIdHTTSMJaFyA3LEaE
 zZ752WZ+CP992D9IyosaYhyzsfmQ/IKk9+vlbSKv1AvDh8hsoLiBv9ETZjZ5mJai1G
 vcKDq4Y+Zzu5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=N2LHAIty
Subject: Re: [Buildroot] [PATCH 1/1] package/i2pd: add I2PD_CPE_ID_VENDOR
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

Fabrice, All,

On 2022-07-14 23:26 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:i2pd:i2pd is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ai2pd%3Ai2pd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/i2pd/i2pd.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/i2pd/i2pd.mk b/package/i2pd/i2pd.mk
> index f960c298af..acced51dac 100644
> --- a/package/i2pd/i2pd.mk
> +++ b/package/i2pd/i2pd.mk
> @@ -8,6 +8,7 @@ I2PD_VERSION = 2.42.1
>  I2PD_SITE = $(call github,PurpleI2P,i2pd,$(I2PD_VERSION))
>  I2PD_LICENSE = BSD-3-Clause
>  I2PD_LICENSE_FILES = LICENSE
> +I2PD_CPE_ID_VENDOR = i2pd
>  I2PD_SUBDIR = build
>  I2PD_DEPENDENCIES = \
>  	boost \
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

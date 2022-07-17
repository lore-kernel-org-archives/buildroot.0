Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2543CC43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9C23416F7;
	Sun, 17 Jul 2022 13:24:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9C23416F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jyoi1iLr6Uvp; Sun, 17 Jul 2022 13:24:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 585A0417AA;
	Sun, 17 Jul 2022 13:24:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 585A0417AA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05F2F1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF17B41793
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:22:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF17B41793
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfWi68jXb09p for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:22:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F7F14177F
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F7F14177F
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:22:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D21A978051E;
 Sun, 17 Jul 2022 15:22:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:22:20 +0200
Date: Sun, 17 Jul 2022 15:22:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220717132220.GH2249625@scaer>
References: <20220711054702.27680-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220711054702.27680-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064144;
 bh=TvXf7GLBnkb4jO3Y0d/ohLwiAHZ21WSxpuvES8bcm1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eqr4P4tT205lSRdRTPWXwoq9OmsjpU53JM8mqkuhFByTwQ93UAuG/3lLm5Kqez76C
 ghk3xV+haNxT+irnuOzOkhmy2sF9QY3i5GQdSNVifI3pVs9tsw6cQkNkoF8FXeAOST
 RrtvNWgYXFr+VCb8E9q5mLEHFDOEs2iQeBBTnMaFmlg/yzcPEOFVAaJ9NM5pf6ArUm
 ySPBjJdaU2pXQ/OE4VGbw/EJxlUgd4V5hOggtW6arofHq80CMtUNIekyOL/M5vSfzH
 8dwBcC36MFCi8y5fZ0aRg6IvTwou+ZV5dLs6hqh5gc4p37JMFjzl+XLSUZbdYX66Lp
 qSt4tIgg8bQvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Eqr4P4tT
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-gmmlib: bump version to
 22.1.5
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
Cc: Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-07-11 07:47 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/intel-gmmlib/intel-gmmlib.hash | 2 +-
>  package/intel-gmmlib/intel-gmmlib.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/intel-gmmlib/intel-gmmlib.hash b/package/intel-gmmlib/intel-gmmlib.hash
> index 776eb86d8d..676375601a 100644
> --- a/package/intel-gmmlib/intel-gmmlib.hash
> +++ b/package/intel-gmmlib/intel-gmmlib.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  18f291b6d5c9a170468e050e301f23760bb5b20b79d28a49a791ace2f22880c9  intel-gmmlib-22.1.4.tar.gz
> +sha256  b429cdff2c236274f2b9a32ac4ac2ed5d1655d3c87c557fe0fb7de6b6c906f18  intel-gmmlib-22.1.5.tar.gz
>  sha256  8b7446825df3f8b0268307e272aa6aaaf78351c83161d860d02c913c22666c48  LICENSE.md
> diff --git a/package/intel-gmmlib/intel-gmmlib.mk b/package/intel-gmmlib/intel-gmmlib.mk
> index 7af3e6999d..cc4b200104 100644
> --- a/package/intel-gmmlib/intel-gmmlib.mk
> +++ b/package/intel-gmmlib/intel-gmmlib.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -INTEL_GMMLIB_VERSION = 22.1.4
> +INTEL_GMMLIB_VERSION = 22.1.5
>  INTEL_GMMLIB_SITE = https://github.com/intel/gmmlib/archive
>  INTEL_GMMLIB_LICENSE = MIT
>  INTEL_GMMLIB_LICENSE_FILES = LICENSE.md
> -- 
> 2.30.2
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

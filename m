Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2020EC77B7F
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 13:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1A158200B;
	Sun, 14 May 2023 13:22:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1A158200B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eIfqEQteJYh2; Sun, 14 May 2023 13:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADF6382009;
	Sun, 14 May 2023 13:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF6382009
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CD0A01BF5A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3ED7402F4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3ED7402F4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aiRhNVu15vbw for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 13:22:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9540840114
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9540840114
 for <buildroot@buildroot.org>; Sun, 14 May 2023 13:22:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id CF9DBB00571;
 Sun, 14 May 2023 15:22:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 15:22:25 +0200
Date: Sun, 14 May 2023 15:22:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Maxim Kochetkov <fido_max@inbox.ru>
Message-ID: <20230514132225.GB2582048@scaer>
References: <20230313050938.9860-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230313050938.9860-1-fido_max@inbox.ru>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684070547;
 bh=Z7+7TH4Lsw8aAA9XMngps4EfUXO8oAf6Q4zzEYUSF0M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jk39P/BgCB8eKiYJu1U9DRJxGvYXVDDfg5Lk7Q4IHFHovGwUQKkZrYRGlbk1GH4rr
 XDcijc1Tmqy89X9nPbxQfkxuTSOYK71uY5Cf4cAUVsWw9i56d1jkkPLpnmca/Sbbtf
 fYeeMD+uS00S7iRaC2/6/Bqa5jLYWap/cb8mbjyMiOSlQpsKIVc3CpCQUCfN4IpjXw
 WJp4L8/KS1LLNCHqgTNK8vn6CB2RNWdPlfQNo4U5diS+EzGnO2VYZtyA2MwyBoceJR
 /n7J7EpUwY3eY50fUuGRBvLH118bYuo6q6yM9Rzq2T5sPLsbeozZo8hwrx8Or/0OY9
 cSop4JFQbbyjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Jk39P/Bg
Subject: Re: [Buildroot] [PATCH v3 1/1] package/gdal: bump version to 3.6.2
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

Maxim, All,

On 2023-03-13 08:09 +0300, Maxim Kochetkov via buildroot spake thusly:
> Release notes: https://github.com/OSGeo/gdal/blob/v3.6.2/NEWS.md
> License changes: https://github.com/OSGeo/gdal/commit/a394f9cb299b2c3c2159098483d1fece3a464fda
> 
> ISC License is added for FlatGeobuf and Flatbush
> Apache-2.0 is added for flatbuffers
> 
> Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gdal/gdal.hash | 8 ++++----
>  package/gdal/gdal.mk   | 4 ++--
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/package/gdal/gdal.hash b/package/gdal/gdal.hash
> index ab77d7840d..d0b08b4535 100644
> --- a/package/gdal/gdal.hash
> +++ b/package/gdal/gdal.hash
> @@ -1,6 +1,6 @@
> -# md5 from: https://download.osgeo.org/gdal/3.5.2/gdal-3.5.2.tar.xz.md5, sha256 locally computed:
> -md5  821b3b0637ebada5d20dbefb2e3ec964  gdal-3.5.2.tar.xz
> -sha256  0874dfdeb9ac42e53c37be4184b19350be76f0530e1f4fa8004361635b9030c2  gdal-3.5.2.tar.xz
> +# md5 from: https://download.osgeo.org/gdal/3.6.2/gdal-3.6.2.tar.gz.md5, sha256 locally computed:
> +md5  6f22ffdbd8e00059ddb2b825c5920c4c  gdal-3.6.2.tar.xz
> +sha256  35f40d2e08061b342513cdcddc2b997b3814ef8254514f0ef1e8bc7aa56cf681  gdal-3.6.2.tar.xz
>  
>  # Hashes of license files:
> -sha256  fac0116e799ca4de79b076ee04863b5e2b69541ea3664b9bb108c81a5355f16a  LICENSE.TXT
> +sha256  1dae3468e81d00da56e2936f74d33b8b3ad09d726437f19ce209a5dabea41f77  LICENSE.TXT
> diff --git a/package/gdal/gdal.mk b/package/gdal/gdal.mk
> index a3b11c53af..ce67399c32 100644
> --- a/package/gdal/gdal.mk
> +++ b/package/gdal/gdal.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -GDAL_VERSION = 3.5.2
> +GDAL_VERSION = 3.6.2
>  GDAL_SITE = https://download.osgeo.org/gdal/$(GDAL_VERSION)
>  GDAL_SOURCE = gdal-$(GDAL_VERSION).tar.xz
> -GDAL_LICENSE = MIT, many others
> +GDAL_LICENSE = Apache-2.0, ISC, MIT, many others
>  GDAL_LICENSE_FILES = LICENSE.TXT
>  GDAL_CPE_ID_VENDOR = osgeo
>  GDAL_INSTALL_STAGING = YES
> -- 
> 2.39.2
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F41C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 15:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF3B760ABF;
	Sun,  7 Jan 2024 15:49:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF3B760ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U9AK7RSWe1vh; Sun,  7 Jan 2024 15:49:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D973606EB;
	Sun,  7 Jan 2024 15:49:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D973606EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E9E21BF3BF
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 15:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC173606EB
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 15:49:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC173606EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 18ICUynf7LHn for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 15:49:41 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECC9960634
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 15:49:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECC9960634
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2E0A0B00592;
 Sun,  7 Jan 2024 16:49:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Jan 2024 16:49:35 +0100
Date: Sun, 7 Jan 2024 16:49:35 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZrIDw55eRAnif2j@landeda>
References: <20240107132616.3166936-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240107132616.3166936-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704642579;
 bh=wa85y9K4BvvlhoEkLcgeiU17dEYPhBJ2drs4cDl7BuA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ccHSZaLJr98nFf5EHuivKytZklf0vWaktNHDLO9aoR/hGrsHqplcehftTbhxhizsG
 9Z7TSp0kBNY/QuNeLGDFvB5tnN3gS7Qvpga9xvawvMOOagry0Is8YHUSydz34lwW0C
 rslO74Jh4O3Xf1O3kpRlPq7iUFXfIrykw7Oa3yDwTLw2wGSqZe2bs3z4N1jSZdFVQL
 EPa7HF8O5fFGPsW7kmBlNlaGiSPkt/I9VznC8yuxDNeoDvvs6Iz0/LBlMp+k7xmyo3
 7pV1iLD0F7gHaKDu+5E6yPpaScXcHuxplCOlYwgHfiML0XlhXshc10S/ULy1VLvldP
 sCriIdRXQmggA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ccHSZaLJ
Subject: Re: [Buildroot] [PATCH 1/1] package/liquid-dsp: bump to version
 1.6.0
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-07 14:26 +0100, Fabrice Fontaine spake thusly:
> https://github.com/jgaeddert/liquid-dsp/releases/tag/v1.6.0
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/liquid-dsp/liquid-dsp.hash | 2 +-
>  package/liquid-dsp/liquid-dsp.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/liquid-dsp/liquid-dsp.hash b/package/liquid-dsp/liquid-dsp.hash
> index 6fdbd62a86..4e18f3caa2 100644
> --- a/package/liquid-dsp/liquid-dsp.hash
> +++ b/package/liquid-dsp/liquid-dsp.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  93003edb6e74090b41009b1fae6f273a3e711dc4c8c56a0cca3e89167b765953  liquid-dsp-1.5.0.tar.gz
> +sha256  6ee6a5dfb48e047b118cf613c0b9f43e34356a5667a77a72a55371d2c8c53bf5  liquid-dsp-1.6.0.tar.gz
>  sha256  4df7126196efba1283deb99e3269418dde4ab0ad1fde80a55051153451eb4df2  LICENSE
> diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
> index a96d4cab79..0ff7b73a60 100644
> --- a/package/liquid-dsp/liquid-dsp.mk
> +++ b/package/liquid-dsp/liquid-dsp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIQUID_DSP_VERSION = 1.5.0
> +LIQUID_DSP_VERSION = 1.6.0
>  LIQUID_DSP_SITE = $(call github,jgaeddert,liquid-dsp,v$(LIQUID_DSP_VERSION))
>  LIQUID_DSP_LICENSE = MIT
>  LIQUID_DSP_LICENSE_FILES = LICENSE
> -- 
> 2.43.0
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

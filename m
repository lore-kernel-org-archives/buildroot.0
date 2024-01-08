Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6690CC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:19:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 214FA415CE;
	Mon,  8 Jan 2024 22:19:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 214FA415CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qo0PZYu7XT43; Mon,  8 Jan 2024 22:19:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 723B34158F;
	Mon,  8 Jan 2024 22:19:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 723B34158F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2AA3B1BF421
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02D08419CC
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:19:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02D08419CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6djQOcawQcQ9 for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:19:17 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A90EC41953
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A90EC41953
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6D18AB0055E;
 Mon,  8 Jan 2024 23:19:11 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 23:19:11 +0100
Date: Mon, 8 Jan 2024 23:19:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZx03118QEg-CftI@landeda>
References: <20240107115516.2823271-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240107115516.2823271-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704752355;
 bh=8wWjp3Ff8BLeomamaPewhbm+XjuF7jpFKF0eTj39IG0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rfxfvfTDvWCjPYcJC0k80yfokgGAWWLkmr3VJGgt0vnszztS4V1wA02RMlY3mjfCc
 bMDaRR1Gr2g4ocGuD45c86R03SCbe5xInSIFEdp5e9AsXy4EfxeKGUEH4JZwp3709K
 0NSMKFeIZOB82zJtT2+Rhmx0gRErenuyeJI+5TvlSbm7yEP/wzNxDb/eHTbIfcof07
 CPNwT9MebY4NbYaI5o9sfg8z9XSlzVhNGnvi0F55j/sX8rkh5JWAtpcZB+6KmbLiIW
 9XbXrUjsSg4sMjTYiPcQg8uhFx0JoM2aZaYwgt/+IGPIY9nALfMc/RkQGlXX14Ti+C
 fdhT5dLeRRg8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rfxfvfTD
Subject: Re: [Buildroot] [PATCH 1/1] package/faad2: security bump to version
 2.11.1
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
Cc: Samuel Martin <s.martin49@gmail.com>, Gilles Talis <gilles.talis@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-07 12:55 +0100, Fabrice Fontaine spake thusly:
> - Switch to cmake-package
> - Fix CVE-2023-38857 and CVE-2023-38858
> 
> https://github.com/knik0/faad2/blob/2.11.1/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/faad2/faad2.hash | 2 +-
>  package/faad2/faad2.mk   | 8 ++------
>  2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/package/faad2/faad2.hash b/package/faad2/faad2.hash
> index 3a9c36df00..b7813130fd 100644
> --- a/package/faad2/faad2.hash
> +++ b/package/faad2/faad2.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  4c16c71295ca0cbf7c3dfe98eb11d8fa8d0ac3042e41604cfd6cc11a408cf264  faad2-2.10.1.tar.gz
> +sha256  72dbc0494de9ee38d240f670eccf2b10ef715fd0508c305532ca3def3225bb06  faad2-2.11.1.tar.gz
>  sha256  d3baf3a54943cf12a994c85867a18dec84f810901b2f2878ddfd77efcc3c150f  COPYING
> diff --git a/package/faad2/faad2.mk b/package/faad2/faad2.mk
> index eecab35af8..686e5045c0 100644
> --- a/package/faad2/faad2.mk
> +++ b/package/faad2/faad2.mk
> @@ -4,16 +4,12 @@
>  #
>  ################################################################################
>  
> -FAAD2_VERSION = 2.10.1
> +FAAD2_VERSION = 2.11.1
>  FAAD2_SITE = $(call github,knik0,faad2,$(FAAD2_VERSION))
>  FAAD2_LICENSE = GPL-2.0
>  FAAD2_LICENSE_FILES = COPYING
>  FAAD2_CPE_ID_VENDOR = audiocoding
>  FAAD2_CPE_ID_PRODUCT = freeware_advanced_audio_decoder_2
> -# frontend/faad calls frexp()
> -FAAD2_CONF_ENV = LIBS=-lm
>  FAAD2_INSTALL_STAGING = YES
> -# From git
> -FAAD2_AUTORECONF = YES
>  
> -$(eval $(autotools-package))
> +$(eval $(cmake-package))
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

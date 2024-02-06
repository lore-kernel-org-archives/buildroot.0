Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC29CC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 632B3610E8;
	Tue,  6 Feb 2024 13:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 632B3610E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c1gwR-sd5wt0; Tue,  6 Feb 2024 13:44:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 818F361208;
	Tue,  6 Feb 2024 13:44:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 818F361208
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D7E9B1BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE17641F08
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:44:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE17641F08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJwbx5aFyt5E for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:44:48 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6C7341F00
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:44:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6C7341F00
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E59A013F846;
 Tue,  6 Feb 2024 14:44:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 14:44:42 +0100
Date: Tue, 6 Feb 2024 14:44:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZcI3yv-_XMfdBOgd@landeda>
References: <20240111052225.2922249-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111052225.2922249-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707227086;
 bh=fWGgt5WLZZCLjQqk+3zzqFu93Jmj1/hGwB10k4Gsqho=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eolqMKGPqXyl7zDZAd6TYm9iH9Lkby/qZ7VdPHTIzqei8ihkdGgY9pSswF7Ts/YOX
 DfPYUyofEA9s3uXv+qfe660Yjlxni6dZqY8hrOHnCI43vAwBBGwer7IFpV23K0poNB
 N9vdYZH0qUTenRR/ppgYr12lhCpldfAVFHOt869J2SNMMtBiA7aUvz8KwSAkfqLWzn
 Lf88JgheaMrb3a9KmCtKAimXcSlceyTk3U087fS5SaPBWB8MjcM3zVoRC7O+yTkiUC
 Knxwra2eYwqFMZ2x4MHks5+WVVkzcVTYuu9mt7kOTaSiavbH+UJOiFvcxwRKwd+A3h
 XrO0R3xQ5eDWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eolqMKGP
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rtoml: bump to version
 0.10.0
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

James, All,

On 2024-01-10 22:22 -0700, James Hilliard spake thusly:
> Migrate from setuptools-rust to maturin infrastructure.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-rtoml/python-rtoml.hash | 2 +-
>  package/python-rtoml/python-rtoml.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-rtoml/python-rtoml.hash b/package/python-rtoml/python-rtoml.hash
> index 04d22ed1a4..59f17d9d62 100644
> --- a/package/python-rtoml/python-rtoml.hash
> +++ b/package/python-rtoml/python-rtoml.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after vendoring
> -sha256  821a430ab6587bdaaf7cb95044e8e0d99c77c6aed0adce5a370045b270f7ee20  rtoml-0.8.0.tar.gz
> +sha256  987d3d9e9d56761b17c3e4e172937cbcc793bf24b0ebb2730647a9a2cf86c789  rtoml-0.10.0.tar.gz
>  # Locally computed sha256 checksums
>  sha256  cd5ffde80e6d3286a2e2e5f02fb2cb07b823931ca368e7c735a6c5f5aebe7103  LICENSE
> diff --git a/package/python-rtoml/python-rtoml.mk b/package/python-rtoml/python-rtoml.mk
> index 819dcf3288..16f9dea573 100644
> --- a/package/python-rtoml/python-rtoml.mk
> +++ b/package/python-rtoml/python-rtoml.mk
> @@ -4,10 +4,10 @@
>  #
>  ################################################################################
>  
> -PYTHON_RTOML_VERSION = 0.8.0
> +PYTHON_RTOML_VERSION = 0.10.0
>  PYTHON_RTOML_SOURCE = rtoml-$(PYTHON_RTOML_VERSION).tar.gz
> -PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/33/a6/b42d8e0e28bec9fd7fdbafb2d76db3f8578f151a669eba564d422756d909
> -PYTHON_RTOML_SETUP_TYPE = setuptools-rust
> +PYTHON_RTOML_SITE = https://files.pythonhosted.org/packages/ca/b2/0e77a00e75ed582ec1c4c3a9e1eeed886a15c195bcce87b7daf1171c4115
> +PYTHON_RTOML_SETUP_TYPE = maturin
>  PYTHON_RTOML_LICENSE = MIT
>  PYTHON_RTOML_LICENSE_FILES = LICENSE
>  
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

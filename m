Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C676DC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8039360D62;
	Tue,  7 Nov 2023 21:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8039360D62
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCfxQHtYYkMz; Tue,  7 Nov 2023 21:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC5E2605B3;
	Tue,  7 Nov 2023 21:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC5E2605B3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E676F1BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:37:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C009460D6E
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C009460D6E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLHZQLfpbJde for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:37:35 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA6D460E2D
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:37:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA6D460E2D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9C42F13F861;
 Tue,  7 Nov 2023 22:37:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 22:37:30 +0100
Date: Tue, 7 Nov 2023 22:37:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20231107213730.GK229059@scaer>
References: <20231105050225.2827004-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231105050225.2827004-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699393053;
 bh=mgxAzawm77AfZisc4Sfo5BJXUunG/BbbYrkYewB0+Yo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Z3aHI5bbn0kQYKgPQRVchXNDE652nxSFpvKFMB9bFOIy/1MtZbkOYqPHF/s7+VQeu
 sn5mzY5zFz7qV2Izy1NfEzq3fzJTMXpfd31t48U53J+AiW5N9cd1Mp6AGrSE5fef4H
 MDneqTDX84atHkKmLB+qeV/HNlONVYpdmbEchEXJlm6fVmOCTyEpmKz+jOQF3NLvgF
 I2l35Zjx2gN8nLkuGS6knuoUzBpPXHpbTuomZI456BebFJ376/Ej0GnZwzZqAyV1tL
 xNBjOoFM3N/OME24w9RSNIgNerScrjHQz2z4a4XwGKL4XLD3xtuDYVGuD2nHUNpEpQ
 6uHGXDMeYJ6/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Z3aHI5bb
Subject: Re: [Buildroot] [PATCH 1/1] package/python-dtschema: bump to
 version 2023.9
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

On 2023-11-04 23:02 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-dtschema/python-dtschema.hash | 4 ++--
>  package/python-dtschema/python-dtschema.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
> index 734ff3f681..a391e4ab21 100644
> --- a/package/python-dtschema/python-dtschema.hash
> +++ b/package/python-dtschema/python-dtschema.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/dtschema/json
> -md5  3fd3ba2d98ad320c06277274ca40d045  dtschema-2022.12.tar.gz
> -sha256  f532d433a915e507d4b426b7ef57a6730d23c0938b682fb4866f9dfa80a58ec6  dtschema-2022.12.tar.gz
> +md5  bb0ecd8b8680b76f7cb55da002f58d62  dtschema-2023.9.tar.gz
> +sha256  52c6d271065155ca134d8a0bcf7e0ebed67b3991acbbd7a98b74eb8642f67d87  dtschema-2023.9.tar.gz
>  # Locally computed sha256 checksums
>  sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
> diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
> index dbdf43160c..0fc13073f8 100644
> --- a/package/python-dtschema/python-dtschema.mk
> +++ b/package/python-dtschema/python-dtschema.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_DTSCHEMA_VERSION = 2022.12
> +PYTHON_DTSCHEMA_VERSION = 2023.9
>  PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
> -PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/f2/61/7d7e907ea6eed33708ce07766258b961fe476221fbd2e759a1921487e381
> +PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/24/97/daa9109a854727cd4e1a715e4123198e5abd47db10c131de5bc0cef0acc3
>  PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
>  PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
>  PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
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

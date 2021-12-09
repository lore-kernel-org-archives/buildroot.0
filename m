Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEA3C433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 18:17:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 504B585BD9;
	Thu,  9 Dec 2021 18:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tROIIiobu2O1; Thu,  9 Dec 2021 18:17:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D3C185BD6;
	Thu,  9 Dec 2021 18:17:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AE001BF295
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 18:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A26485BD4
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 18:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4jsdtDvreDzH for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 18:17:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD4AA85BD2
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 18:17:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cfb:dac8:5cd2:e99])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1FC8A13F86A;
 Thu,  9 Dec 2021 19:17:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639073860;
 bh=qGq+OcwOnE6zPl3+IExNxS0Gw+Aqlv8CrtlS+98sVLU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KDya9NdCQ4Iv83aPhRkjk/hPbcMpyHch9R6NcYA3P4xMaRJDLXWY40IlP70NmUwIc
 qFTIm2yE0iAyOeBsHscGF/n/iDJrKUpv0I2tEcCXlmPM3BUsRRmYJcN4dcCSWV/cMO
 fawA0iq6KOAUnXHj4IRRKdFJKWXgyBLFVWP69O6vKj00c7BBtwDnktlzZEppsFPWrg
 4L+3DY5GtNLTFbqS8z8a+0bKtFuoG/5Ke3aebMIqrpCr7JvcY2/SVkGpPKYlVJrGlp
 SM3ZimWGc2moOZxumzuEpLiwkLc7gL70bT7HGgR72A1Q1zi0yQo83dGoxbEUd1O9+7
 +hJctOA6Osp4A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 09 Dec 2021 19:17:31 +0100
Date: Thu, 9 Dec 2021 19:17:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dariobin@libero.it>
Message-ID: <20211209181731.GG2603@scaer>
References: <20211209082148.22068-1-dariobin@libero.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211209082148.22068-1-dariobin@libero.it>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pcre2: fix broken URL
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2021-12-09 09:21 +0100, Dario Binacchi via buildroot spake thusly:
> As stated on www.pcre.org:
> "Note that the former ftp.pcre.org FTP site is no longer available."
> 
> Update _SITE URL to Sourceforge.

Note that the same www.pcre.org states (emphasize mine):

    You can download the current release of the PCRE2 library from its
    **official** home on GitHub: [...]

So I've applied, but switched to Github instead of SF.

Regards,
Yann E. MORIN.

> Signed-off-by: Dario Binacchi <dariobin@libero.it>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/pcre2/pcre2.hash | 2 +-
>  package/pcre2/pcre2.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pcre2/pcre2.hash b/package/pcre2/pcre2.hash
> index 130ce1f596..e0d5f37229 100644
> --- a/package/pcre2/pcre2.hash
> +++ b/package/pcre2/pcre2.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2.sig
> +# http://downloads.sourceforge.net/project/pcre/pcre2/10.37/pcre2-10.37.tar.bz2.sig
>  sha256  4d95a96e8b80529893b4562be12648d798b957b1ba1aae39606bbc2ab956d270  pcre2-10.37.tar.bz2
>  # Locally computed
>  sha256  9c9488256e3612ec5ea40fd12abe7ec55a58f23bd36e6f465116c2b3cbffba02  LICENCE
> diff --git a/package/pcre2/pcre2.mk b/package/pcre2/pcre2.mk
> index 220eb8a99c..b24afb7ca4 100644
> --- a/package/pcre2/pcre2.mk
> +++ b/package/pcre2/pcre2.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  PCRE2_VERSION = 10.37
> -PCRE2_SITE = https://ftp.pcre.org/pub/pcre
> +PCRE2_SITE = http://downloads.sourceforge.net/project/pcre/pcre2/$(PCRE_VERSION)
>  PCRE2_SOURCE = pcre2-$(PCRE2_VERSION).tar.bz2
>  PCRE2_LICENSE = BSD-3-Clause
>  PCRE2_LICENSE_FILES = LICENCE
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

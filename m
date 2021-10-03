Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990D3C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:31:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F39FA6137F
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 19:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F39FA6137F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C51C4407B6;
	Sun,  3 Oct 2021 19:31:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X2ovXFMphfdf; Sun,  3 Oct 2021 19:31:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17910407AC;
	Sun,  3 Oct 2021 19:31:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 387981BF963
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2754A4042D
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 19:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fl_NHn5vNkjL for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 19:31:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01A9640169
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 19:31:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 411DA13F895;
 Sun,  3 Oct 2021 21:31:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633289484;
 bh=LZAJrrSsNNxO9j678uviWhi8st5STRauMRH0RrzKhy0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=drvvqLlNyLwqhBqGwy+5mY8sldMVsoptljU4kWqGVfVn8v0kgshPw6u+fWiwZvftk
 U8TtxkALECrThxv+9qMSon3TVVEsnt2n2e0reYnvWxifE8wroLHUlzGB8BQ1xapC9f
 Nx/m82S7aVFAllfcCFgcjJX8FBSQobtT7iSEYb1x8gsNsEJ2a/Tl9rQi1xugZ3HgSq
 Lsfc5PWII4ge2zpNaUC/0Bqgti4Ng2Vw3afTwuCG+MBAUBAI/lTc76wt8bFv0lvfj2
 W/WKIarGP51xKYgOnTxpa97S3mhAN9xvcTl5iTghbwXVvLUFfxKAc0pqREvkJREQ06
 10X5DBFEc5SeA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 21:31:17 +0200
Date: Sun, 3 Oct 2021 21:31:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Asaf Kahlon <asafka7@gmail.com>
Message-ID: <20211003193117.GN1504958@scaer>
References: <20210923183751.361386-1-asafka7@gmail.com>
 <20210923183751.361386-2-asafka7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210923183751.361386-2-asafka7@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/python-packaging: depend on
 python3
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Asaf, All,

On 2021-09-23 21:37 +0300, Asaf Kahlon spake thusly:
> The latest version of this package requires python 3.6+.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/217157f4dd9fd56d0a13d47e6373f4c478f26757/
> 
> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

I added a blurb that the only reverse dependency, pytest, already needs
python3, and applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-packaging/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-packaging/Config.in b/package/python-packaging/Config.in
> index 12170df84e..74d5205e8d 100644
> --- a/package/python-packaging/Config.in
> +++ b/package/python-packaging/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_PACKAGING
>  	bool "python-packaging"
> +	depends on BR2_PACKAGE_PYTHON3
>  	select BR2_PACKAGE_PYTHON_PYPARSING # runtime
>  	help
>  	  Core utilities for Python packages.
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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

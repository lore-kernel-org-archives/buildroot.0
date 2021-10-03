Return-Path: <SRS0=UivC=OX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC390C433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 17:18:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6681E613A0
	for <buildroot@archiver.kernel.org>; Sun,  3 Oct 2021 17:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6681E613A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3417E4012D;
	Sun,  3 Oct 2021 17:18:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XA16uR_sOibU; Sun,  3 Oct 2021 17:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D9BE40582;
	Sun,  3 Oct 2021 17:18:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EF7B1BF31E
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 17:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2B80B84567
 for <buildroot@lists.busybox.net>; Sun,  3 Oct 2021 17:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZwsZxZmLEit for <buildroot@lists.busybox.net>;
 Sun,  3 Oct 2021 17:18:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D812084664
 for <buildroot@buildroot.org>; Sun,  3 Oct 2021 17:18:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1d3d:918b:43fc:aadd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 047E413F8AE;
 Sun,  3 Oct 2021 19:18:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1633281489;
 bh=BWVIVLk/naRxg6aKC/pTBlUCD1SNOSx37+TJdqS5Hp0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eYQPOsCjE7EdN/tjuQKXST8PZbrKZ2OyOl7bsABJbLW75OKst/efRBzZr3Kyfv0CL
 4IbJtRPBnQT4Y9RcQeTzpbgPsLa6/In8oWgqNCqH4D5GpnWL9txQoIwzgbowB5eIR9
 krH5h2PqBs01d0CtB2cyc5P88ILWNpziDcl6ukczSDjR3jCGgA8FUDfAjIZVfsZyFS
 KIYG7P+yuv4kojdThRxx9cuzSLu8Iz5i6s2PGPlButHSbqDoC663uQViv167YPms8K
 aFAuPl9h6xKWoolaIdtffXVDHt0T2UomHOf6i9HVA0u/tjeBNypm8Hr/p5xW1U9hRa
 zPwoRsmxjQcbg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Oct 2021 19:18:00 +0200
Date: Sun, 3 Oct 2021 19:18:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211003171800.GK1504958@scaer>
References: <20211003161811.256036-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211003161811.256036-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/python-augeas: switch from "depends
 on" to "select" for augeas dep
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
Cc: Herve Codina <herve.codina@bootlin.com>, Asaf Kahlon <asafka7@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-10-03 18:18 +0200, Thomas Petazzoni spake thusly:
> During the review of the lua-augeas package, it was pointed out that a
> "select BR2_PACKAGE_AUGEAS" should be used instead of a "depends on
> BR2_PACKAGE_AUGEAS". But, the same review pointed that python-augeas
> used a "depends on BR2_PACKAGE_AUGEAS".
> 
> In order to make things consistent, let's switch to "select
> BR2_PACKAGE_AUGEAS" as well for python-augeas.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-augeas/Config.in | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/package/python-augeas/Config.in b/package/python-augeas/Config.in
> index 3503a83b3b..4ab2bd1b26 100644
> --- a/package/python-augeas/Config.in
> +++ b/package/python-augeas/Config.in
> @@ -1,8 +1,14 @@
>  config BR2_PACKAGE_PYTHON_AUGEAS
>  	bool "python-augeas"
> -	depends on BR2_PACKAGE_AUGEAS
> +	depends on !BR2_arc
> +	depends on BR2_USE_WCHAR
> +	select BR2_PACKAGE_AUGEAS
>  	select BR2_PACKAGE_PYTHON_CFFI # runtime
>  	help
>  	  Pure python bindings for Augeas.
>  
>  	  https://github.com/hercules-team/python-augeas
> +
> +comment "python-augeas needs a toolchain w/ wchar"
> +	depends on !BR2_arc
> +	depends on !BR2_USE_WCHAR
> -- 
> 2.31.1
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

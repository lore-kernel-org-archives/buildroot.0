Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2018C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 22:43:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A09476FA4A;
	Fri,  8 Dec 2023 22:43:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A09476FA4A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q74aK7YhQtEF; Fri,  8 Dec 2023 22:43:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECCA66FA1E;
	Fri,  8 Dec 2023 22:43:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECCA66FA1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 846051BF995
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 22:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5BBDB409DD
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 22:43:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BBDB409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3QWYRrkgB9v for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 22:43:19 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E7469400AF
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 22:43:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7469400AF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0C75313F81D;
 Fri,  8 Dec 2023 23:43:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 08 Dec 2023 23:43:13 +0100
Date: Fri, 8 Dec 2023 23:43:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <ZXOcAb2EJ6W0eXkd@landeda>
References: <20231208131309.1036690-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231208131309.1036690-1-romain.naour@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702075396;
 bh=dRnukNzTbt0l8+GGFeXvNMO+t+AWe8Zdds0xCsQqwoI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IV+hA8jOoItqv8vBHSZbifdKOf2LLm+1LANgXKXHqremAev0q1z34c5tTXRlDL/If
 FLnIWNygYlRkstFz3BYEcMYQ4atNBRmTKO/9h252h8JJ8trFaxHpl79N8ZiKgpXkhC
 Y0dPyadKNr4SwE4sjJ5jpX75mWDNSvVNL9z1/SE5nYV/ik1LwnxoXLZp/ldbb7I6+W
 9dRWdaXY3f5M8WZRO/tkYaNCEXlWxcoJZak08kij8R0Ylmfsm4qiByh6RoRstNWpzn
 4a7d5PvKXAwVry0QNuPVoAIG+9tO9614OixWRVfHs/na3a9KIwf8uiwTsv+8/GzfRN
 3c4dS6anwyWyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IV+hA8jO
Subject: Re: [Buildroot] [PATCH] package/pkg-python.mk: fix typo
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

Romain, All,

On 2023-12-08 14:13 +0100, Romain Naour spake thusly:
> Commit [1] introduced PKG_PYTHON_MATURIN_INSTALL_CMD while
> it should be HOST_PKG_PYTHON_MATURIN_INSTALL_CMD.
> 
> Adding any new host python package using maturin setup type will
> fail during the install step.
> 
> [1] 6b915358babe37a721b4f6e032ec884174bd6e0b
> 
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.

You could/should have pushed that yourself! ;-)

Regards,
Yann E. MORIN.

> ---
>  package/pkg-python.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index bda79116c8..4bed5a1835 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -258,8 +258,8 @@ HOST_PKG_PYTHON_MATURIN_ENV = \
>  HOST_PKG_PYTHON_MATURIN_BUILD_CMD = \
>  	$(HOST_PKG_PYTHON_PEP517_BUILD_CMD)
>  
> -PKG_PYTHON_MATURIN_INSTALL_CMD = \
> -	$(PKG_PYTHON_PEP517_INSTALL_CMD)
> +HOST_PKG_PYTHON_MATURIN_INSTALL_CMD = \
> +	$(HOST_PKG_PYTHON_PEP517_INSTALL_CMD)
>  
>  ################################################################################
>  # inner-python-package -- defines how the configuration, compilation
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

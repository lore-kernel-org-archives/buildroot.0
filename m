Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08900C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B95961162;
	Tue,  6 Feb 2024 13:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B95961162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwZ-XyUKOTQs; Tue,  6 Feb 2024 13:30:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E628561179;
	Tue,  6 Feb 2024 13:30:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E628561179
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDD5B1BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5CD641E82
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:30:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5CD641E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJ2n5V15uzJU for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:30:27 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43FE141E7E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43FE141E7E
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2A95313F8D5;
 Tue,  6 Feb 2024 14:30:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 14:30:21 +0100
Date: Tue, 6 Feb 2024 14:30:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <ZcI0bZt04f3jRhPk@landeda>
References: <20240206132051.2838897-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206132051.2838897-1-yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707226224;
 bh=4HyahFq5YJJavzYC9VWydmFdmHIlZqMDwPPN5kQ17n8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KjmBHfC3D3p/6LjbIw7sS4EvbONgu3LdxztS81zK1D6MGyDNTXVF9whmi69cvxIDv
 wVEhGabn9BYdKFjyK/KNMTM8+MwynoVKsG5F4KofD5X2mqjyI/PRoxkpoTFLrXfqNs
 PzWKYMhl3TiVTlspBTXSrLsf1ub7ypsnQga89njk3m7SsPCNDj9DluOmIJR91c/WfV
 BNgbDY44Yby0eNtlf8GRrn88qXUR4AB5R/HCSLN7kK3+U+Iv8aFd/WNawHkz5g3Zpr
 d2OB2KdBBqwcTuUNvQzxssNoAML+4otCnVQrGCH9CDeXBQR3n8crf/n3RCsXTiFTCC
 gU1DjEDiJZCJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KjmBHfC3
Subject: Re: [Buildroot] [PATCH] Create a .gitignore file in the CANONICAL_O
 directory
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

Yegor, All,

On 2024-02-06 14:20 +0100, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> This .gitignore file ignores all files in an output directory and
> hence doesn't change the git status.
> 
> Remove "/output" entry from the main .gitignore file as it is already
> handled by this general approach.

What are you trying to achieve with this that does not work currently?

Regards,
Yann E. MORIN.

> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .gitignore | 1 -
>  Makefile   | 3 +++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitignore b/.gitignore
> index bb02d9f572..14b7ca5040 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -1,4 +1,3 @@
> -/output
>  /dl
>  /.auto.deps
>  /.config.cmd
> diff --git a/Makefile b/Makefile
> index ac625152c6..86d4444745 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -63,6 +63,9 @@ ifneq ($(findstring @,$(CANONICAL_O)),)
>  $(error The build directory can not contain a '@')
>  endif
>  
> +# Create a default .gitignore file that ignores everything
> +$(shell echo "*" > "$(CANONICAL_O)/.gitignore")
> +
>  CANONICAL_CURDIR = $(realpath $(CURDIR))
>  
>  REQ_UMASK = 0022
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

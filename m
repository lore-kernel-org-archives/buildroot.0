Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A0AFC54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 21:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C534281ED6;
	Mon, 16 Jan 2023 21:27:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C534281ED6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E5B6jNiTGudm; Mon, 16 Jan 2023 21:27:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE39281E8A;
	Mon, 16 Jan 2023 21:27:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE39281E8A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C84AB1BF20D
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 21:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2D9C410AF
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 21:27:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2D9C410AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T_l6zOre3RZQ for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 21:27:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27D68410A1
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 27D68410A1
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 21:27:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 26E945FFA1;
 Mon, 16 Jan 2023 22:26:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 22:26:55 +0100
Date: Mon, 16 Jan 2023 22:26:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Message-ID: <20230116212654.GJ2770@scaer>
References: <20230115191751.3884627-1-vfazio@xes-inc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230115191751.3884627-1-vfazio@xes-inc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673904424;
 bh=e01GN2c9G974Ih9JNfXx8c57AJX5swZ5H4PPOrLqRgc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dZDqYPc17ir6CUbHnFshypQS1hPeKxsxw3XKNaFScX2Im7Q365C1gWQj9gn9VbfWo
 3sywljaAphRtPr2iRKIo7hB1CcUaGH/EObB0XDhmL1vtltue0dBbX8hAUghEHnWvPS
 jDZyPYNQS+K/VN0F8LPbaqT16ul4qKw2DWXemfN6WjxsspZDQao1lVcrTsgKUCNsqZ
 Sw86bhayvDHIL7Nl86HqVVf+RNdzIkq555COCGdpnbSl28wpf1j4rmZmyzthfCsiBP
 pQvFm54MxD6LO3G6Qec8t1vqYpD5dD8AAkhh6uz9v5zsXDlDMR5STlFtsPmi0PRg1L
 9Tj95H96XrsRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dZDqYPc1
Subject: Re: [Buildroot] [PATCH 1/1] package/ipmitool: fix broken IANA PEN
 registry URL
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
Cc: Floris Bos <bos@je-eigen-domein.nl>, Heiko Thiery <heiko.thiery@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2023-01-15 13:17 -0600, Vincent Fazio spake thusly:
> From: Vincent Fazio <vfazio@gmail.com>
> 
> Backport the upstream fix for the IANA Private Enterprise Numbers
> registry URL so the correct file gets downloaded and installed.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .../0002-Fix-enterprise-numbers-URL.patch     | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
> 
> diff --git a/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch b/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
> new file mode 100644
> index 0000000000..07cdbd4527
> --- /dev/null
> +++ b/package/ipmitool/0002-Fix-enterprise-numbers-URL.patch
> @@ -0,0 +1,36 @@
> +From 1edb0e27e44196d1ebe449aba0b9be22d376bcb6 Mon Sep 17 00:00:00 2001
> +From: Alexander Amelkin <alexander@amelkin.msk.ru>
> +Date: Tue, 22 Nov 2022 13:55:33 +0300
> +Subject: [PATCH] Fix enterprise-numbers URL
> +
> +IANA has changed their URL scheme, and the content at the old URL for
> +enterprise-numbers switched from text/plain to text/html.
> +
> +Fix Makefile.am to use the new URL
> +
> +Resolves ipmitool/ipmitool#377
> +
> +Signed-off-by: Alexander Amelkin <alexander@amelkin.msk.ru>
> +
> +[vfazio: backport from upstream 1edb0e27e44196d1ebe449aba0b9be22d376bcb6]
> +Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> +---
> + Makefile.am | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index ce3267f..3182a52 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -41,7 +41,7 @@ MAINTAINERCLEANFILES = Makefile.in aclocal.m4 configure configure-stamp \
> + 	$(distdir).tar.gz $(distdir).tar.bz2
> + 
> + SUBDIRS = lib src include doc contrib control
> +-IANA_PEN = http://www.iana.org/assignments/enterprise-numbers
> ++IANA_PEN = http://www.iana.org/assignments/enterprise-numbers.txt
> + 
> + dist-hook:
> + 	cp control/ipmitool.spec $(distdir)
> +-- 
> +2.25.1
> +
> -- 
> 2.25.1
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

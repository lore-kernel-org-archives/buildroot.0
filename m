Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE75EC7619A
	for <buildroot@archiver.kernel.org>; Sat, 15 Apr 2023 13:29:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D97542938;
	Sat, 15 Apr 2023 13:29:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D97542938
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GYo7k26iqMwU; Sat, 15 Apr 2023 13:29:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFF1541870;
	Sat, 15 Apr 2023 13:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EFF1541870
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7936E1C400F
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 13:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50EF841870
 for <buildroot@lists.busybox.net>; Sat, 15 Apr 2023 13:29:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50EF841870
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xtp38djXErlA for <buildroot@lists.busybox.net>;
 Sat, 15 Apr 2023 13:29:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4142416A4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4142416A4
 for <buildroot@buildroot.org>; Sat, 15 Apr 2023 13:29:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 68EC35FFAF;
 Sat, 15 Apr 2023 15:29:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Apr 2023 15:29:29 +0200
Date: Sat, 15 Apr 2023 15:29:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230415132929.GK2819@scaer>
References: <20230411203930.2455301-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230411203930.2455301-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681565371;
 bh=GDJ0s5+1Kphbug25iTuTIfCCgE5NMX+4owpb67nDZrI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nt6ORsY69IDzPI3eNe50ZkmDAk3gum22m/W2xGpTcdQjCafIFa4iZ8+rV37LODKn8
 py8R2iQgVdHbzVkQ6633YYHE1DwjzodQbGLMoOp6OnkUM4FjoUfjcpPxcxocbsbtfV
 WZOpBx4hA3SwMw4tgfawe1SR4lppqC6yipWxcWGeE+9mZ4yl9W277yK944umHS1kfu
 aDoQSAVz4NF3JSYxy180DNZD1TB1wVBl+bQ+d6Kqaa2U6yNF/DJ8ii3fTef1xZI+w0
 6GEfq0K1euBwj62eyg/tY14E2rxmsVxilHl6U1Fw76x+u1x2AD0rgwHHvW5K4TRFly
 qzl0tpNWyai4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nt6ORsY6
Subject: Re: [Buildroot] [PATCH v2 1/1] package/openocd: bump to 0.12.0
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

Dario, All,

On 2023-04-11 22:39 +0200, Dario Binacchi spake thusly:
[--SNIP--]
> The new version moves the GPL-2.0 license from COPYING to the subfolder
> "preferred", adding the header required by spdxcheck.py. A minimalist
> COPYING is added in the top directory, as required by automake, pointing
> to the files in LICENSES.
[--SNIP--]
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index 37a06ca848b7..2645f9a02465 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -4,12 +4,20 @@
>  #
>  ################################################################################
>  
> -OPENOCD_VERSION = 0.11.0
> +OPENOCD_VERSION = 0.12.0
>  OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
>  OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
> -OPENOCD_LICENSE = GPL-2.0+
> -OPENOCD_LICENSE_FILES = COPYING
> -# 0002-configure-enable-build-on-uclinux.patch patches configure.ac
> +OPENOCD_LICENSE = GPL-2.0+ (code), GFDL-1.2-no-invariants-or-later (docs), \
> +	GPL-3.0+, (stand-alone code), BSD-1-clause, BSD-2-clause, BSD-3-clause, \
> +	MIT, BSD-Source-Code, eCos-exception-2.0
> +OPENOCD_LICENSE_FILES = COPYING LICENSES/exceptions/eCos-exception-2.0 \
> +	LICENSES/license-rules.txt LICENSES/preferred/BSD-1-Clause \
> +	LICENSES/preferred/BSD-2-Clause LICENSES/preferred/BSD-2-Clause-Views \
> +	LICENSES/preferred/BSD-3-Clause LICENSES/preferred/BSD-Source-Code \
> +	LICENSES/preferred/GFDL-1.2 LICENSES/preferred/gfdl-1.2.texi.readme \
> +	LICENSES/preferred/GPL-2.0 LICENSES/preferred/MIT \
> +	LICENSES/stand-alone/GPL-3.0
> +# 0001-configure-enable-build-on-uclinux.patch patches configure.ac

This is a bit difficult to read, so I changed it to one-item per line.

Also, listing the eCos exception by itself was a little weird, so I
looked at the code, and it turns out there a single file that references
that exception:
    src/flash/nand/ecc.c

The SPDX identifier for that file is:
    SPDX-License-Identifier: GPL-2.0-or-later WITH eCos-exception-2.0

It is part of openocd itself (the executalbe), via libopenocd.la (which
is a convenience library, i.e. a static lib that is not installed).

So, I believe the real licening terms should be:

    OPENOCD_LICENSE = \
        BSD-1-clause, \
        BSD-2-clause, \
        BSD-2-Clause-Views, \
        BSD-3-clause, \
        BSD-Source-Code, \
        GFDL-1.2-no-invariants-or-later (docs), \
        GPL-2.0+ eith eCos-exception-2.0 (code), \
        GPL-3.0+ (stand-alone code), \
        MIT

I was about to do so before I pushed, but I'd like a bit of feedback...

Thoughts?

Anyway, as all the licensing details were there, I pushed without the
above issue addressed, so can you please look into sending a follow-up
patch to explain fix it and all the above, please?

Regards,
Yann E. MORIN.

>  OPENOCD_AUTORECONF = YES
>  OPENOCD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"
>  
> -- 
> 2.32.0
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

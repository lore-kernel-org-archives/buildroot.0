Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2AECA5504
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 08:15:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F32D64190D;
	Wed, 13 Sep 2023 08:15:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F32D64190D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIFV-kJ7z4Im; Wed, 13 Sep 2023 08:15:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0591C41904;
	Wed, 13 Sep 2023 08:15:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0591C41904
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1D9D21BF83B
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 08:15:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C11E0820FD
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 08:15:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C11E0820FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AHELMsyI9rOz for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 08:15:04 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73A798225A
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 08:15:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73A798225A
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 7374D3520760; Wed, 13 Sep 2023 10:15:00 +0200 (CEST)
Date: Wed, 13 Sep 2023 10:15:00 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Niklas Cassel <niklas.cassel@wdc.com>
Message-ID: <ZQFvhOogsWQT0QYN@waldemar-brodkorb.de>
References: <20230912110420.1111238-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230912110420.1111238-1-niklas.cassel@wdc.com>
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1694592900; bh=mN/9dF2I0Ex/kb8mWtyR1dYwyGXpbZi9oJFSy1qOdBY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s++paTyxTLuutNpdjUK/QQgQZ/TlXzsaIqHpCsMdW224U/Qdweg6QJwlFmB9mNveb
 MR2uKZ/hq0O01mYLJNyqbfCy+OwZY+yO2DjP38FGd6c+APzxoIV31nM7tRtbzTvcjB
 u5zaHZKph+uwTLjpoaGisji15jMDQu7BicU0JO3mqxzZ19aqKtoHw7WZdeuYg/uI5w
 skwnxLTOtCU0ayf7ad3N8e3/JyqrqVWsicnFB1m1h0mkhFKq0Tg86X66CohRHlM/Xh
 w5I53iXDay/BReoyzjZj34NS7XPERFhaVJsXXishtHcYbiZohlLPTy2mIyM9aLMsTi
 3bUV4wSe72+vQ==
Subject: Re: [Buildroot] [PATCH] package/elf2flt: update to version 2023.09
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
Cc: Greg Ungerer <gregungerer@westnet.com.au>,
 Damien Le Moal <Damien.LeMoal@wdc.com>,
 Waldemar Brodkorb <mail@waldemar-brodkorb.de>,
 Jesse T <mr.bossman075@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>

> diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
> index c576f65cdb..4dc040645e 100644
> --- a/package/elf2flt/elf2flt.hash
> +++ b/package/elf2flt/elf2flt.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  6637432ed58dee2d42d09e3b9a902a0dd3b9975acba0c0b24ef9e4e9253159a9  elf2flt-2021.08.tar.gz
> +sha256  735482d8c5fd76191e86ff2d6985dd68c232a7b8bdac11fdb480385c6a75ca8f  elf2flt-2023.09.tar.gz
>  sha256  f20bc5007904094e3a4e9fbcc3526cdd40893f91d458c3139b308e5c4c0899c6  LICENSE.TXT
> diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
> index b970de48f2..0def282c02 100644
> --- a/package/elf2flt/elf2flt.mk
> +++ b/package/elf2flt/elf2flt.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ELF2FLT_VERSION = 2021.08
> +ELF2FLT_VERSION = 2023.09
>  ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,v$(ELF2FLT_VERSION))
>  ELF2FLT_LICENSE = GPL-2.0+
>  ELF2FLT_LICENSE_FILES = LICENSE.TXT

Great! You can add a 
Tested-By: Waldemar Brodkorb <wbx@openadk.org>

I tested Qemu m68k, riscv64 and Xtensa. And tested on
STM32F429-Disco.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

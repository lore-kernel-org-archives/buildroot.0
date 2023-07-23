Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 011FEC001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 14:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2E0E81DF2;
	Sun, 23 Jul 2023 14:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2E0E81DF2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VNCjRO2b1gcP; Sun, 23 Jul 2023 14:39:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B331781DF3;
	Sun, 23 Jul 2023 14:39:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B331781DF3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 319381BF3EB
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A63C40490
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0A63C40490
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dPBzKHEFKPNt for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 14:39:55 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17BFA40151
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 14:39:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17BFA40151
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:46bc:e175:93d0:2fb4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4A39A5FFA5;
 Sun, 23 Jul 2023 16:39:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 16:39:50 +0200
Date: Sun, 23 Jul 2023 16:39:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230723143950.GF2503916@scaer>
References: <20230723104920.346025-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723104920.346025-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690123192;
 bh=+oiuqYzQEE6r5tkfu2OdWV89VPp3CfxlSKWf9zbplFU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OzlSYzuCBieeo1qBbw9bZOy9uooFvNyG9UWBl8Rsep39nnvKf9g/SGMNl+kTHwiiK
 5HTrbg1CDekrx1bwm+OqFB/b5q8hWsm6RBCWey7CFEjNktlSznqvWNffE/lhuBgD56
 Zg6W9Hhji3ZcpufZ59N+J612hnvGYsPFSU8Wc7rA7AIZPNLvaJaqGD7D1dAFMSx5gM
 68TRnYXLbSGwadfQJQ/lehL7G//+O7WUbH3XyFrijn7XqmHm0hL9OOPsQTPPneLM7E
 oxZu944w4oyUXfxmK/IUsTwdKNjj4/HkhXHu2LDH2AHgmJe4uTuFtsPI77bPoR+c5c
 UsGaCS1HoZ1aQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OzlSYzuC
Subject: Re: [Buildroot] [PATCH 1/1]
 support/testing/tests/package/test_lrzip.py: new runtime test
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

Julien, All,

On 2023-07-23 12:49 +0200, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                                  |  1 +
>  support/testing/tests/package/test_lrzip.py | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 support/testing/tests/package/test_lrzip.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a6644819bd..1b474c541f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1751,6 +1751,7 @@ F:	support/testing/tests/package/test_iperf3.py
>  F:	support/testing/tests/package/test_kexec.py
>  F:	support/testing/tests/package/test_kexec/
>  F:	support/testing/tests/package/test_libjxl.py
> +F:	support/testing/tests/package/test_lrzip.py
>  F:	support/testing/tests/package/test_lzip.py
>  F:	support/testing/tests/package/test_lsof.py
>  F:	support/testing/tests/package/test_lz4.py
> diff --git a/support/testing/tests/package/test_lrzip.py b/support/testing/tests/package/test_lrzip.py
> new file mode 100644
> index 0000000000..31559d4e87
> --- /dev/null
> +++ b/support/testing/tests/package/test_lrzip.py
> @@ -0,0 +1,12 @@
> +from tests.package.test_compressor_base import TestCompressorBase
> +
> +
> +class TestLrzip(TestCompressorBase):
> +    __test__ = True
> +    config = TestCompressorBase.config + \
> +        """
> +        BR2_PACKAGE_LRZIP=y
> +        """
> +    compress_cmd = "lrzip"
> +    decompress_cmd = "lrunzip"
> +    compressed_file_ext = ".lrz"
> -- 
> 2.41.0
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE01C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:10:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD4EB40206;
	Sun, 11 Dec 2022 09:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD4EB40206
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4eAsJM2-WQw; Sun, 11 Dec 2022 09:10:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6955140213;
	Sun, 11 Dec 2022 09:10:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6955140213
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 70F261BF3D9
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 09:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 584E4401D0
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 09:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 584E4401D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kEM-JxHbohGz for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 09:04:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 295744019C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 295744019C
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 09:04:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9fcf:911b:99f4:8b0a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 64D705FFAF;
 Sun, 11 Dec 2022 10:04:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 10:04:42 +0100
Date: Sun, 11 Dec 2022 10:04:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: yegorslists@googlemail.com
Message-ID: <20221211090442.GM1044805@scaer>
References: <20221207140253.20533-1-yegorslists@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221207140253.20533-1-yegorslists@googlemail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670749485;
 bh=f+v3uvwgfpqGar9k52BowsaqNFe5q+VIiFaxQcICoWk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mZO997RdA16og50O5XAm5xtO6hr5WWChmqt2uRiQmBXLfJLRFAXgMUbKq5m2DiVow
 KXUh4EPpkHwMBLKrb362ThWokS0KKPaiSNrPk2tAheu3rQlDkPo7jpEKc4conpXztn
 ht8Xdl3qK5CANBhItGVPYwAKSoNf0nCBdYkElZw1BLGX/fnZCoWH7fF8bvUt0RJQt3
 r1D6bNYX2bm+JZB2r4HGcwA7StY8V9V4W5LjVlqXzFX0fkw9UddOFRknel/h552Kwz
 O5QDoFpPls23WLI1y9QIZtAZmZTzV55lwdAP9t5STCV0DIWzTO1MILVl+q604ogm3L
 kLOWpXALe9ZVg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mZO997Rd
Subject: Re: [Buildroot] [PATCH] package/python-dicttoxml: bump to version
 1.7.15
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

Yegor, All,

On 2022-12-07 15:02 +0100, yegorslists--- via buildroot spake thusly:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Sorry, the same bump was part of the slew of python package bumps sent
by James, which I applied in batch.

Regards,
Yann E. MORIN.

> ---
>  package/python-dicttoxml/python-dicttoxml.hash | 4 ++--
>  package/python-dicttoxml/python-dicttoxml.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
> index d8c43d0144..de31782104 100644
> --- a/package/python-dicttoxml/python-dicttoxml.hash
> +++ b/package/python-dicttoxml/python-dicttoxml.hash
> @@ -1,5 +1,5 @@
>  # md5 from https://pypi.python.org/pypi/dicttoxml/json
> -md5  ec5643a048cf32dad3c28db236b923e4  dicttoxml-1.7.4.tar.gz
> +md5  234550e3aa875c6f3520aa9a2dff1ef1  dicttoxml-1.7.15.tar.gz
>  # Locally computed
> -sha256  ea44cc4ec6c0f85098c57a431a1ee891b3549347b07b7414c8a24611ecf37e45  dicttoxml-1.7.4.tar.gz
> +sha256  5540fe7dfde2d2ed9467e67fcc981cbd2e164dc3120c862bdb7333202ac48838  dicttoxml-1.7.15.tar.gz
>  sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
> diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
> index 537afff601..3e5f90e9de 100644
> --- a/package/python-dicttoxml/python-dicttoxml.mk
> +++ b/package/python-dicttoxml/python-dicttoxml.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_DICTTOXML_VERSION = 1.7.4
> +PYTHON_DICTTOXML_VERSION = 1.7.15
>  PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
> -PYTHON_DICTTOXML_SITE = https://pypi.python.org/packages/74/36/534db111db9e7610a41641a1f6669a964aacaf51858f466de264cc8dcdd9
> +PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/45/b5/efa170fd88e8b8bc025c59592eade0fb7de6ae02ed3dd63957956adc1396
>  PYTHON_DICTTOXML_SETUP_TYPE = distutils
>  PYTHON_DICTTOXML_LICENSE = GPL-2.0
>  PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
> -- 
> 2.17.0
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

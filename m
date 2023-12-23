Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C44C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 10:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF6AF60BE8;
	Sat, 23 Dec 2023 10:21:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF6AF60BE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WwUsE8aDO1ZP; Sat, 23 Dec 2023 10:21:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F83060BBC;
	Sat, 23 Dec 2023 10:21:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F83060BBC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2B91BF39D
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5618860BBC
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 10:20:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5618860BBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oscg7WOG40_0 for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 10:20:58 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5567C60B9E
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 10:20:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5567C60B9E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9A147B0059A;
 Sat, 23 Dec 2023 11:20:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Dec 2023 11:20:52 +0100
Date: Sat, 23 Dec 2023 11:20:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZYa0hAkGmnEJFaaa@landeda>
References: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231220200110.1819507-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703326856;
 bh=3lyd5RLkM1klppoMv4S+YWGjpLtpkRQ6eXqoW7Zejz0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q3sxRa/kEqP0UT9sThsMZd4j4cJ+NuQtIt2acUGWNv54MiNqohx2D26qnNV2xgaOn
 eGnYnePtbHdDcvv7mUUrvxv8CiHv763MbGmIZh+VvrCtfR/iDJjTq34/j1Tv1sMVTQ
 o6MvYzWrPMFJP6qyOGc1Lj0sZDQk+U6VrQFiNLoPWKCQ/Kvv0sAHgYuNLTRql5jzIh
 g/y9TsO2KL0pJwIqDQIzgdyk98L13tPyNJBhf7FOlvWW/TeIhWyp/SCYVsu2W2xTOs
 w9UA509iw2ddncjSX35mfktnwYEDkv2VZN8TGj9l0BZUXEg01gDTws2cNE8KbWW7Tq
 EqpHBkqEBL1Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Q3sxRa/k
Subject: Re: [Buildroot] [PATCH 1/3] package/glibc: add proper CPE ID
 version detail
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
Cc: peter.verbrugge@technolution.nl, Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-12-20 21:01 +0100, Thomas Petazzoni spake thusly:
> As reported in bug 15895, the GLIBC_VERSION field having a value
> looking like 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701, it
> prevents the CPE/CVE matching with the NVD database to work correctly.
> 
> This commit fixes that by defining GLIBC_CPE_ID_VERSION, derived from
> GLIBC_VERSION, by extracting the base version.
> 
> Also, we update GLIBC_IGNORE_CVES to account for the CVEs that have
> clearly been fixed between 2.38 and
> 2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701. There are a number
> of other CVEs still affecting the glibc package, but they are not
> related to this
> 2.38...2.38-27-g750a45a783906a19591fb8ff6b7841470f1f5701 range.
> 
> Fixes: #15895
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/glibc/glibc.mk | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 0b71530310..32e6516c7f 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -20,6 +20,22 @@ GLIBC_LICENSE = GPL-2.0+ (programs), LGPL-2.1+, BSD-3-Clause, MIT (library)
>  GLIBC_LICENSE_FILES = COPYING COPYING.LIB LICENSES
>  GLIBC_CPE_ID_VENDOR = gnu
>  
> +# Extract the base version (e.g. 2.38) from GLIBC_VERSION) in order to
> +# allow proper matching with the CPE database.
> +GLIBC_CPE_ID_VERSION = $(word 1, $(subst -,$(space),$(GLIBC_VERSION)))
> +
> +# Fixed by b25508dd774b617f99419bdc3cf2ace4560cd2d6, which is between
> +# 2.38 and the version we're really using
> +GLIBC_IGNORE_CVES += CVE-2023-4527
> +
> +# Fixed by 750a45a783906a19591fb8ff6b7841470f1f5710, which is between
> +# 2.38 and the version we're really using.
> +GLIBC_IGNORE_CVES += CVE-2023-4911
> +
> +# Fixed by 5ee59ca371b99984232d7584fe2b1a758b4421d3, which is between
> +# 2.38 and the version we're really using.
> +GLIBC_IGNORE_CVES += CVE-2023-5156
> +
>  # glibc is part of the toolchain so disable the toolchain dependency
>  GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
>  
> -- 
> 2.43.0
> 

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

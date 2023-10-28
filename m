Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E323C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 21:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17D6040565;
	Sat, 28 Oct 2023 21:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17D6040565
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hOyKiIB7dBWP; Sat, 28 Oct 2023 21:06:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B35C42F43;
	Sat, 28 Oct 2023 21:06:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B35C42F43
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 165171BF32C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E36F883C76
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 21:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E36F883C76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PglMlQqCqkIL for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 21:03:30 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEC3983C71
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 21:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEC3983C71
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A8DF52003CC;
 Sat, 28 Oct 2023 23:03:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Oct 2023 23:03:24 +0200
Date: Sat, 28 Oct 2023 23:03:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20231028210324.GA687180@scaer>
References: <20231028153448.142511-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231028153448.142511-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698527007;
 bh=U4qwafZyDzWbdD4qdGsixYNp9OtzaWAfnwac62VD+ZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F/ExVtwlOKMu197FtWESlt3eqhSa4aQFwCWDpzwRnfrDKCVHHAhRrSdTEwOEVaaI5
 E5rDY8zKiXmJF1VNrtPs8/z32FYKstNzaYtvaqujpc6VRXAWfol0juus2ajE26bz0n
 JgrIezE+cmG86ceSbBQRJnkNIRQW4P1s5sxN/l8gJgh8JxfN1fUv23ufyteZ2gX+Ky
 QBDmwlHsmFjqQM9OPZUwqnJ6F+UqYUTzFI03MSqjc5ph/+j0nDc34x3mS3FpgRDI5K
 zFgRFyedIKPBShVwqTsSx954w28pX91mIQ8M0n0ja7s4j2YQroY3x4ePl6Htp4ldpA
 rCbnI6DVs/2yA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F/ExVtwl
Subject: Re: [Buildroot] [PATCH 1/2] package/zchunk: add ZCHUNK_CPE_ID_VENDOR
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-10-28 17:34 +0200, Fabrice Fontaine spake thusly:
> cpe:2.3:a:zchunk:zchunk is a valid CPE identifier for this package:
> 
>   https://nvd.nist.gov/products/cpe/detail/480C0B83-3109-49EE-9E06-7866A54878CA
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/zchunk/zchunk.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/zchunk/zchunk.mk b/package/zchunk/zchunk.mk
> index fc91f90431..2acdaba3a1 100644
> --- a/package/zchunk/zchunk.mk
> +++ b/package/zchunk/zchunk.mk
> @@ -8,6 +8,7 @@ ZCHUNK_VERSION = 1.2.2
>  ZCHUNK_SITE = $(call github,zchunk,zchunk,$(ZCHUNK_VERSION))
>  ZCHUNK_LICENSE = BSD-2-Clause
>  ZCHUNK_LICENSE_FILES = LICENSE
> +ZCHUNK_CPE_ID_VENDOR = zchunk
>  ZCHUNK_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
> -- 
> 2.42.0
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939B1C02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 18:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 345D0412DE;
	Mon,  3 Feb 2025 18:22:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5DrxQFkbV_b6; Mon,  3 Feb 2025 18:22:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6F5240784
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6F5240784;
	Mon,  3 Feb 2025 18:22:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4018D185
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:22:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2D07580574
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f5hGJ7SlWX1l for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 18:22:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42CAF81137
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42CAF81137
Received: from mail.tkos.co.il (golan.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42CAF81137
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 18:22:21 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 2703D440907;
 Mon,  3 Feb 2025 20:17:07 +0200 (IST)
To: Thomas Bonnefille via buildroot <buildroot@buildroot.org>
Cc: Thomas Bonnefille <thomas.bonnefille@bootlin.com>,  Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>,  =?utf-8?Q?Miqu=C3=A8l?= Raynal
 <miquel.raynal@bootlin.com>,  Semyon Kolganov <semenak94@mail.ru>
In-Reply-To: <20250203-repair_mpir-v1-1-db848d68b586@bootlin.com> (Thomas
 Bonnefille via buildroot's message of "Mon, 03 Feb 2025 19:14:01
 +0100")
References: <20250203-repair_mpir-v1-1-db848d68b586@bootlin.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Mon, 03 Feb 2025 20:22:18 +0200
Message-ID: <87y0ymyjl1.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1738606627;
 bh=wFERliiMfEOakwVNUd1bhiTBvZEq3GbXzVyWPHQnFGA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=AVEAyXCNSQQ2+ceeIKLiq2v/lwzx426iCHPN78nkA9spE7tCSCz/Mj2Dx22UumbQi
 k2ns1VJKrHRdL/gKi3MaSVAynlP8gGEhthCvGGGMAkULygnnTKlguyxcKQwyPMhRJi
 /U+loKCww74et1HZdum8uQKJZCTbBvp4gDobl/U2F3IFRVpUWyu4aZXV3P1nnrC0EA
 HCNxKEn62zehyaTjC9rKWZRePW76z9TCH9DFHI6/IC8wV/XFA3hGjqnZJLpNir6T00
 6FOYBzcKou1dwoKTZZBMend4/r+2ZH68ULMpqa7fNTqYrZM97/EzZmjyKMEc6fvGJe
 xPyDFYUq25NuQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=AVEAyXCN
Subject: Re: [Buildroot] [PATCH] package/mpir: replace source url
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On Mon, Feb 03 2025, Thomas Bonnefille via buildroot wrote:
> mpir.org is now offline. This commit switch mpir source URL to a mirror
> repo on Github.
> Unfortunately this repository uses the same name for one of its branch
> and a tag, so we are forced to use the exact commit sha1.
> However this repository already included in the last version, the fix
> for Xcode12, it is now no longer required as an external Buildroot
> patch.
>
> Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
> ---
>  .../0002-Fix-configure-failures-with-Xcode12.patch | 116 ---------------------
>  package/mpir/mpir.hash                             |   2 +-
>  package/mpir/mpir.mk                               |   6 +-
>  3 files changed, 4 insertions(+), 120 deletions(-)

[...]

> diff --git a/package/mpir/mpir.mk b/package/mpir/mpir.mk
> index 46cd35e4365bafbd30cc500bc975c3abeeb85c2f..c55061e1875cf995afad75519d36c9cc0da9f260 100644
> --- a/package/mpir/mpir.mk
> +++ b/package/mpir/mpir.mk
> @@ -4,15 +4,15 @@
>  #
>  ################################################################################
>  
> -MPIR_VERSION = 3.0.0
> -MPIR_SITE = http://www.mpir.org
> -MPIR_SOURCE = mpir-$(MPIR_VERSION).tar.bz2
> +MPIR_VERSION = 307663bf8b4daad22a7a593bfddf381b68920855
> +MPIR_SITE = $(call github,wbhart,mpir,$(MPIR_VERSION))
>  MPIR_LICENSE = LGPL-3.0+
>  MPIR_LICENSE_FILES = COPYING.LIB
>  MPIR_INSTALL_STAGING = YES
>  MPIR_DEPENDENCIES = gmp host-yasm
>  # 0002-Fix-configure-failures-with-Xcode12.patch
>  MPIR_AUTORECONF = YES

AUTORECONF is most likely still needed with this patch, but the comment
above is outdated since you remove the patch.

baruch

> +MPIR_CONF_ENV = MAKEINFO=true
>  
>  ifeq ($(BR2_MIPS_NABI32),y)
>  MPIR_CONF_OPTS += ABI=n32
>
> ---
> base-commit: d5b3795e92727c6565901cddf0c0f17c7854df56
> change-id: 20250203-repair_mpir-f83c6d03fad9

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

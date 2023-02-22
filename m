Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF5CC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 15:37:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B14C4415AE;
	Wed, 22 Feb 2023 15:37:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B14C4415AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8FXpLdMhzqDj; Wed, 22 Feb 2023 15:37:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D338B415AD;
	Wed, 22 Feb 2023 15:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D338B415AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4005A1BF3BE
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19A4F82131
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 15:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19A4F82131
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O2-YCE0WWLII for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 15:37:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63EC182130
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63EC182130
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 15:37:26 +0000 (UTC)
Received: from [172.25.4.63] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UrBMp3Gq6doL0UrBMp6OWc; Wed, 22 Feb 2023 16:37:24 +0100
Message-ID: <b0c85d89-b51d-0c73-c6ea-7a09834d0827@benettiengineering.com>
Date: Wed, 22 Feb 2023 16:37:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <20230208230721.3269610-1-giulio.benetti@benettiengineering.com>
 <20230208230721.3269610-3-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230208230721.3269610-3-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfLgyAqx/Pce8jDPOOt6opRVqgfvq0hQNC895dGt+E+sG5y7+mfx2gFPBEI2jVr/dX3XuijCXSmubabaJU/LTViglb2MVmTXUigvWPRF+AVWqFAFnRsC/
 Bsgu8nsu2fA5iX3O9QGmQFCleWARUbV7kjLP74hXOzHyXbxkSa8X4eu6rEVjN4WvkUXSOQagL/Cfcc7i40GdS+Bk/AQvRKJBoGVa3IAKXurMybhONzI4ZxdT
 eWcQy6wx7qrrcrtXNgHrMA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677080244; bh=rP5fVuny5E7IWUq0cGZdYgT1RMCWherHaBAWBJPLpoc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=RdQDO/kpf9r4LLd5M0k9Jbc2wGmVRRZ4kuVCwJiv304wC/ipDXHd36BFT345Rgf5z
 SuXSo9dxd6EYEDv43qXv81p+kMzTztMpXvYIVYIhxMkGSeZWIUtCroIqCNoiyjEM6+
 kDBCOjeGsZL3qLJnObvcruyeV0Eb4Otq+74k9WIRRKEEpV1fbbvq2yVcebTc8zuzqT
 am0rgBG4M5DxgSTKGAlVX5JKRe0ijUnWAzaWtpZkteXkHi/uwZwBlMKowgeSq4AdoX
 4NePJRJlurrj8NZLs1VJk0e7piePcBr1C37rwYXxcLyljwlKz9GX6NzTvZutT93mgY
 181DSBFrUHAzg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=RdQDO/kp
Subject: Re: [Buildroot] [PATCH 2/2] package/harfbuzz: bump to version 6.0.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch is superseded by this one:
https://patchwork.ozlabs.org/project/buildroot/patch/20230222145059.1939094-1-giulio.benetti@benettiengineering.com/

Best regards
-- 
CEO/CTO@Benetti Engineering sas

On 09/02/23 00:07, Giulio Benetti wrote:
> Since the major release changed all the packages that have direct
> dependency to harfbuzz has been succesfully built:
> - efl
> - libass
> - mupdf
> - pango
> - qt5base
> - qt5webengine
> - qt6base
> - sdl2_ttf
> - supertuxkart
> - vlc
> - webkitgtk
> - wpewebkit
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/harfbuzz/harfbuzz.hash | 2 +-
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index 9489f25c6a..faae7b91e3 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2ae6b4434d  harfbuzz-5.3.1.tar.xz
> +sha256  1d1010a1751d076d5291e433c138502a794d679a7498d1268ee21e2d4a140eb4  harfbuzz-6.0.0.tar.xz
>   sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index b0112168e1..02fe4ecec3 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 5.3.1
> +HARFBUZZ_VERSION = 6.0.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

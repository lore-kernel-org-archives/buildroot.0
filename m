Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902C5C61DA4
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 14:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 421964107F;
	Wed, 22 Feb 2023 14:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 421964107F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k3t-J3_1_aCy; Wed, 22 Feb 2023 14:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6186941597;
	Wed, 22 Feb 2023 14:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6186941597
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 449D11BF589
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 150F641081
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 14:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 150F641081
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Et_GyJEOyMsk for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 14:52:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C3A840278
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C3A840278
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 14:52:24 +0000 (UTC)
Received: from [172.25.4.63] ([151.79.164.54])
 by Aruba Outgoing Smtp  with ESMTPSA
 id UqTmp2l5xdoL0UqTmp62Sd; Wed, 22 Feb 2023 15:52:23 +0100
Message-ID: <bb3ac3c3-a45a-d405-be1b-42827dc2d42c@benettiengineering.com>
Date: Wed, 22 Feb 2023 15:52:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: buildroot@buildroot.org
References: <20230222145059.1939094-1-giulio.benetti@benettiengineering.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20230222145059.1939094-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfIvxdgaEm76ValCyePkXE4SsCNiVIS9v+vztjCy9RmjsODCZPWIDvW5Kl6ydWHTUeBnQPb3wHuf7DtVBsLyg4L1VhxI5fUoe5EKrjqwccQJfsw+qxmzh
 jWSmUkVNa8xz3+O3tR7bysthhDfflz6gV7DhAyv/TD6RDr3Dei5PBIARBm+BZNsdWPHTOTryjnzDcdXLDEAatQlfDSIGBFMIxcKs3aY2CdqVHPSfPHMOz0ER
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677077543; bh=qCqf4IFOabTulnSUE1JfBOY/wdFTk8CVNOUkRkVDRq0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Ql2p8+6DC4GyaOhdLRT0B3MgYL/7TXTdLNzvakabdRvOIBb4dQ+M2I5NyILRpvqtt
 kEwj+9CnROF3BcHBQhnWNmZPMDCvHPnZQIzv9rnWpcChch2GrugvwD57HWzOpCkS4a
 AL60B1o5SJa5jWGeidtbD3XRpi5VDkQpwC1vfNE1zOcGEuZqq6ewG35k8v3q6jtGWo
 ndtXulRQ4Tpsz44nmMcO4VdcMarcUOhFVI/HltsYJa6T1CZZtjYQBmSxUwbVeLhofq
 Dct8BVYNVrDXmYQLUpWRuexSYUoWpn8ICuSbUZGsXxM5SyQX7SwaWUiThFjifYAals
 FEVwJUM4BKaoA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Ql2p8+6D
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 7.0.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pardon, this is for-next

Best regards
-- 
CEO/CTO@Benetti Engineering sas

On 22/02/23 15:50, Giulio Benetti wrote:
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
> index 9489f25c6a..eee48c0b68 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  4a6ce097b75a8121facc4ba83b5b083bfec657f45b003cd5a3424f2ae6b4434d  harfbuzz-5.3.1.tar.xz
> +sha256  2cf4d3d8f225007511990a36a34195f0d6562ca56df0a8b0885b382837948199  harfbuzz-7.0.1.tar.xz
>   sha256  4345e1735f8bc6d812fed5180cabb5a5e88a4109d332652f2a45c13cfa5ee692  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index b0112168e1..f8724793a9 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 5.3.1
> +HARFBUZZ_VERSION = 7.0.1
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

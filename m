Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C7E6C5AE59
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCC7A83B64;
	Sat, 31 May 2025 16:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i1iIbFCgAcct; Sat, 31 May 2025 16:54:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D5EC83B9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D5EC83B9F;
	Sat, 31 May 2025 16:54:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 94396127
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 915D96064E
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:54:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q2p52XduSmEn for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:54:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EF48A60640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF48A60640
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF48A60640
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:54:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4412F1C00B1; Sat, 31 May 2025 18:54:15 +0200 (CEST)
Message-ID: <5211d61e-228e-4c82-b268-5bdf3f9c2116@rnout.be>
Date: Sat, 31 May 2025 18:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Vincent Fazio <vfazio@gmail.com>, buildroot@buildroot.org
References: <20250517024045.625622-1-vfazio@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250517024045.625622-1-vfazio@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710455; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=V763gGkVNOH++axFe+pI3bnSMWyzHEY3oDUWtrvi5e0=;
 b=CIe1h0NGAlTEXm//qYH6V/ysKjDUZbtlalpD9x4yMcqx/3blb6lveKMYFlqVqn4afHPH65
 bc3jalAmHCLxVoNuXKNTnwW6vyPlzL9Qyci9VotbtlZRtFvM80NwxEE+h0r3vc6g9eX1AZ
 gR7iJJ+LXp7g/igUV219nIhoRufhDF/cFY2er83PQL4vqt+Mb8bfjrVWiLI7FBWeGqrACO
 e26JGpaGoFtvVI/8JHq5FsQA3otzaPdHyNxOlStukWIE5qcDEnvesbJ7s9iq7iVXyXusv4
 Xr2Idy3wKZCk2tyOmKky+kqKSUcJB+JmsR5EaZfCDVoSdTCikrAcUju6Z1GfYw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=CIe1h0NG
Subject: Re: [Buildroot] [PATCH] package/m4: bump to 1.4.20
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 17/05/2025 04:40, Vincent Fazio wrote:
> The new version bundles an updated gnulib that includes support for
> -std=c23 which is the default for gcc 15.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/m4/m4.hash |  2 +-
>   package/m4/m4.mk   | 12 +-----------
>   2 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/package/m4/m4.hash b/package/m4/m4.hash
> index a81f4fab9c..a5b8456cc2 100644
> --- a/package/m4/m4.hash
> +++ b/package/m4/m4.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated after checking pgp signature
> -sha256  63aede5c6d33b6d9b13511cd0be2cac046f2e70fd0a07aa9573a04a82783af96  m4-1.4.19.tar.xz
> +sha256  e236ea3a1ccf5f6c270b1c4bb60726f371fa49459a8eaaebc90b216b328daf2b  m4-1.4.20.tar.xz
>   # License files, locally calculated
>   sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
> diff --git a/package/m4/m4.mk b/package/m4/m4.mk
> index f5e1e27ad8..396c2bbee2 100644
> --- a/package/m4/m4.mk
> +++ b/package/m4/m4.mk
> @@ -4,20 +4,10 @@
>   #
>   ################################################################################
>   
> -M4_VERSION = 1.4.19
> +M4_VERSION = 1.4.20
>   M4_SOURCE = m4-$(M4_VERSION).tar.xz
>   M4_SITE = $(BR2_GNU_MIRROR)/m4
>   M4_LICENSE = GPL-3.0+
>   M4_LICENSE_FILES = COPYING
>   
> -# gcc-15 defaults to -std=gnu23 which is incorrectly detected and
> -# generates build failures in the gnulib copy included in
> -# m4-1.4.19. We workaround this by forcing the previous gcc default
> -# standard, which is -std=gnu17 only when host gcc is >= 15. This
> -# workaround can be removed when m4 will be updated to a version
> -# including a fix for gcc-15.
> -ifeq ($(BR2_HOST_GCC_AT_LEAST_15),y)
> -HOST_M4_CONF_ENV = CFLAGS="$(HOST_CFLAGS) -std=gnu17"
> -endif
> -
>   $(eval $(host-autotools-package))

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

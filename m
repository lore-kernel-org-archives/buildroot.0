Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1331C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70BC360AD0;
	Sun, 18 May 2025 14:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChjVNFDtd5eg; Sun, 18 May 2025 14:39:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CC5B608D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CC5B608D9;
	Sun, 18 May 2025 14:39:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 378861BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DAE581EB7
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FW98JIvU0o1q for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:39:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2F8F981EB6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2F8F981EB6
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F8F981EB6
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:39:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 544B01C0FC0; Sun, 18 May 2025 16:39:29 +0200 (CEST)
Message-ID: <b90b7e1d-e7f1-4d50-9522-4dd69d7cf4be@rnout.be>
Date: Sun, 18 May 2025 16:39:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20250309083216.824179-1-bernd@kuhls.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250309083216.824179-1-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747579169; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=5xA1YRxld2qGVtBMF4dubSw0ToWbzfMgufec0oUs8+k=;
 b=DVV4bsYPxJitBV5561iKKn9BU+ny+WqqyFN0Ks2GEOb641YlV2stdCsUe2Q4wFpEanvRtg
 fOuJj2By7s23ejxh4iu+p47eFBWggk4bE1OsVvHxGL7Mdzq82J933P3ESHlWAV+RojHdE6
 oiSbmJaG7hAkDj/HUJIkUgmdLujjlnOSBEA/REEbJogSZQaEFnYD9FDjekd1+CII8rMrxB
 2988yhhRAlLzPp0ngKuW46fPI9SN/fj7/cmmaEDpvAmXNZHRgzMkdNnRUFjQ1oEFtI6goS
 LU0fqL1vgYgV6JbXzYpyaTI8I8FmoG/Do44ECVz81UPOzPfKAEZDlMoTD8F3Vg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=DVV4bsYP
Subject: Re: [Buildroot] [PATCH/next v2 1/1] package/dropbear: bump version
 to 2025.87
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



On 09/03/2025 09:32, Bernd Kuhls wrote:
> Changelog: https://matt.ucc.asn.au/dropbear/CHANGES
> 
> Upstream disabled sha1 by default:
> https://github.com/mkj/dropbear/commit/f3465a34eb4007ca3e45044ebdf863842e0346d5
> 
> Add the options to DROPBEAR_ENABLE_LEGACY_CRYPTO hook.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> v2: optionally enable sha1 (Baruch)
> 
>   package/dropbear/dropbear.hash | 2 +-
>   package/dropbear/dropbear.mk   | 5 ++++-
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/package/dropbear/dropbear.hash b/package/dropbear/dropbear.hash
> index cf2dd18d61..777910da15 100644
> --- a/package/dropbear/dropbear.hash
> +++ b/package/dropbear/dropbear.hash
> @@ -1,5 +1,5 @@
>   # From https://matt.ucc.asn.au/dropbear/releases/SHA256SUM.asc
> -sha256  e78936dffc395f2e0db099321d6be659190966b99712b55c530dd0a1822e0a5e  dropbear-2024.86.tar.bz2
> +sha256  738b7f358547f0c64c3e1a56bbc5ef98d34d9ec6adf9ccdf01dc0bf2caa2bc8d  dropbear-2025.87.tar.bz2
>   
>   # License file, locally computed
>   sha256  a99ce657d790b761c132ee7e0de18edb437ae6361e536d991c6a12f36e770445  LICENSE
> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
> index e043893aa1..b0f5dc7afe 100644
> --- a/package/dropbear/dropbear.mk
> +++ b/package/dropbear/dropbear.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -DROPBEAR_VERSION = 2024.86
> +DROPBEAR_VERSION = 2025.87
>   DROPBEAR_SITE = https://matt.ucc.asn.au/dropbear/releases
>   DROPBEAR_SOURCE = dropbear-$(DROPBEAR_VERSION).tar.bz2
>   DROPBEAR_LICENSE = MIT, BSD-2-Clause, Public domain
> @@ -69,6 +69,9 @@ define DROPBEAR_ENABLE_LEGACY_CRYPTO
>   	echo '#define DROPBEAR_SHA1_96_HMAC 1'          >> $(@D)/localoptions.h
>   	echo '#define DROPBEAR_DH_GROUP1 1'             >> $(@D)/localoptions.h
>   	echo '#define DROPBEAR_DSS 1'                   >> $(@D)/localoptions.h
> +	echo '#define DROPBEAR_SHA1_HMAC 1'             >> $(@D)/localoptions.h
> +	echo '#define DROPBEAR_RSA_SHA1 1'              >> $(@D)/localoptions.h
> +	echo '#define DROPBEAR_DH_GROUP14_SHA1 1'       >> $(@D)/localoptions.h
>   endef
>   DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_ENABLE_LEGACY_CRYPTO
>   endif

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

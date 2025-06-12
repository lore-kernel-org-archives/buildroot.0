Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FF1BC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CB0A83BEC;
	Thu, 12 Jun 2025 20:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P_kAT1iL_5U3; Thu, 12 Jun 2025 20:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80597839E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80597839E9;
	Thu, 12 Jun 2025 20:06:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7836A183
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 692E2408D0
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X-AkBTvsc4_v for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9ADB840800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9ADB840800
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9ADB840800
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:06:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D40CD1C107D; Thu, 12 Jun 2025 22:06:33 +0200 (CEST)
Message-ID: <463c57fa-3981-45f4-97da-bea62bb32c45@rnout.be>
Date: Thu, 12 Jun 2025 22:06:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Petr Vorel <petr.vorel@gmail.com>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
References: <20250602172812.512003-1-petr.vorel@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250602172812.512003-1-petr.vorel@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758794; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=cydb5aIWn6ImFLfpEGIXEciIUnd8VcDv5p3WOEzBBfs=;
 b=hN6/PZWcD8nJ92aF3dpyjWTWfpl/Ps0byTSKYUtW17aPu6kKSML5ZFGh5WpyRMkt045RpJ
 s3Uweor57JHI2UX40GagovL5xYfVWkfjfFffnGsP8UMCJo8XQg0UQk7yHFkRt/yy62gZwu
 +xF8RWo9vTCSNkv0GS7fR84w/r6Z+VSFLZKkTGAn7HIViJxjWIlpGrCmhyXj4DsNxdRcmL
 fKvjUUOC5585ZqiIcg1jcm+t4dD4XAogyrfGY91UElR9woh2cBzo7gbFDjmew5gqIgcvxE
 p7UzSCrSduM9aOYTSdpf0xBJg8qe2OA/SCJIU4xiTKDbdSYzi8bOC9u8owq+4g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=hN6/PZWc
Subject: Re: [Buildroot] [PATCH 1/1] package/iputils: bump version to
 20250602
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



On 02/06/2025 19:28, Petr Vorel wrote:
> https://github.com/iputils/iputils/releases/tag/20250602
> 
> Security release, fixes CVE-2025-47268 and CVE-2025-48964.
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> At least minimal test:
> bootlin-armv5-uclibc [1/6]: OK
> 
> (continue testing)
> 
> Kind regards,
> Petr
> 
>   package/iputils/iputils.hash | 4 ++--
>   package/iputils/iputils.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/iputils/iputils.hash b/package/iputils/iputils.hash
> index 6baf433dcb..daa5f81a85 100644
> --- a/package/iputils/iputils.hash
> +++ b/package/iputils/iputils.hash
> @@ -1,5 +1,5 @@
> -# https://github.com/iputils/iputils/releases/download/20240905/sha256sums.asc
> -sha256  599cda8e3f5f7ce4c612456ab1101369da8f79aa0f83c8e877290a1c7bb56010  iputils-20240905.tar.gz
> +# https://github.com/iputils/iputils/releases/download/20250602/sha256sums.asc
> +sha256  178f316c3f102f7c7445dee8bb851838f11214a68b3d5d4788972d8b35dcbbe5  iputils-20250602.tar.gz
>   # Locally computed
>   sha256  2c9f29d982c48665c30b3adaf400c048988fd256eb91c691e351eb3b6a8b2036  LICENSE
>   sha256  9acc4bc871a4742550158e3696dcb381953172ef808d04ca248184f9f6322712  Documentation/LICENSE.BSD3
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index ec8c24e4e0..391f0e1938 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -IPUTILS_VERSION = 20240905
> +IPUTILS_VERSION = 20250602
>   IPUTILS_SITE = https://github.com/iputils/iputils/releases/download/$(IPUTILS_VERSION)
>   IPUTILS_LICENSE = GPL-2.0+, BSD-3-Clause
>   IPUTILS_LICENSE_FILES = LICENSE Documentation/LICENSE.BSD3 Documentation/LICENSE.GPL2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

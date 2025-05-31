Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A96C5B549
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 16:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BD0283B78;
	Sat, 31 May 2025 16:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A0KY05e9kp1l; Sat, 31 May 2025 16:53:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BB9383B76
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BB9383B76;
	Sat, 31 May 2025 16:53:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 52B11235
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:53:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3945A401CB
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:53:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioVNE8On6CMJ for <buildroot@buildroot.org>;
 Sat, 31 May 2025 16:53:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5B17B40068
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B17B40068
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5B17B40068
 for <buildroot@buildroot.org>; Sat, 31 May 2025 16:53:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 64FEF1C00DB; Sat, 31 May 2025 18:53:32 +0200 (CEST)
Message-ID: <95c3676f-3cd6-4cc8-a03b-ca7e4057c352@rnout.be>
Date: Sat, 31 May 2025 18:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Michael Nosthoff <buildroot@heine.tech>, buildroot@buildroot.org
References: <20250516112453.794405-2-buildroot@heine.tech>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250516112453.794405-2-buildroot@heine.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1748710412; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=knsTVDdQT3cQ3Uf++NFfI5rdb491/cmGA6x2OD0cDVo=;
 b=kUqhNSXAbN9xaw8UL+JPbXwC4gbWVwV2Ogm0pB4fi/e31VbTXwqLfw5vY8TFyrb9Iiim8w
 tpjOIfzDhxsqbdO3bQeSUyV2G/6kaASCDuEOZi/Z9aK4jh7e9BU/kn6H5L5GQeW40mMCYC
 gVc7qC1x9+qvvg9eSwGGacrStPRMMOZUKFNTv3uK0izTFw0aXFALaVAZpvt8Z+XqC91lYJ
 q7LGV8AqC5TmiXBOE1+qFzF+A93ldVHmMFqq/l/eMXzMPrhSeReaHN791jhmuk+tv+nvdp
 a66xsA76DJQaLSFARV83o6AmIL2SO4cZOCvpw8+f3K6Cw8ujI6erJtSDeymOQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kUqhNSXA
Subject: Re: [Buildroot] [PATCH] package/catch2: v3.8.1
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



On 16/05/2025 13:24, Michael Nosthoff via buildroot wrote:
> - Fixed bug where catch_discover_tests fails when no TEST_CASEs are present
> 
> release notes: https://github.com/catchorg/Catch2/releases/tag/v3.8.1
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/catch2/catch2.hash | 2 +-
>   package/catch2/catch2.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/catch2/catch2.hash b/package/catch2/catch2.hash
> index 3b203285bf..30ff1f43b3 100644
> --- a/package/catch2/catch2.hash
> +++ b/package/catch2/catch2.hash
> @@ -1,3 +1,3 @@
>   # Locally computed:
> -sha256  1ab2de20460d4641553addfdfe6acd4109d871d5531f8f519a52ea4926303087  catch2-3.8.0.tar.gz
> +sha256  18b3f70ac80fccc340d8c6ff0f339b2ae64944782f8d2fca2bd705cf47cadb79  catch2-3.8.1.tar.gz
>   sha256  c9bff75738922193e67fa726fa225535870d2aa1059f91452c411736284ad566  LICENSE.txt
> diff --git a/package/catch2/catch2.mk b/package/catch2/catch2.mk
> index 5d46fb3ffd..00d6e5bfdc 100644
> --- a/package/catch2/catch2.mk
> +++ b/package/catch2/catch2.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -CATCH2_VERSION = 3.8.0
> +CATCH2_VERSION = 3.8.1
>   CATCH2_SITE = $(call github,catchorg,Catch2,v$(CATCH2_VERSION))
>   CATCH2_INSTALL_STAGING = YES
>   CATCH2_INSTALL_TARGET = NO

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

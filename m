Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4B3606B2E4
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DvE1/aiq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 363AB407BA;
	Wed,  4 Nov 2026 21:27:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CN89aih3Q3-y; Wed,  4 Nov 2026 21:27:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4DD764040B
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793827646;
	b=V7zKmKBYUs5cte9AsBIs1zPwzoM9s3EzKd3dcdmIpVcaHipVSkkki6oSpWbF79wS4jBD
	 1foZ9l4vXNObbKQVSAfu4SH6m46/LHACuoNPODVZVOT9YZye4boKiYDH49SS7yK0RjlnG
	 bdfY9SdaJr3OYL2evtk/KKcACOb3Scof4MDuVEJR3EhzKnTSEJ1RI6UQa0WOaoGXIGmIJ
	 qdvRnhpPSJilCZX1LZG2Xg195pE8sTnF1HGmLTsXGBaAPYW99+1LpRmut6LZAq7patm8G
	 ue+A2sL3vdC7p/b1Z+s7wihP2LHKcot+fX01mKyhc1yGZP+nHgqG876WGdJLW/jdwKw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793827646;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VktyvGc+f6tulj60MjHSvqWfjy/EJxWXYoMGQc1W4b8=;
	b=mf1hNB8upvIk1zXKyt8daGlpMJ6FsnXgF0xH4gWNbmtTachKqfnugEx48U00hpAZXl49
	 9TbQ2ReMFrOfRnMnvfsNGXu/zRrfi+X6AGG6bhpTQY9ORpv/EuxQ+BApJX2tNpQGC7RlN
	 fwN67Zk7l99iLPPzPjJX0F4LdTltbJaY5hP/5pSfQgXslzsM3tuNRgb+aWur+Ea0qUyr7
	 FIvDXrPvZswheH9Dafbcq2l+5RnX9xXjd2sGoE+NAEnSaD7dLVUSdBBZka2ywqZFv/zSm
	 NlOlpvuNuXjQCDwk0eKkgYtilqF1i70p/le/j6KGaaukyzxoClnexvjzh9rQ5llcN4g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793827646;
	bh=VktyvGc+f6tulj60MjHSvqWfjy/EJxWXYoMGQc1W4b8=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DvE1/aiq4fUZslVJ2PfKK3pb9JVv+K81RLWiYkBApNnq6msrZ2bdtEQtw9qCGxU7W
	 pwCEZedN4UOsCQgoY6PEQF4PSB2TiL9Zv5DOoTx+St50sLmB9BwGVFbGxfVfQD6Jup
	 VG9+m6uQLXTKzndu2gQlk6doINLCUXxJFWScpNYIqGEIjlvCLVKjHYhBWl+QExNVyf
	 fFsm0DniGcXJYX84cNC2qXMV4B7mGf3WtdNYBvZfT6KJ0p4HnT7T4JYum7vW88CxYT
	 mQwuo9fQnMuY/iFXdIenjp8eeFDSTNR3oiCmQs24I7cF5vY7sf+OuNtAwpUo+CaGL3
	 zHQRMne/6fy2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DD764040B;
	Wed,  4 Nov 2026 21:27:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8701C362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78E72810F9
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:27:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G72CLSVQGwuL for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:27:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 93E7D810E8
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93E7D810E8
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:27:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 99E3C1A03BA;
 Wed,  4 Nov 2026 21:27:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6AAC35FE8F;
 Wed,  4 Nov 2026 21:27:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7FEB210329231; Wed,  4 Nov 2026 22:27:15 +0100 (CET)
Date: Wed, 4 Nov 2026 22:27:14 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Angelo Compagnucci <angelo.compagnucci@gmail.com>
Message-ID: <auujHIM_rYvtwAIh@windsurf>
References: <20261103100549.4129021-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261103100549.4129021-1-giulio.benetti@benettiengineering.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/rtl8723ds: fix build failure up to
 Linux 7.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 11:05:49AM +0100, Giulio Benetti wrote:
> Drop local patch already upstreamed.

Your patch (below) doesn't drop any local patch. Should it?

Thanks!

Thomas

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rtl8723ds/rtl8723ds.hash | 2 +-
>  package/rtl8723ds/rtl8723ds.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
> index 580f5d09f6..8557414e0e 100644
> --- a/package/rtl8723ds/rtl8723ds.hash
> +++ b/package/rtl8723ds/rtl8723ds.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  a04bc28cbaead30aca2894633ffa93d4bf0bf407a8c5b7120dd9832ceaf0310e  rtl8723ds-122a574f780da32bb0de760bf089a3a9ec1e8f87.tar.gz
> +sha256  e0cd998331f37d4ec5b18df695638ff9f3c2c564bcea936b55ef4b40d9c4613d  rtl8723ds-83191afe47af29d622701bab24020e2dc8b0fc48.tar.gz
>  sha256  cd5c66af63b509ccd75ec85fee41b6e5cbb77cd6bf9392a54900acc0f02be4a6  COPYING
> diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
> index d8072f14bc..8dfda059f3 100644
> --- a/package/rtl8723ds/rtl8723ds.mk
> +++ b/package/rtl8723ds/rtl8723ds.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RTL8723DS_VERSION = 122a574f780da32bb0de760bf089a3a9ec1e8f87
> +RTL8723DS_VERSION = 83191afe47af29d622701bab24020e2dc8b0fc48
>  RTL8723DS_SITE = $(call github,benetti-engineering,rtl8723ds,$(RTL8723DS_VERSION))
>  RTL8723DS_LICENSE = GPL-2.0
>  RTL8723DS_LICENSE_FILES = COPYING
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E6BD116EA
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 20:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AE4A616EA;
	Thu, 27 Nov 2025 20:02:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KStELmGT88av; Thu, 27 Nov 2025 20:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A09960D97
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A09960D97;
	Thu, 27 Nov 2025 20:02:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F160708
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 316F28440C
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jw5MsDPBhVoG for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 20:02:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D43384404
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D43384404
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D43384404
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 20:02:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 462DDB979CA9; Thu, 27 Nov 2025 21:02:02 +0100 (CET)
Message-ID: <9a2e059a-11ba-4cf5-9fd9-8de1d8f769a4@rnout.be>
Date: Thu, 27 Nov 2025 21:02:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20251117074452.331157-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251117074452.331157-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273722; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=vNcL2rEM7iwCz9gmCGz2YHohA34iMfr/dvfBCh4qTKA=;
 b=FMZAfNyIrIolmi8Cb4w22HFiwcSrbJierQOacZPUp2Qn8l2LtDii96fY0hws3KK9D4at8i
 pnzY6nezMgLLQ1grOWBL80shtTyCQDJ4soSkKW60AE+lN/uGZRzMno57FTYZGLi/nSHbvc
 2ng3XLlJkCTfXl8MSRIDzgFyYEOVT5QVWXtR5OpR72K5Tfd6LRS0RtPZdkHWJ+zkrU8BNS
 puLt69chQjSXx13NWEP7H8C4gBnbq+1kcOlEogW7K9lR2TNTGZcT2ENbBqxxAJXQVP+FV3
 G/GRcqXsM2f+neZ6TtVUF/1S/vXQ82gdtUNjG51lj8ZQ9P6oIj6hfuHLHXx4qA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=FMZAfNyI
Subject: Re: [Buildroot] [PATCH] package/luksmeta: security bump to version
 10
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



On 17/11/2025 08:44, Peter Korsgaard wrote:
> Fixes the following security issue:
> 
> CVE-2025-11568: A  data corruption vulnerability has been identified in the
> luksmeta utility when used with the LUKS1 disk encryption format.
> 
> https://github.com/advisories/GHSA-pvmm-7c2r-wmp4
> https://github.com/latchset/luksmeta/releases/tag/v10
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   package/luksmeta/luksmeta.hash | 2 +-
>   package/luksmeta/luksmeta.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/luksmeta/luksmeta.hash b/package/luksmeta/luksmeta.hash
> index b367f29a5c..5936fb56f3 100644
> --- a/package/luksmeta/luksmeta.hash
> +++ b/package/luksmeta/luksmeta.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  2ca0c35b551b331ba1444fc9d36e8c48ff8cae53dd4e6155b028e8904edc202a  luksmeta-9.tar.bz2
> +sha256  a842538ba39680c8319c41dac0bcc082fe40fb43342561761925c0daa1a48f28  luksmeta-10.tar.bz2
>   sha256  4b72eb6b5a336cd3ec837cc2d6347c23bf7574168db6b4802267700b93021abf  COPYING
> diff --git a/package/luksmeta/luksmeta.mk b/package/luksmeta/luksmeta.mk
> index 129713aec8..bfbda9fb36 100644
> --- a/package/luksmeta/luksmeta.mk
> +++ b/package/luksmeta/luksmeta.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -LUKSMETA_VERSION = 9
> +LUKSMETA_VERSION = 10
>   LUKSMETA_SOURCE = luksmeta-$(LUKSMETA_VERSION).tar.bz2
>   LUKSMETA_SITE = https://github.com/latchset/luksmeta/releases/download/v$(LUKSMETA_VERSION)
>   LUKSMETA_LICENSE = LGPL-2.1+

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3ECEC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 11:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 962DA6120C;
	Fri, 16 May 2025 11:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AS7NFPtuXqhh; Fri, 16 May 2025 11:03:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCD8260BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD8260BB8;
	Fri, 16 May 2025 11:03:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C231913D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8AE081280
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hi1oVecb5Wy7 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 11:03:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE9BC81099
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE9BC81099
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE9BC81099
 for <buildroot@buildroot.org>; Fri, 16 May 2025 11:03:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0E9E91C0FE9; Fri, 16 May 2025 13:03:05 +0200 (CEST)
Message-ID: <62620518-d9c2-47aa-9905-d67c355fb184@rnout.be>
Date: Fri, 16 May 2025 13:03:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250320223549.138974-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250320223549.138974-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393385; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=baz5IB1HHCHAL46/+0/ddvigbs0LxzjJL72IG32C7aA=;
 b=GzOzdOA0ZNYzbszqM1R1pO+1tlOxKYAlbWgN4icftKZEs1UvZURaOSyez2BbBExq6uL2Iu
 O4vGWwWFnorD578v4DGXYVULNXnpnhwBQ/gTwWetZ4TQ0sfnOnDlBlAps9wuovjKtrFpce
 jDEXPlHKU1J+iMaXE/VeZT4oPn1g2qDHpGfkh9zSZly2A71OSaJYaRbVsp/5TGuqgBm/UY
 MLQ8kNNCoayoVhTgPEBgVq+dZ6E9xhPqPmgrvfaSA07OaQBPc78yq5NhqGXE19Q9vMf4fJ
 YJOnQAXOOFI5e0YCpijl4+JIj0jrJaFIP4otlfaYvBEEppeut1k+DE8VF8jKYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=GzOzdOA0
Subject: Re: [Buildroot] [PATCH 1/1] Config.in: introduce
 BR2_HOST_GCC_AT_LEAST_{12..15}
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



On 20/03/2025 23:35, Julien Olivain wrote:
> Fedora 42 is planned to be released on 2025-04-22 [1].
> It is also planned to include the upcoming gcc 15 release.
> Gcc 15 is changing the default C language from -std=gnu17
> to -std=gnu23 [2].
> 
> This change is expected to possibly introduce build failures [3].
> In order to be prepared to fix those, this commit introduces the
> BR2_HOST_GCC_AT_LEAST_{12..15} symbols.
> 
> [1] https://fedorapeople.org/groups/schedule/f-42/f-42-key-tasks.html
> [2] https://gcc.gnu.org/gcc-15/changes.html#c
> [3] https://savannah.gnu.org/support/?111150
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   Config.in | 20 ++++++++++++++++++++
>   Makefile  |  2 +-
>   2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index a543091d4f..d730f2034b 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -74,6 +74,26 @@ config BR2_HOST_GCC_AT_LEAST_11
>   	default y if BR2_HOST_GCC_VERSION = "11"
>   	select BR2_HOST_GCC_AT_LEAST_10
>   
> +config BR2_HOST_GCC_AT_LEAST_12
> +	bool
> +	default y if BR2_HOST_GCC_VERSION = "12"
> +	select BR2_HOST_GCC_AT_LEAST_11
> +
> +config BR2_HOST_GCC_AT_LEAST_13
> +	bool
> +	default y if BR2_HOST_GCC_VERSION = "13"
> +	select BR2_HOST_GCC_AT_LEAST_12
> +
> +config BR2_HOST_GCC_AT_LEAST_14
> +	bool
> +	default y if BR2_HOST_GCC_VERSION = "14"
> +	select BR2_HOST_GCC_AT_LEAST_13
> +
> +config BR2_HOST_GCC_AT_LEAST_15
> +	bool
> +	default y if BR2_HOST_GCC_VERSION = "15"
> +	select BR2_HOST_GCC_AT_LEAST_14
> +
>   # When adding new entries above, be sure to update
>   # the HOSTCC_MAX_VERSION variable in the Makefile.
>   
> diff --git a/Makefile b/Makefile
> index 5bf5abfe3b..411e1de515 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -353,7 +353,7 @@ export HOSTARCH := $(shell LC_ALL=C $(HOSTCC_NOCCACHE) -v 2>&1 | \
>   
>   # When adding a new host gcc version in Config.in,
>   # update the HOSTCC_MAX_VERSION variable:
> -HOSTCC_MAX_VERSION := 11
> +HOSTCC_MAX_VERSION := 15
>   
>   HOSTCC_VERSION := $(shell V=$$($(HOSTCC_NOCCACHE) --version | \
>   	sed -n -r 's/^.* ([0-9]*)\.([0-9]*)\.([0-9]*)[ ]*.*/\1 \2/p'); \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

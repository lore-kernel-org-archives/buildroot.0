Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97903C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:54:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DF464194D;
	Fri, 16 May 2025 10:54:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q3jwDKQnp-nM; Fri, 16 May 2025 10:54:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86E524198D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86E524198D;
	Fri, 16 May 2025 10:54:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C3C51AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 726D883C43
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytzrYjg0DaJf for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B8D6783C71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8D6783C71
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B8D6783C71
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:54:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id AB1231C0FC0; Fri, 16 May 2025 12:54:49 +0200 (CEST)
Message-ID: <1ce780e3-19b5-4416-8716-9661e03495c9@rnout.be>
Date: Fri, 16 May 2025 12:54:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20250507065253.3492905-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250507065253.3492905-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392889; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=DudxglSt8UPhAG9NvAGEtpusjgmp3OwOg9rzNipsFhk=;
 b=kRUHtWFu8kNWj+d3TkVl9VLVB+cEnQsrgA2wPrxyPYWOIFiwjbhcg7vUE9cHSROR2rLrXX
 CDHpg+qNxkLAwqAatcpj/FG60KUIDSOmtd1YcUQMtp8/cjt0xBj+W1/zYcd72lqh3l347A
 znFIrldRw5WPa4pWu6TKypV6P8v8jWq10d0LroMDeqE4X4fmYnURMhWK55MH12hyenKmqx
 SVHb16MzAx1/8jl4ojmK6SWKCDZQLSbKdy4rJXkb0dpPsyNdusmB8+wiIm4HBlNdksPjsB
 zBdwc+w2cr06eqg0I7GVlyDUSV1PQa/0zXGjmvacvtkCQzsap1jBOCxvKjo7EA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=kRUHtWFu
Subject: Re: [Buildroot] [PATCH] package/jo: bump version to 1.9
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



On 07/05/2025 08:52, Peter Korsgaard wrote:
> Mainly bugfixes (1.8 was deleted):
> 
> https://github.com/jpmens/jo/releases/tag/1.9
> https://github.com/jpmens/jo/releases/tag/1.7
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/jo/jo.hash | 2 +-
>   package/jo/jo.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/jo/jo.hash b/package/jo/jo.hash
> index efad8228a7..82cb212a83 100644
> --- a/package/jo/jo.hash
> +++ b/package/jo/jo.hash
> @@ -1,3 +1,3 @@
>   # Locally computed
> -sha256  eb15592f1ba6d5a77468a1438a20e3d21c3d63bb7d045fb3544f223340fcd1a1  jo-1.6.tar.gz
> +sha256  0195cd6f2a41103c21544e99cd9517b0bce2d2dc8cde31a34867977f8a19c79f  jo-1.9.tar.gz
>   sha256  41d8b23dc6e76731f4920b9ce42d0d4a248d243a510319e2441d174a115f35cf  COPYING
> diff --git a/package/jo/jo.mk b/package/jo/jo.mk
> index dd5dd03ddb..911d3e5f3d 100644
> --- a/package/jo/jo.mk
> +++ b/package/jo/jo.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -JO_VERSION = 1.6
> +JO_VERSION = 1.9
>   JO_SITE = https://github.com/jpmens/jo/releases/download/$(JO_VERSION)
>   JO_LICENSE = MIT (json.[ch]), GPL-2.0+ (rest)
>   JO_LICENSE_FILES = COPYING

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

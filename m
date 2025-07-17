Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81A05C83F1A
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:00:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54CA341127;
	Thu, 17 Jul 2025 20:00:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOe_vKmY5Va0; Thu, 17 Jul 2025 20:00:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88A0F410F2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88A0F410F2;
	Thu, 17 Jul 2025 20:00:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88183DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7A6C6410C1
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oO-2YoMq5abh for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:00:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DDF941115
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DDF941115
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DDF941115
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:00:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BA0BCB977AA4; Thu, 17 Jul 2025 22:00:30 +0200 (CEST)
Message-ID: <9912bd39-ba54-4010-a54a-0b384d38a535@rnout.be>
Date: Thu, 17 Jul 2025 22:00:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
References: <20250707141530.3774427-1-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250707141530.3774427-1-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752782430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=73RILkzY+Q0hyh0RzeVKjT/6S5OdP/ouJFcFbtGl5xA=;
 b=WHRmevZysKSWarlK0ZPMGW8hev5Ch8Pz6F6liugvNKmuT2rZhVJJXWn4QkwKzBV5egMk+q
 /rw/7thvnwKBClzUsYLjU5Ls1hQIFakAEiHzGCCZRmFp86AyRgoL3PVgbeTvD9VN/gHAJ3
 vLIGhfWN6NvnH14T+QviaqETBT7zwpZ6BeT01gMCMpRsK1d2cj35IyBg797H2Hu9lJfqHH
 Fi8LBj0BohbBZ15V7jH6HDqdpv1aukbBTC8kzwVN0HkxvvDyiv14ucOZoudzdIAffeFNEf
 A1lJGEjpkahJDtGHthZspt9M7G9x1iOrPNJ+wAlT+Q/JYdjthqJR2Ogs+gQNCg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=WHRmevZy
Subject: Re: [Buildroot] [PATCH] package/libconfuse: use current upstream URL
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



On 07/07/2025 16:15, Peter Korsgaard wrote:
> https://github.com/martinh/libconfuse/ now redirects to
> /libconfuse/libconfuse/, so use that instead in .mk and help text.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/libconfuse/Config.in     | 2 +-
>   package/libconfuse/libconfuse.mk | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libconfuse/Config.in b/package/libconfuse/Config.in
> index b96b8f2811..ee55409010 100644
> --- a/package/libconfuse/Config.in
> +++ b/package/libconfuse/Config.in
> @@ -8,4 +8,4 @@ config BR2_PACKAGE_LIBCONFUSE
>   	  environment variable expansion, functions and nested include
>   	  statements.
>   
> -	  https://github.com/martinh/libconfuse/
> +	  https://github.com/libconfuse/libconfuse
> diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
> index 76123a7e6b..fff684a55b 100644
> --- a/package/libconfuse/libconfuse.mk
> +++ b/package/libconfuse/libconfuse.mk
> @@ -6,7 +6,7 @@
>   
>   LIBCONFUSE_VERSION = 3.3
>   LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.xz
> -LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
> +LIBCONFUSE_SITE = https://github.com/libconfuse/libconfuse/releases/download/v$(LIBCONFUSE_VERSION)
>   LIBCONFUSE_INSTALL_STAGING = YES
>   LIBCONFUSE_CONF_OPTS = --disable-rpath
>   LIBCONFUSE_LICENSE = ISC

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

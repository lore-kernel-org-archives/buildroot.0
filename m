Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8422AC83F34
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:16:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 537BA40587;
	Thu, 17 Jul 2025 20:16:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VB3UujWjWYGO; Thu, 17 Jul 2025 20:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 816584053A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 816584053A;
	Thu, 17 Jul 2025 20:16:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E942E226
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D06D66082C
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pMiytLEsjgA0 for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:16:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F0025607DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0025607DA
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F0025607DA
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:16:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id C5F45B977AA7; Thu, 17 Jul 2025 22:16:09 +0200 (CEST)
Message-ID: <d8578236-f3a2-4096-ac30-3e278dc07d8d@rnout.be>
Date: Thu, 17 Jul 2025 22:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adrian Perez de Castro <aperez@igalia.com>, buildroot@buildroot.org
References: <20250708123001.4124948-1-aperez@igalia.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250708123001.4124948-1-aperez@igalia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1752783369; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=sMYVwwMO+HA7w1oBO8Y+p3B/EkeLXVLMBjUubSwN6P0=;
 b=E6IXEacqLVp3YXEyf2WdOEtd7J1+xhuv/jgd1uTPXsXbTE7/ISVsdCXmGhLVSl0m42VCr7
 GXwEFz8LZFP+7REcC8CGAzVsaeVa3kq52cu+XJnEzbPxojdL+PCNXX8e0bsohLS02T4EtQ
 jmKeuV5O9oOZBx3DHi24mvWmCLWraTG5qWvw274M0pHLYY3eLdwnTz2rAMeWFvStTPLMpP
 PO1qZE7mU5MhZ8N2Oa1q0yfcTZK/sAowk41JqxlKPKbSq0C6MIRPAWBeArOJw2wQQsvsyP
 LQgatO4ruL71hlJkT8RZEOTkSDURqKckE4eYrsCojMin6FoNnugPPkxx1NL5xw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=E6IXEacq
Subject: Re: [Buildroot] [PATCH 1/1] package/webkitgtk: bump to version
 2.48.3
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



On 08/07/2025 14:30, Adrian Perez de Castro wrote:
> Fixes a number of crashes. Release notes:
> 
>    https://webkitgtk.org/2025/05/28/webkitgtk2.48.3-released.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

  Applied to 2025.02.x and 2025.05.x, thanks.

  Regards,
  Arnout

> ---
>   package/webkitgtk/webkitgtk.hash | 6 +++---
>   package/webkitgtk/webkitgtk.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/webkitgtk/webkitgtk.hash b/package/webkitgtk/webkitgtk.hash
> index 82b5cb4651..6c2beb7d1d 100644
> --- a/package/webkitgtk/webkitgtk.hash
> +++ b/package/webkitgtk/webkitgtk.hash
> @@ -1,6 +1,6 @@
> -# From https://www.webkitgtk.org/releases/webkitgtk-2.48.2.tar.xz.sums
> -sha1  e1a216588ad5eaf71b548b035699319f74cbd8da  webkitgtk-2.48.2.tar.xz
> -sha256  ec58f6dfc25d3b360388e192f865068d69aab09b4d7df021f90e314d2fa54f37  webkitgtk-2.48.2.tar.xz
> +# From https://www.webkitgtk.org/releases/webkitgtk-2.48.3.tar.xz.sums
> +sha1  36faf2c30967db57175caf88cefd3d25781ae6d7  webkitgtk-2.48.3.tar.xz
> +sha256  d4dc5970f0fc6a529ff7fd67bcbfab2bbb5e91be789b2e9279640b3217a782c3  webkitgtk-2.48.3.tar.xz
>   
>   # Hashes for license files:
>   sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
> index bdfcafc58d..20332fd7d5 100644
> --- a/package/webkitgtk/webkitgtk.mk
> +++ b/package/webkitgtk/webkitgtk.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -WEBKITGTK_VERSION = 2.48.2
> +WEBKITGTK_VERSION = 2.48.3
>   WEBKITGTK_SITE = https://www.webkitgtk.org/releases
>   WEBKITGTK_SOURCE = webkitgtk-$(WEBKITGTK_VERSION).tar.xz
>   WEBKITGTK_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

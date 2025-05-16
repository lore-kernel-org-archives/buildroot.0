Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A88F4C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7059F4194B;
	Fri, 16 May 2025 10:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxK5lzf_ydnP; Fri, 16 May 2025 10:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 913474187B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 913474187B;
	Fri, 16 May 2025 10:45:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C3E613D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71A4583CFE
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjDWw5-XPdQu for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:44:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7624382BA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7624382BA1
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7624382BA1
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:44:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E6571C10FB; Fri, 16 May 2025 12:44:56 +0200 (CEST)
Message-ID: <3108fa40-263b-414c-8600-95fa94253790@rnout.be>
Date: Fri, 16 May 2025 12:44:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250428073522.126422-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250428073522.126422-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392296; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=jF8X5w0UAHQtbcw7eHvtH4JjPPBhCsX3f6259/VXP7w=;
 b=X3dqVgmb11kIvzLSGJcF/+uO10sKD/e2UopNAqkgxw1JZdIeZgrZiHc8a21/0ft5GTp/Jq
 lrR7ddZopGt8pgHulJpc3T6bb+paRORakdabt4UdhzCvzECJn2o4/lkHu/veUxCMbtOZ9I
 +UBhjFbyxgSEXEGsxxnkPO/yqXnf+KrIpmI6VsboD0UIQlJ/iDwoZuYun34tKa1d2DyO96
 3iKkFdl7V4RTSbDC/fQVuxwWKKN8BmCsrXBU7jrD1fHLB9BMJAi35maBU44mhAitzHMkgC
 OG/fLd9f/L78KpKodw4kiX3pc3PcotizrpaR0Jh1NI6PPs9hT4aA9my6Am6Z9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=X3dqVgmb
Subject: Re: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.7.1
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



On 28/04/2025 09:35, Kadambini Nema wrote:
> Changelog:
> https://github.com/libexpat/libexpat/blob/R_2_7_1/expat/Changes
> 
> Update hash of the COPYING file (year updated):
> https://github.com/libexpat/libexpat/commit/2b2a24691a9888e0f3c179b8f05cbacb19f460ef
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/expat/expat.hash | 4 ++--
>   package/expat/expat.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/expat/expat.hash b/package/expat/expat.hash
> index 4975d0f864..87bbf86e1a 100644
> --- a/package/expat/expat.hash
> +++ b/package/expat/expat.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
> -sha256  25df13dd2819e85fb27a1ce0431772b7047d72af81ae78dc26b4c6e0805f48d1  expat-2.7.0.tar.xz
> -sha256  122f2c27000472a201d337b9b31f7eb2b52d091b02857061a8880371612d9534  COPYING
> +sha256  354552544b8f99012e5062f7d570ec77f14b412a3ff5c7d8d0dae62c0d217c30  expat-2.7.1.tar.xz
> +sha256  31b15de82aa19a845156169a17a5488bf597e561b2c318d159ed583139b25e87  COPYING
> diff --git a/package/expat/expat.mk b/package/expat/expat.mk
> index 5d40133f08..51b45b01bb 100644
> --- a/package/expat/expat.mk
> +++ b/package/expat/expat.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -EXPAT_VERSION = 2.7.0
> +EXPAT_VERSION = 2.7.1
>   EXPAT_SITE = https://github.com/libexpat/libexpat/releases/download/R_$(subst .,_,$(EXPAT_VERSION))
>   EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
>   EXPAT_INSTALL_STAGING = YES

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

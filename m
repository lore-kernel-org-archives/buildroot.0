Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E35FC71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 19:57:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F06B2405CF;
	Thu, 12 Jun 2025 19:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BsA2Oo0ni4lp; Thu, 12 Jun 2025 19:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 27535406F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27535406F5;
	Thu, 12 Jun 2025 19:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 234AD1BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 202D480BBF
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rjsjVe5EZpGx for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 19:57:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3C96880BBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C96880BBC
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C96880BBC
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 19:57:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4951C1C0F87; Thu, 12 Jun 2025 21:57:42 +0200 (CEST)
Message-ID: <e8fd0ba4-9bf6-4fb7-adab-e3aea828a5e6@rnout.be>
Date: Thu, 12 Jun 2025 21:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
References: <20250526203501.126937-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250526203501.126937-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749758262; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=zpE4VyLONMpscRBB/PadxtCrfpktXh50Qz36R+Yn0hc=;
 b=SVzffBACRK1mRvJnXQ9JbGKzcIjz5Rnt6OVi3+zvKrKQmADPWTbqmk8DWFDh4HaMqteerL
 Gxp3/p0vuGFBLglu4BXPnKYfq0VjlvRJ5DnJH3TQkc0onpbspt6Zu6VFemPmAkioOr8sSS
 vJG6MVuO2Xjo67reo2rjG4PunwAnrn9F2xPYfXc6lgm691zknP+ikbsVAJIDZ8IcNwMwe1
 dQaAkDAeTYJD/iNHf5rcxTYZaff1KaKSwFpDgwg/hFcYrMTgdWQusLL4ns7YjXNTjPc1W4
 tW8IwZJeHCdaQ1iEt0RI1lSsYC5QAm3rwHuyHPCZDu6oowsRL5E5wu0ET1ECBA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=SVzffBAC
Subject: Re: [Buildroot] [PATCH 1/1] package/esp-hosted: fix legal-info
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



On 26/05/2025 22:35, Julien Olivain wrote:
> The esp-hosted package was introduced in [1] defining the variable
> ESP_HOSTED_LICENSE_FILE (singular). The name should be
> ESP_HOSTED_LICENSE_FILES (plural). This typo makes the license file
> being ignored during a "make legal-info" which shows a warning at
> the end:
> 
>      WARNING: esp-hosted-9a2312b0b: cannot save license (ESP_HOSTED_LICENSE_FILES not defined)
> 
> Fixing the variable name also reveals the license file path was
> incorrect. The "esp_hosted_ng/host/" directory prefix is missing.
> Finally, setting the correct path shows the hash was wrong (it was
> the hash of the Apache-2.0 [2] file, which corresponds to another
> unused code portion). So the license file hash is also changed to
> correspond to the correct GPL-2.0 license file.
> 
> This commit fixes all the needed esp-hosted legal-info.
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/7b2e5e6550aed4f79461919c6a59e00741eb4b11
> [2] https://github.com/espressif/esp-hosted/blob/release/ng-v1.0.4.0.0/LICENSES/Apache-2.0
> 
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/esp-hosted/esp-hosted.hash | 2 +-
>   package/esp-hosted/esp-hosted.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/esp-hosted/esp-hosted.hash b/package/esp-hosted/esp-hosted.hash
> index 8de3c00190..fee82b00e0 100644
> --- a/package/esp-hosted/esp-hosted.hash
> +++ b/package/esp-hosted/esp-hosted.hash
> @@ -1,3 +1,3 @@
>   # Locally calculated
>   sha256  66c07e2f69d8a10fb111b6df27fbe3558734d660207a54391c46eea3e12b29ee  esp-hosted-9a2312b0b2630e41bacb3091faaba489cb43b0ab.tar.gz
> -sha256  ed57d96d27be775b22f9571d3724ef84e0d0b8f24b805ec7f87a32189de19a9c  LICENSE
> +sha256  f6b78c087c3ebdf0f3c13415070dd480a3f35d8fc76f3d02180a407c1c812f79  esp_hosted_ng/host/LICENSE
> diff --git a/package/esp-hosted/esp-hosted.mk b/package/esp-hosted/esp-hosted.mk
> index 4c249eec46..475d32da43 100644
> --- a/package/esp-hosted/esp-hosted.mk
> +++ b/package/esp-hosted/esp-hosted.mk
> @@ -8,7 +8,7 @@ ESP_HOSTED_VERSION = 9a2312b0b2630e41bacb3091faaba489cb43b0ab
>   ESP_HOSTED_SITE = $(call github,espressif,esp-hosted,$(ESP_HOSTED_VERSION))
>   ESP_HOSTED_DEPENDENCIES = linux
>   ESP_HOSTED_LICENSE = GPL-2.0
> -ESP_HOSTED_LICENSE_FILE = LICENSE
> +ESP_HOSTED_LICENSE_FILES = esp_hosted_ng/host/LICENSE
>   ESP_HOSTED_MODULE_SUBDIRS = esp_hosted_ng/host
>   
>   define ESP_HOSTED_LINUX_CONFIG_FIXUPS

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

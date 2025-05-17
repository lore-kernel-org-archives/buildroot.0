Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EF3C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 09:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21EF983D22;
	Sat, 17 May 2025 09:09:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YtSbD1Y0iHdK; Sat, 17 May 2025 09:09:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4332883D03
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4332883D03;
	Sat, 17 May 2025 09:09:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 24594E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A25B83D03
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:09:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWo7YvU_Cqxg for <buildroot@buildroot.org>;
 Sat, 17 May 2025 09:09:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ED87E80F91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ED87E80F91
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ED87E80F91
 for <buildroot@buildroot.org>; Sat, 17 May 2025 09:09:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E8481C0D7A; Sat, 17 May 2025 11:09:20 +0200 (CEST)
Message-ID: <f6dab056-50bc-401e-90f0-2e45ddec206d@rnout.be>
Date: Sat, 17 May 2025 11:09:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Fiona Klute <fiona.klute@gmx.de>
References: <20250515121027.561571-1-adam.duskett@amarulasolutions.com>
 <20250515121027.561571-11-adam.duskett@amarulasolutions.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250515121027.561571-11-adam.duskett@amarulasolutions.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747472960; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=7FZWHbhd6VgyTzjbMgwcO+EMEfaawdgyjh7a/sJImPw=;
 b=SWOGcGZf7phhK7x/VrhaV4YOkhMfIfnf0c8NniNxVtOZTsrm0Nnp8zSMsTgGqq99kg0xd5
 6E/aOZftgMj7VktM2CISknkkxLIBAaKqY5EwZhRE8f09ZbsWuTRcrG/6y5MTFCkwJ218Dp
 bNnZAuh5JcKWKl0sngVWhhaaVcn/jTkJZpPS0kBjRVwOk1Q/pB6WxzaUYgzAdNWHcLiOC/
 o841RaKyWiHOJUD9HZzGbFe+rNcCXrJDBs5Y1cjx+rhvMwLGRcWq2cLprtqS2w+E/W4cYV
 axD0apdDCeO/AoUmUUIaRq7kOvRxy18TkJMyXfJ23PzVTHS9JRLUPjpxMUhy4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=SWOGcGZf
Subject: Re: [Buildroot] [PATCH 10/10] package/refpolicy: bump to version
 2.20250213
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



On 15/05/2025 14:10, Adam Duskett wrote:
>   - Add the dbus policy as a default module due to commit 523b279.
>     This commit added dbus contexts to the selinuxutil module, which makes
>     the dbus module mandatory. If the dbus module is set to no, refpolicy
>     fails to build with the following error:
> 
>     ```
>     policy/modules/system/selinuxutil.te:102:ERROR 'attribute
>     dbusd_system_bus_client is not within scope' at token ';'
>     on line 155976:
>     ```
> 
>     As a temporary solution, the dbus policy is enabled by default and an
>     issue has been raised here:
>     https://github.com/SELinuxProject/refpolicy/issues/906

  Vincent pointed out in that ticket that there is already a PR that fixes it. 
So instead, I downloaded that patch.

  There was also an existing patch in a versioned directory that I removed 
(after checking that it was applied upsream).


  Regards,
  Arnout

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>   package/refpolicy/refpolicy.hash | 2 +-
>   package/refpolicy/refpolicy.mk   | 3 ++-
>   2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/package/refpolicy/refpolicy.hash b/package/refpolicy/refpolicy.hash
> index 5e876d4a43..76bbf482ae 100644
> --- a/package/refpolicy/refpolicy.hash
> +++ b/package/refpolicy/refpolicy.hash
> @@ -1,5 +1,5 @@
>   # From https://github.com/SELinuxProject/refpolicy/releases
> -sha256  7ed41f4f45189b9ee9706da8ac357eccc103651b56daabaddb54c436e8117cf9  refpolicy-2.20240226.tar.bz2
> +sha256  d2487c49420e8710e999b18bbe699fbff033fe5adc5127e3f0c7dafaa9b4d209  refpolicy-2.20250213.tar.bz2
>   
>   # Locally computed
>   sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  COPYING
> diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
> index 74ccb79624..a25a9c45ee 100644
> --- a/package/refpolicy/refpolicy.mk
> +++ b/package/refpolicy/refpolicy.mk
> @@ -23,7 +23,7 @@ REFPOLICY_SITE = $(call qstrip,$(BR2_PACKAGE_REFPOLICY_CUSTOM_REPO_URL))
>   REFPOLICY_SITE_METHOD = git
>   BR_NO_CHECK_HASH_FOR += $(REFPOLICY_SOURCE)
>   else
> -REFPOLICY_VERSION = 2.20240226
> +REFPOLICY_VERSION = 2.20250213
>   REFPOLICY_SOURCE = refpolicy-$(REFPOLICY_VERSION).tar.bz2
>   REFPOLICY_SITE = https://github.com/SELinuxProject/refpolicy/releases/download/RELEASE_$(subst .,_,$(REFPOLICY_VERSION))
>   endif
> @@ -55,6 +55,7 @@ $(foreach dir,$(REFPOLICY_EXTRA_MODULES_DIRS),\
>   REFPOLICY_MODULES = \
>   	application \
>   	authlogin \
> +	dbus \
>   	getty \
>   	init \
>   	libraries \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE725C71136
	for <buildroot@archiver.kernel.org>; Thu, 12 Jun 2025 20:10:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AB4040749;
	Thu, 12 Jun 2025 20:10:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vA30RM48ezHU; Thu, 12 Jun 2025 20:10:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAD4E40722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD4E40722;
	Thu, 12 Jun 2025 20:10:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 580A21BD
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A13883BD4
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:10:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zeTwuIXjOYaD for <buildroot@buildroot.org>;
 Thu, 12 Jun 2025 20:10:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5794683C13
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5794683C13
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5794683C13
 for <buildroot@buildroot.org>; Thu, 12 Jun 2025 20:10:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E0A81C10C3; Thu, 12 Jun 2025 22:10:26 +0200 (CEST)
Message-ID: <18a1e41f-6e9f-4775-b17f-4dc47de77c51@rnout.be>
Date: Thu, 12 Jun 2025 22:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20250608074442.21390-1-ps.report@gmx.net>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250608074442.21390-1-ps.report@gmx.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1749759026; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=8rlz6H/5JGASZMbWXL5Z1s5a3rbVVBmg2jgvKYjLoTY=;
 b=Fhgb7lRrf8KYDpdJAiNnVC61J4swlPrxyaQOW5kpJ5L9WlCKi7l8eCUdxTOqKPrMEwFWRj
 fR7oP9Ft163KK39FSukWWLOcjMYsb3V5lZ050fcZTTyGCESALRliFrp+DAazj+RXNcrnjo
 xgBEjp0/097iYxCWe/bUIxEat/C+t0jXC/BoSsBoVCu2Iw3zbvmH3NqZ8BAaQEWa8DBTkm
 1hiDjggL2o8sg8V0ji+mLfg9F/vhIvizZLZzNqiC8EmC/Oi5+2TBLbjh+N+SwoBLJaJjwX
 lXpEaX5L8mSwOjTstYuGfB1OFE8lpWhv0kHPp0J6RuN4/C6eSZhpT9/6Mzh+Lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Fhgb7lRr
Subject: Re: [Buildroot] [PATCH v1] Revert "package/lm-sensors: update
 LM_SENSORS_VERSION"
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



On 08/06/2025 09:44, Peter Seiderer via buildroot wrote:
> Revert back to the hyphen version schema (as actual returned by
> https://release-monitoring.org, see [1], [2]).
> 
> Fixes pkg-stats output.
> 
> This reverts commit 521afeab9b7c0b07a849355e8b1c1fde0965c84f.
> 
> [1] https://release-monitoring.org/projects/search/?pattern=lm-sensors
> [2] https://release-monitoring.org/project/1831/
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/lm-sensors/lm-sensors.hash | 2 +-
>   package/lm-sensors/lm-sensors.mk   | 5 ++---
>   2 files changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/package/lm-sensors/lm-sensors.hash b/package/lm-sensors/lm-sensors.hash
> index c941043343..0ca07b7e69 100644
> --- a/package/lm-sensors/lm-sensors.hash
> +++ b/package/lm-sensors/lm-sensors.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3.6.0.tar.gz
> +sha256  0591f9fa0339f0d15e75326d0365871c2d4e2ed8aa1ff759b3a55d3734b7d197  lm-sensors-3-6-0.tar.gz
>   sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
>   sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
> diff --git a/package/lm-sensors/lm-sensors.mk b/package/lm-sensors/lm-sensors.mk
> index 1bf27fc25a..8975efaffa 100644
> --- a/package/lm-sensors/lm-sensors.mk
> +++ b/package/lm-sensors/lm-sensors.mk
> @@ -4,9 +4,8 @@
>   #
>   ################################################################################
>   
> -LM_SENSORS_VERSION = 3.6.0
> -LM_SENSORS_SITE = \
> -	$(call github,lm-sensors,lm-sensors,V$(subst .,-,$(LM_SENSORS_VERSION)))
> +LM_SENSORS_VERSION = 3-6-0
> +LM_SENSORS_SITE = $(call github,lm-sensors,lm-sensors,V$(LM_SENSORS_VERSION))
>   LM_SENSORS_INSTALL_STAGING = YES
>   LM_SENSORS_DEPENDENCIES = host-bison host-flex
>   LM_SENSORS_LICENSE = LGPL-2.1+ (libsensors), GPL-2.0+ (programs)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

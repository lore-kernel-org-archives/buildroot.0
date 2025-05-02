Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2252C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 10:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A07CD82BF5;
	Fri,  2 May 2025 10:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dBAACo1LVoXJ; Fri,  2 May 2025 10:57:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D350482C33
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D350482C33;
	Fri,  2 May 2025 10:57:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D571EE
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E51482C33
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zVIdPlaYhJ6s for <buildroot@buildroot.org>;
 Fri,  2 May 2025 10:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1D69782BC8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D69782BC8
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D69782BC8
 for <buildroot@buildroot.org>; Fri,  2 May 2025 10:57:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B9B8C1C00E6; Fri,  2 May 2025 12:57:08 +0200 (CEST)
Message-ID: <fd6930e3-b568-4937-aef7-2cc38e3706b5@rnout.be>
Date: Fri, 2 May 2025 12:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Olivain <ju.o@free.fr>, buildroot@buildroot.org
References: <20250330132051.673201-1-ju.o@free.fr>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250330132051.673201-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1746183428; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=aJq68bstcI3ZOrhHXlg2B5T4W75KXsKv0cfJZRcCDRA=;
 b=L6M85ARjPVX8qxEvlqPY4u+hMYa26loTOZn/S0AUt//azaR95SnOY34GiV6hWpms9TWTbP
 hD9kF+Y5qHp5Jq8kySSNXo05BUElg7a9P9DO3VVGvj/wf6XYoAiI/vEnqknD8K1yHMEguk
 iVVx+dWKIha0l6NmkvTGe4t+iVJFQ7Vo24ayJ7zVZZBRoifjZhbrJsK8NJxMpTZA0pkYpf
 Uyz0g1b9Z4nSZhckRP+SNJRsSxtj8K3q0P86AIBm05Qa+p/U8rMbQiGrkLudIA8bdx/x68
 JKgegI2nRanlJrGsrSTMTGiVSBpJ9g0raqWA3VqTYhGxatEluZutchYwMpV5rw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=L6M85ARj
Subject: Re: [Buildroot] [PATCH 1/1] package/fwts: bump to version 25.03.00
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



On 30/03/2025 15:20, Julien Olivain wrote:
> See release announce:
> https://lists.ubuntu.com/archives/fwts-devel/2025-March/013974.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/jobs/9568393971
> ---
>   package/fwts/fwts.hash | 2 +-
>   package/fwts/fwts.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fwts/fwts.hash b/package/fwts/fwts.hash
> index 97b13b3db0..b578b96778 100644
> --- a/package/fwts/fwts.hash
> +++ b/package/fwts/fwts.hash
> @@ -1,5 +1,5 @@
>   # Hash from: https://fwts.ubuntu.com/release/SHA256SUMS
> -sha256  c8bbf62f4bd80f17bb768bab3863ee93e195b2047d10637a3d03fe2086291bd7  fwts-V25.01.00.tar.gz
> +sha256  6e4f795a7b5c7e549515901e197fedba200ee9fd06c8a62f9f49db24301f280b  fwts-V25.03.00.tar.gz
>   
>   # Hash for license file
>   sha256  77a5f0ea48e53ee8d67aecc7759cf468bcd340c1caca711ed4307b477a93fb47  debian/copyright
> diff --git a/package/fwts/fwts.mk b/package/fwts/fwts.mk
> index 410ce063aa..dd1c16317f 100644
> --- a/package/fwts/fwts.mk
> +++ b/package/fwts/fwts.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -FWTS_VERSION = 25.01.00
> +FWTS_VERSION = 25.03.00
>   FWTS_SOURCE = fwts-V$(FWTS_VERSION).tar.gz
>   FWTS_SITE = https://fwts.ubuntu.com/release
>   FWTS_STRIP_COMPONENTS = 0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

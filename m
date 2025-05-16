Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF42EC3ABC9
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95C33417E6;
	Fri, 16 May 2025 10:51:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pkhfoL-lvm7w; Fri, 16 May 2025 10:51:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1C714180F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1C714180F;
	Fri, 16 May 2025 10:51:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D60C51AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:51:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD9BE417E6
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:51:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id muiHyKn7PBsk for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:51:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B51964183C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B51964183C
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B51964183C
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:51:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0329B1C0FE3; Fri, 16 May 2025 12:51:35 +0200 (CEST)
Message-ID: <457e6dfd-017c-4362-840d-f5fd307d2b40@rnout.be>
Date: Fri, 16 May 2025 12:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20250501073727.12431-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250501073727.12431-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747392696; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=0mF97yoJb7Vdsx4rqDSA+08ZbEqnnOit4Z7IqILpinQ=;
 b=pU+tzo1raO4xPuPUz6+opsCr9MxED9iJuac+i346zXiMrD0q2Tibx9hEkj+xGs1x+4iO3R
 2AZqp1Y6kNQtipgbsLQ0G+KIN/PY7Qwx/8SH9sbtG6/L5Azyd7/DopvWpAOTRJuZXFUc25
 eZqxf/9cae7Dx8dKFgKr5ZXSzY7qttir2b24zed3V0GFoKAldvBN2ozd47PzzMalj2E6pN
 dOuCq72p6nG12OkBvdgFrSgY4CaJ3GZtmPhO2Kwam9SPa3MXGYUPTILNC5GWi3olhv9Kua
 IzZvTGhEG1QQSukqYXIRmhTuDg8LySVkoUdG/py66FmaNCT7H8ZxPyj4eK+k+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=pU+tzo1r
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.394
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



On 01/05/2025 09:37, Kadambini Nema wrote:
> Release notes:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.394
> 
> Changelog:
> https://github.com/vcrhonek/hwdata/compare/v0.392...v0.394
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

  Applied to 2025.02.x, thanks.

  Regards,
  Arnout

> ---
>   package/hwdata/hwdata.hash | 2 +-
>   package/hwdata/hwdata.mk   | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/hwdata/hwdata.hash b/package/hwdata/hwdata.hash
> index 9c8d37323d..eb4ecc191d 100644
> --- a/package/hwdata/hwdata.hash
> +++ b/package/hwdata/hwdata.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  1f472d8f2ec824d4efe6a75480767c4ce240fa5d91b6428d9f8775035da3ba1f  hwdata-0.392.tar.gz
> +sha256  b7c3fd7214a3b7c49d2661db127a712dc11cffd1799f793947aa1cb20aaf3298  hwdata-0.394.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
> diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
> index eb9166dc72..f47df2ebb8 100644
> --- a/package/hwdata/hwdata.mk
> +++ b/package/hwdata/hwdata.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HWDATA_VERSION = 0.392
> +HWDATA_VERSION = 0.394
>   HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
>   HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
>   HWDATA_LICENSE_FILES = COPYING LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

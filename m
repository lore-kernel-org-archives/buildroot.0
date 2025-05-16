Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BECFC3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 10:59:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BD184056C;
	Fri, 16 May 2025 10:59:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ChbeMnaAik96; Fri, 16 May 2025 10:59:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5430A40787
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5430A40787;
	Fri, 16 May 2025 10:59:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 55B281AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B62D83C91
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:59:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xy9nFT5v-lx3 for <buildroot@buildroot.org>;
 Fri, 16 May 2025 10:59:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 50A7E83C8D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50A7E83C8D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 50A7E83C8D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 10:59:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 23FF11C0FC0; Fri, 16 May 2025 12:59:11 +0200 (CEST)
Message-ID: <d71a54c6-1747-4c0a-b47a-6eb75404a640@rnout.be>
Date: Fri, 16 May 2025 12:59:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Kadambini Nema <kadambini.nema@gmail.com>, buildroot@buildroot.org
References: <20250508042911.29426-1-kadambini.nema@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20250508042911.29426-1-kadambini.nema@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747393151; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=QN+lRYQpo9SEqbzWywARuTEmCshvnnLDODg8T892++8=;
 b=CQJurcS4xGwh2wv6AkDU7DfKRVff7sZtMQVQWu8A+V907bCsC1RUkRJp2+wzZRTJij8mlR
 edQwmvc3iNy0DPfV4RlbJFjacLvGkN3KI2n46g/jJZbZF3Qrafhpi/XKG+4gG+cti+fIgH
 1ITEb3vCfPm40PT24j+gNsicxdT4Mu5KqFJItpthcQQs/6I4PxKWKgVZHAKtvZaD67xMNA
 Ei3M+QnJ3G0yezPYL3GKlzOndNVEGLXViuDJLaomHrugpWutKuANa41bdauZVe4GzswAG1
 f8E+mXET4+AJ6K09BZ77WtgkAYREypPOCUXrc06h6MvF94Jxew3IUFZuXovRWw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=CQJurcS4
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.395
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



On 08/05/2025 06:29, Kadambini Nema wrote:
> Release notes:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.395
> 
> Changelog:
> https://github.com/vcrhonek/hwdata/compare/v0.394...v0.395
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
> index eb4ecc191d..8eb0597a98 100644
> --- a/package/hwdata/hwdata.hash
> +++ b/package/hwdata/hwdata.hash
> @@ -1,4 +1,4 @@
>   # Locally calculated
> -sha256  b7c3fd7214a3b7c49d2661db127a712dc11cffd1799f793947aa1cb20aaf3298  hwdata-0.394.tar.gz
> +sha256  1166f733c57afa82cfdad56e62ef044835fbc8c99ef65f033e6a5802716b5c66  hwdata-0.395.tar.gz
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
>   sha256  21d0406f93e884a050426ebc21931839a45d56bfcbcbfdda7686d583f36f107f  LICENSE
> diff --git a/package/hwdata/hwdata.mk b/package/hwdata/hwdata.mk
> index f47df2ebb8..4de227b650 100644
> --- a/package/hwdata/hwdata.mk
> +++ b/package/hwdata/hwdata.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HWDATA_VERSION = 0.394
> +HWDATA_VERSION = 0.395
>   HWDATA_SITE = $(call github,vcrhonek,hwdata,v$(HWDATA_VERSION))
>   HWDATA_LICENSE = GPL-2.0+, BSD-3-Clause, XFree86 1.0
>   HWDATA_LICENSE_FILES = COPYING LICENSE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

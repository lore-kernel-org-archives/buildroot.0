Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B7D107BCE2
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 20:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37FDC8174D;
	Fri, 13 Mar 2026 20:58:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sYWju7qyR54h; Fri, 13 Mar 2026 20:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CBCC817A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773435533;
	bh=Obv5AfT0T1slSguDFXsTqFqlj2JnrTHm7vAFm0npySw=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DTeQIlEhSedfaFOVQS5nZYR2GkIiGgw/usQQttTlTuOcw/r76ypGfe9pqTcAUfwmy
	 LEdHKYjWfMQFBWdhJHb4Q8H90rueSs5vhpH2VOvkbvrWZLP0g5lOtrxOmjGuq03rig
	 djTNqVxks6TfzYeL2A5zvMMvXuwADS9bh6gKLQsKhxTwVTDQdMBByzZfdiC6Pc5IUZ
	 NQFXw4GEHjFnTWU23of+RmmtPaRmIvRwPkdyYWOlX8tzI0WMcOT6Oay+/bBj3NgfdB
	 CaPLjYYY2cVdJ/PHoL6uHM13Nsshc9Fsxs8TtcETghEdGdigPgtrLcXSs4rIPCzUqT
	 vGgSGZWTUs6+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5CBCC817A4;
	Fri, 13 Mar 2026 20:58:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 35A76201
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26BDF60D9C
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:58:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EGRnBuNPo38v for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 20:58:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.56;
 helo=smtpcmd0756.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E548760D6B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E548760D6B
Received: from smtpcmd0756.aruba.it (smtpcmd0756.aruba.it [62.149.156.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E548760D6B
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 20:58:50 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 19apw9g9XtpTf19aqwwZDg; Fri, 13 Mar 2026 21:58:48 +0100
Message-ID: <c373b356-a27c-4e09-aae5-85847e522f43@benettiengineering.com>
Date: Fri, 13 Mar 2026 21:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org
References: <20260312095819.2437101-1-giulio.benetti@benettiengineering.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20260312095819.2437101-1-giulio.benetti@benettiengineering.com>
X-CMAE-Envelope: MS4xfBwidQ3XfayeBcBRsCz1qE500lnPrPbVdTY1Z67Euubr0LgmxTfQ3ckfY0DtUcfMBQ4vmsdNBjM/2BkUhPwLAzuFJLaSpTdrhvzqFPssR7+MrzUiR7Sv
 0wP3rdZsr3VNMZBsZ/s9SVcqHtrf4dNvkCVTzMXQdl73GeQGsTAGwR1DkI9/PhaWUsA5u2MSKCbkafFStb4F4Kvci9HZvj1b20V+LLYNoKBCQ2NJXm4nc1sh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773435528; bh=lGOZ4edWHyKWrFj1frTrTNBaZ9I0PrZ1Xx02CDuItLA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=fh8H6ax7IoudFNAFnKlYEVM8jOSNYyOtCHkQkJuqkQrU5Myz/tRGgPyTLi5bepOE5
 f+hLeuBaGzmIySuszhas8BR3yEV/4CUiV1UaYPPokUAozmdfPOL3yvD4IN3bbDWIh+
 evo5umSSOnI0BeGndpdduIl19kblCAomvcRvndQLZH0qFLjbttWLOaVbcKoVKmzp2v
 E8LglLrM3Ujpgh1bbtIxf0dpZAoewkJbBdTkR9g4l+7Wg3abfThCqiWNm6fa0ZAaHO
 +qwuyt+7dkFuDrQBiTMwcrK9n2Ayu7BEAaI8q4sELwcHvDGXYEYseHK+5vGOrWcPKP
 hHQakCOZW/nTg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=fh8H6ax7
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump version to 13.1.0
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch has been superseded by:
https://patchwork.ozlabs.org/project/buildroot/patch/20260313205720.4037961-1-giulio.benetti@benettiengineering.com/

Best regards
Giulio

On 12/03/2026 10:58, Giulio Benetti wrote:
> https://github.com/harfbuzz/harfbuzz/blob/13.1.0/NEWS
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   package/harfbuzz/harfbuzz.hash | 4 ++--
>   package/harfbuzz/harfbuzz.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
> index a6247282a8..3090b08904 100644
> --- a/package/harfbuzz/harfbuzz.hash
> +++ b/package/harfbuzz/harfbuzz.hash
> @@ -1,4 +1,4 @@
> -# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.0.1
> -sha256  3553d943401c34ab9b8c75f35cdb8452ca660233b0e9d4a22395ce5245484bd7  harfbuzz-13.0.1.tar.xz
> +# From https://github.com/harfbuzz/harfbuzz/releases/tag/13.1.0
> +sha256  a9959a0db77554d266803e1e524249ed4504695fef63524aebca749ac6260a7f  harfbuzz-13.1.0.tar.xz
>   # Locally computed
>   sha256  ba8f810f2455c2f08e2d56bb49b72f37fcf68f1f4fade38977cfd7372050ad64  COPYING
> diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
> index 51bef1a68a..60ddc8aadf 100644
> --- a/package/harfbuzz/harfbuzz.mk
> +++ b/package/harfbuzz/harfbuzz.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HARFBUZZ_VERSION = 13.0.1
> +HARFBUZZ_VERSION = 13.1.0
>   HARFBUZZ_SITE = https://github.com/harfbuzz/harfbuzz/releases/download/$(HARFBUZZ_VERSION)
>   HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
>   HARFBUZZ_LICENSE = MIT, ISC (ucdn library)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

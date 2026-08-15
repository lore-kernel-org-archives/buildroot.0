Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACD3C5DF6E
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 13:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EDB9409E9;
	Sat, 15 Aug 2026 13:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XtP-gtS31JOy; Sat, 15 Aug 2026 13:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F23E40C1D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786798920;
	bh=C26a7jBRhmJDhBKLy7Ho4H1cHgbGw5PxZHaL68S5sJw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dP0a3prSakisqLtLwEZb6sPNhGOH3mrDMpPjWriSC6MfnzxF6V8UzOZuXM5jDIGb/
	 3ax4blaLnAAhd+rp821Xq6SnPerZzoVZW2hdnVFberrM/ITB9E0Lm//gXGmt7U9JFy
	 LdJZDFScUnxJNYs6CufhotPzRDnJU0fIHoQrSO/51v9U/m+32407TD9LM36tEbG5L7
	 WrLlDCAab5fe+8bjqNAQnyCYtw8nOGts1oiphsqOB8cGgDotzanuPqSucgYvawuxo3
	 5gwCQHj1qoKybG9Sct4PgwIMWu1cLaNAFfbf/VHmpnA3aWX8/nhBLkMpXq8kqQ9H7T
	 tuJb06pOV7TYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F23E40C1D;
	Sat, 15 Aug 2026 13:02:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FC78361
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 13:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 65D2840C35
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 13:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F173L2HzmCby for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 13:01:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 73F8D40C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73F8D40C1D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 73F8D40C1D
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 13:01:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 63D26B00565;
 Sat, 15 Aug 2026 15:01:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 15 Aug 2026 15:01:54 +0200
MIME-Version: 1.0
Date: Sat, 15 Aug 2026 15:01:54 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260815104726.241039-1-thomas.petazzoni@bootlin.com>
References: <20260815104726.241039-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.17
Message-ID: <436d7ccc39faa3be44e60280de1ab896@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/double-conversion: bump to 3.4.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15/08/2026 12:47, Thomas Petazzoni via buildroot wrote:
> Packaging changes:
> 
> - Drop patch that is upstream (it was an upstream backport)
> - double-conversion now requires CMake 3.29, so we select
>   BR2_HOST_CMAKE_AT_LEAST_3_29
> 
> Upstream changes:
> 
> CMake: Raised required version to 3.5 by @heirecka in #240
> Bump ossf/scorecard-action from 2.4.0 to 2.4.1 by @dependabot[bot] in 
> #241
> Always initialize decimal-point variable. by @floitsch in #244
> Explain that ToShortest might not be the shortest. by @floitsch in #245
> Add higher bound for cmake. by @floitsch in #246
> Bump ossf/scorecard-action from 2.4.1 to 2.4.2 by @dependabot[bot] in 
> #248
> Bump lukka/get-cmake from 4.0.2 to 4.0.3 by @dependabot[bot] in #250
> Bump lukka/get-cmake from 4.0.3 to 4.1.0 by @dependabot[bot] in #252
> Bump actions/checkout from 4.2.2 to 5.0.0 by @dependabot[bot] in #253
> Bump lukka/get-cmake from 4.1.0 to 4.1.1 by @dependabot[bot] in #254
> Add alias double-conversion::double-conversion by @Flamefire in #255
> Revert "Add _ITERATOR_DEBUG_LEVEL=2 and _DEBUG defines (#202)" by 
> @Osyotr in #256
> Bump ossf/scorecard-action from 2.4.2 to 2.4.3 by @dependabot[bot] in 
> #259
> Install pkg-config file (from CMake build) by @Ericson2314 in #262
> Update CI runners and minimal cmake. by @floitsch in #257
> Bump lukka/get-cmake from 4.1.1 to 4.1.2 by @dependabot[bot] in #258
> Bump lukka/get-cmake from 4.1.2 to 4.2.0 by @dependabot[bot] in #264
> Bump actions/checkout from 5.0.0 to 6.0.0 by @dependabot[bot] in #265
> Bump actions/checkout from 6.0.0 to 6.0.1 by @dependabot[bot] in #266
> Prepare new release. by @floitsch in #267
> 
> See https://github.com/google/double-conversion/releases/tag/v3.4.0
> 
> Tested in a defconfig that has the two reverse dependencies of
> double-conversion in Buildroot:
> 
> BR2_aarch64=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
> BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
> BR2_PACKAGE_QT6=y
> BR2_PACKAGE_PYTHON3=y
> BR2_PACKAGE_PYTHON_UJSON=y
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

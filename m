Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D7CCAC5B8
	for <buildroot@archiver.kernel.org>; Tue, 30 Sep 2025 19:27:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A857661036;
	Tue, 30 Sep 2025 19:27:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SQvPMA5bsb0K; Tue, 30 Sep 2025 19:27:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA8B961038
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA8B961038;
	Tue, 30 Sep 2025 19:27:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D31D51000
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9C4740C4D
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6mv-2_iQ8rqF for <buildroot@buildroot.org>;
 Tue, 30 Sep 2025 19:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA8444037D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA8444037D
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA8444037D
 for <buildroot@buildroot.org>; Tue, 30 Sep 2025 19:27:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E159419F57E;
 Tue, 30 Sep 2025 21:27:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 30 Sep 2025 21:27:17 +0200
MIME-Version: 1.0
Date: Tue, 30 Sep 2025 21:27:17 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250930104038.58702-1-titouan.christophe@mind.be>
References: <20250930104038.58702-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <ba87bde9d8e1e4419e9b4fa3c3c3fa34@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759260440;
 bh=CKcPWb642OlMp13p4MzmS+T3dbytSpDWiFTc82NWs8M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=o9JddejKgSUBkFCoMbitOweIrwzd+yZkzS+Vx103NwIV8JRK/c4E2ey3PmmhKEoEJ
 xCEqmve4atrETfDE8nXFIC1tzhn8XCIOeNXR73D6Y70VeDEQ4th24tkvcguHYgan7h
 0nG+Su3VXvkyNN1Y5TmL/3r+px9UdvnaRzdLT1l2RR1V7gsZxZTKhg3HCFfQIZl4GK
 QkVIZovnbFulLn0xwDbHa5HTI43trALmNfckotSe1aoBb3tv7MSB34cP1FrzApnbjG
 krZVEXLnMM4L2Ti0/qgBjFSPAyGp7asLUCa5GQg/rHe8klTmUJagbsBNJK2lleAP+5
 3Gdsg7q4IzJiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=o9JddejK
Subject: Re: [Buildroot] [PATCH] package/ghostscript: security bump to
 v10.06.0
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

Hi Titouan,

Thanks for the patch. I have few comments, see below.

It is failing to pass the runtime test:
https://gitlab.com/jolivain/buildroot/-/jobs/11553731486

It is also introducing new build failures:
https://gitlab.com/jolivain/buildroot/-/pipelines/2072721733

For reference, ghostscript v10.05.1:
https://gitlab.com/jolivain/buildroot/-/pipelines/2072725067

Could you have a look for a fix to pass the runtime test and test-pkg,
please?

On 30/09/2025 12:40, Titouan Christophe via buildroot wrote:
> This fixes the following vulnerabilities:
> - CVE-2025-59798:
>     Artifex Ghostscript through 10.05.1 has a stack-based buffer 
> overflow
>     in pdf_write_cmap in devices/vector/gdevpdtw.c.
>     https://www.cve.org/CVERecord?id=CVE-2025-59798
> 
> - CVE-2025-59799:
>     Artifex Ghostscript through 10.05.1 has a stack-based buffer 
> overflow
>     in pdfmark_coerce_dest in devices/vector/gdevpdfm.c via a large 
> size
>     value.
>     https://www.cve.org/CVERecord?id=CVE-2025-59799
> 
> - CVE-2025-59800:
>     In Artifex Ghostscript through 10.05.1, ocr_begin_page in
>     devices/gdevpdfocr.c has an integer overflow that leads to a heap-
>     based buffer overflow in ocr_line8.
>     https://www.cve.org/CVERecord?id=CVE-2025-59800
> 
> - CVE-2025-59801:
>     In Artifex GhostXPS before 10.06.0, there is a stack-based buffer
>     overflow in xps_unpredict_tiff in xpstiff.c because the
>     samplesperpixel value is not checked.
>     https://www.cve.org/CVERecord?id=CVE-2025-59801

Could you add a reference to the release note. For example:
"""
For release note, see:
https://ghostscript.readthedocs.io/en/gs10.06.0/News.html
"""

> Also remove patch that is now applied upstream
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  ...Fix-compatibility-with-C23-compilers.patch | 36 -------------------
>  package/ghostscript/ghostscript.hash          |  2 +-
>  package/ghostscript/ghostscript.mk            |  2 +-
>  3 files changed, 2 insertions(+), 38 deletions(-)
>  delete mode 100644 
> package/ghostscript/0001-Fix-compatibility-with-C23-compilers.patch
[...]
> diff --git a/package/ghostscript/ghostscript.hash 
> b/package/ghostscript/ghostscript.hash
> index c434ac1f3a..9b6ead7cfb 100644
> --- a/package/ghostscript/ghostscript.hash
> +++ b/package/ghostscript/ghostscript.hash
> @@ -1,5 +1,5 @@
>  # From 
> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10051/SHA512SUMS

Could you update the upstream hash URL please?

It should be:
# From 
https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs10060/SHA512SUMS

> -sha512  
> 1a3f2b0f53db9a00a245df19ce8fdce0fbccc6fad47b64d14fc9058b494ab07c77e21bb073df8d4a2522b3ccb0df26735f8224a9e36c07367031ed2262fb26af 
>  ghostscript-10.05.1.tar.xz
> +sha512  
> e9efa6a334cf34703f565f5043dd794452270415b34c2bea260e9dac6c72ebbcbedfa2e4cb9029841f8f582bbce91be8160e135a190081f3262bcf04417f80f1 
>  ghostscript-10.06.0.tar.xz
> 
>  # Hash for license file:
>  sha256  
> 8ce064f423b7c24a011b6ebf9431b8bf9861a5255e47c84bfb23fc526d030a8b  
> LICENSE
> diff --git a/package/ghostscript/ghostscript.mk 
> b/package/ghostscript/ghostscript.mk
> index c9d13f5545..1fc850ad20 100644
> --- a/package/ghostscript/ghostscript.mk
> +++ b/package/ghostscript/ghostscript.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -GHOSTSCRIPT_VERSION = 10.05.1
> +GHOSTSCRIPT_VERSION = 10.06.0
>  GHOSTSCRIPT_SOURCE = ghostscript-$(GHOSTSCRIPT_VERSION).tar.xz
>  GHOSTSCRIPT_SITE = 
> https://github.com/ArtifexSoftware/ghostpdl-downloads/releases/download/gs$(subst 
> .,,$(GHOSTSCRIPT_VERSION))
>  GHOSTSCRIPT_LICENSE = AGPL-3.0
> --
> 2.51.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

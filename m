Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF9FCAC5B0
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 17:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F00E81EA3;
	Fri,  3 Oct 2025 17:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MIFXSp0uPGXc; Fri,  3 Oct 2025 17:15:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6D3081EA5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6D3081EA5;
	Fri,  3 Oct 2025 17:15:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DF44226
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A08840225
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 77fAo8oOtjrf for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 17:15:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1E8DE40D36
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1E8DE40D36
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1E8DE40D36
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 17:15:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 965EE2003D6;
 Fri,  3 Oct 2025 19:15:36 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 19:15:36 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 19:15:36 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20251003125438.76030-1-titouan.christophe@mind.be>
References: <20251003125438.76030-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <61796e770ac68ed8d6c276f095369cc3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759511738;
 bh=QfdIrD3HxcAMhcZbNE+aAi1jC1QFMxC0fKkQ+1YoaAw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W9nDbv4PfdlzcP52oEQHp5wDmfASuQX57SHAxBHc2y9I4cohZxsgqDhFZSAJsfG0R
 +kDL0NlBCsjoGP0xGkSGNKp7gj0H8IUmodanIDv7pMsfgtoLfxnupMkBqvuYUPKCaJ
 KpBUIFaG2udjhYwBREqscoPrj9we3k1M43qvslGG8hqtOXWPDBOD7xvyaV2ppwon5L
 SbKmkwtjguCC+q/UIc+ka0wW4KN/lns8ljj7yt0Q/JXQ0+Wnws1CpHSd96akxV7HGw
 KmJTHoON7VQRIB1dh0ghRSaAW9nnajvJw3w2paue+245126d8wdE8SIM4P4Lje43qS
 6hiJmeNhaw08Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W9nDbv4P
Subject: Re: [Buildroot] [PATCH v2] package/ghostscript: security bump to
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

On 03/10/2025 14:54, Titouan Christophe via buildroot wrote:
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
> 
> Also remove patch that is now applied upstream, and add new patch from
> upstream to fix a compilation issue on 32bits platforms
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
For info, I also included the changes from my v1 review that
you might have overlooked. See:
https://patchwork.ozlabs.org/project/buildroot/patch/20250930104038.58702-1-titouan.christophe@mind.be/
https://gitlab.com/buildroot.org/buildroot/-/commit/6f984089c0ff103fca50617c9fa033eaadf61e51

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

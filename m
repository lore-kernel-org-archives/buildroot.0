Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83580CCF9E0
	for <buildroot@archiver.kernel.org>; Fri, 24 Oct 2025 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4930F8473E;
	Fri, 24 Oct 2025 21:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCrvmD0ZJJa7; Fri, 24 Oct 2025 21:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E48F8473F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E48F8473F;
	Fri, 24 Oct 2025 21:06:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7A9B129
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A951D40825
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ireCiZNpuBeX for <buildroot@buildroot.org>;
 Fri, 24 Oct 2025 21:06:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9598840A44
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9598840A44
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9598840A44
 for <buildroot@buildroot.org>; Fri, 24 Oct 2025 21:06:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 9137B19F576;
 Fri, 24 Oct 2025 23:06:00 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 24 Oct 2025 23:06:00 +0200
MIME-Version: 1.0
Date: Fri, 24 Oct 2025 23:06:00 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Olivier Schonken <olivier.schonken@gmail.com>
In-Reply-To: <20251016115601.228048-1-titouan.christophe@mind.be>
References: <20251016115601.228048-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <66e656d41d47fff035a9accb224b54d3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761339962;
 bh=pf+rH6nBCfJmiFI1yi7cpYZXoT3Xz44BbDEjbFDCnn0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IY01yD/I+sUY5MtV+ccjuH6XGOj7MFb9tzA/0F12xksr98QX0gQmckBDwZz0RTaAU
 4m08H5uMYsG7z2E7GHmgGtktzXXn6Z7n7RFQXB/pyqvOQnm9Ye5w4qlMsXnALGCaMb
 S5297STMgvjzIj6JFZmWG+3hF8sdVDZP92jYLXJ6SI88gDOHZPi1PH80/1cnK8euLI
 H+C0ldMYnQYCzDhEdOqlN571Gw6pADkvh7h993lkhpO4X9pXIcVnr9l+yLSU0y8NtY
 SP5zKaKvT+Oufhnx2BrgKACjkqsziYuIJFY9NDgINSMxV8y7aYJqIdZ8pl/FdAGybz
 yj/ijpc9GuOHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=IY01yD/I
Subject: Re: [Buildroot] [PATCH] package/poppler: bump to v25.10.0
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

On 16/10/2025 13:56, Titouan Christophe via buildroot wrote:
> This contains many bug and security fixes since v22.12.0.
> See the release notes: https://poppler.freedesktop.org/releases.html
> 
> In addition:
> - Drop patch that has been applied upstream
> - Update a few cmake configuration options that changed upstream
> 
> There is currently a build failure when enabling gpgme, so disable it
> unconditionally for now.
> 
> Finally, this fixes the following vulnerabilities:
> - CVE-2024-6239:
>     A flaw was found in the Poppler's Pdfinfo utility. This issue 
> occurs
>     when using -dests parameter with pdfinfo utility. By using certain
>     malformed input files, an attacker could cause the utility to 
> crash,
>     leading to a denial of service.
>     https://www.cve.org/CVERecord?id=CVE-2024-6239
> 
> - CVE-2024-56378:
>     libpoppler.so in Poppler through 24.12.0 has an out-of-bounds read
>     vulnerability within the JBIG2Bitmap::combine function in
>     JBIG2Stream.cc.
>     https://www.cve.org/CVERecord?id=CVE-2024-56378
> 
> - CVE-2025-32364:
>     A floating-point exception in the PSStack::roll function of Poppler
>     before 25.04.0 can cause an application to crash when handling
>     malformed inputs associated with INT_MIN.
>     https://www.cve.org/CVERecord?id=CVE-2025-32364
> 
> - CVE-2025-32365:
>     Poppler before 25.04.0 allows crafted input files to trigger 
> out-of-
>     bounds reads in the JBIG2Bitmap::combine function in JBIG2Stream.cc
>     because of a misplaced isOk check.
>     https://www.cve.org/CVERecord?id=CVE-2025-32365
> 
> - CVE-2025-43903:
>     NSSCryptoSignBackend.cc in Poppler before 25.04.0 does not verify 
> the
>     adbe.pkcs7.sha1 signatures on documents, resulting in potential
>     signature forgeries.
>     https://www.cve.org/CVERecord?id=CVE-2025-43903
> 
> - CVE-2025-50420:
>     An issue in the pdfseparate utility of freedesktop poppler v25.04.0
>     allows attackers to cause an infinite recursion via supplying a
>     crafted PDF file. This can lead to a Denial of Service (DoS).
>     https://www.cve.org/CVERecord?id=CVE-2025-50420
> 
> - CVE-2025-52886:
>     Poppler is a PDF rendering library. Versions prior to 25.06.0 use
>     `std::atomic_int` for reference counting. Because `std::atomic_int` 
> is
>     only 32 bits, it is possible to overflow the reference count and
>     trigger a use-after-free. Version 25.06.0 patches the issue.
>     https://www.cve.org/CVERecord?id=CVE-2025-52886
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA5CCCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 21:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5875D613D3;
	Thu,  9 Oct 2025 21:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CzvsvHwGHIH3; Thu,  9 Oct 2025 21:31:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 794AA61209
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 794AA61209;
	Thu,  9 Oct 2025 21:31:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 616E5226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 46DA061209
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5a5p3zaWmMRZ for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 21:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 138C460BEE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 138C460BEE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 138C460BEE
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 21:31:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 0B897B00563;
 Thu,  9 Oct 2025 23:31:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 09 Oct 2025 23:31:25 +0200
MIME-Version: 1.0
Date: Thu, 09 Oct 2025 23:31:25 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Jan Pedersen <jp@jp-embedded.com>
In-Reply-To: <20251009201429.71928-1-thomas.perale@mind.be>
References: <20251009201429.71928-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <d7404c7cbae11f88843539653172a511@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760045488;
 bh=16QQ/t+koETV+Vbig1FTbYPaj5A9fcYlYn2Uo2Pt1rU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pQsmx/PBbSSTU/0cPjjZy+Yuavg/YZcXA46425SEJD64kmcrbUlwJo8DORPoIR+co
 35wcoSV20mDIf9ast1bHzeTcaRr5Iwrj4AR+UoFIbJuCXSnoF5OCj6LyrSJlGtR9qy
 lIhI/xOXsDRDAF2Jix7Y2xF0RVPB9DcG0RkeNCw6d+DYGkdOULDfnCDfrwbvrJO6Bv
 xwDZ4QhVj4dg8gdPDSQgBo575N2EaUwj4QtCuBLPpZXfTzzvWvhkvViFLmtd6K0Yb0
 nMvylvPx9wy7bD5aEqJeswNVTfaZpQj+TEfpsnStIJD/iqeeU1rg0itO/JStNxYdA8
 D/q8L2b9U30Jg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pQsmx/PB
Subject: Re: [Buildroot] [PATCH] package/zip: add patch for CVE-2018-13410
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

On 09/10/2025 22:14, Thomas Perale via buildroot wrote:
> Fixes the following vulnerability:
> 
> - CVE-2018-13410
> 
>     Info-ZIP Zip 3.0, when the -T and -TT command-line options are 
> used,
>     allows attackers to cause a denial of service (invalid free and
>     application crash) or possibly have unspecified other impact 
> because
>     of an off-by-one error. NOTE: it is unclear whether there are
>     realistic scenarios in which an untrusted party controls the -TT
>     value, given that the entire purpose of -TT is execution of
>     arbitrary commands
> 
> For more information, see:
>   - https://nvd.nist.gov//vuln/detail/CVE-2018-13410
> 
> This patch also includes the patch 0009 which address a buffer overflow
> when passing unicode characters that doesn't have a CVE assigned.
> 
> Tested with `./support/testing/run-tests -d dl -o output_folder -k 
> tests.package.test_zip`
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

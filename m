Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3147DC369A2
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 17:56:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEB5C60812;
	Fri, 11 Apr 2025 17:56:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lL3KvYHFxpVh; Fri, 11 Apr 2025 17:56:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5E36F808
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5E36F808;
	Fri, 11 Apr 2025 17:56:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B8DE108
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C63660886
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:56:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9_6Ra4eyWoB8 for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 17:56:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AA4760867
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AA4760867
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AA4760867
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 17:56:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2E2F313F89A;
 Fri, 11 Apr 2025 19:56:25 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 11 Apr 2025 19:56:25 +0200
MIME-Version: 1.0
Date: Fri, 11 Apr 2025 19:56:25 +0200
From: Julien Olivain <ju.o@free.fr>
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20250411174847.3489092-1-thomas.perale@mind.be>
References: <20250411174847.3489092-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <0735d0e5f5b8f1fcb9b69f94dc7e2efd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744394187;
 bh=T54FrXc/il/JJxxXmhBazecbKMkzBEBov78emdyIbas=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O5WiZFG+CTWAa7rpRsYQPKAAKO/G3Cvis+19RN/SX3nG5H8MtEIdfmBvLh17qfrwf
 f+jT+jzuVnD6fALELoCYeEoHyqXFOsc/PSokMJHYPL8bMoEZMuONsxcylvSSowcO+B
 HnxxajRnuMAMH+2xkRHHtMxJk3KHVtIsWRE42GGF673u7cCRSkbLex8TJOrXiEORbZ
 0fRkqd16bVqYlC39kjk9KcBW9x6xKGI4BmtfP6JEEz6KFqZK5Ztzq2qMuna8+lfHI0
 yVpLQiPRS6sdYU3izVGFtzyOKtnLg/JWHwPjV3hoA5TwbxYStl7v6WXMiaduBKkWfv
 K0OkN7rjQRteg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O5WiZFG+
Subject: Re: [Buildroot] [PATCH 1/1] package/libarchive: security bump to
 version 3.7.9
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

On 11/04/2025 19:48, Thomas Perale via buildroot wrote:
> Fixes the following security issues:
> 
> - CVE-2024-57970: libarchive through 3.7.7 has a heap-based buffer
>     over-read in header_gnu_longlink in 
> archive_read_support_format_tar.c
>     via a TAR archive because it mishandles truncation in the middle of 
> a
>     GNU long linkname.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2024-57970
>   - 
> https://github.com/libarchive/libarchive/commit/82912103214506316bd9990d73f33d743d55f570
> 
> - CVE-2025-1632: This affects the function list of the file bsdunzip.c.
>     The manipulation leads to null pointer dereference. It is possible
>     to launch the attack on the local host.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-1632
>   - 
> https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532
> 
> - CVE-2025-25724: list_item_verbose in tar/util.c in libarchive through 
> 3.7.7
>     does not check an strftime return value, which can lead to a denial 
> of
>     service or unspecified other impact via a crafted TAR archive that 
> is read
>     with a verbose value of 2.
>     For example, the 100-byte buffer may not be sufficient for a custom 
> locale.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-25724
>   - 
> https://github.com/libarchive/libarchive/commit/c9bc934e7e91d302e0feca6e713ccc38d6d01532
> 
> The patch added in [1] are still needed for this version bump.
> 
> For more details on the version bump, see the release notes:
>   - https://github.com/libarchive/libarchive/releases/tag/v3.7.8
>   - https://github.com/libarchive/libarchive/releases/tag/v3.7.9
> 
> [1] 9ac63a3360 package/libarchive: fix uclibc build with libiconv 
> (again)
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

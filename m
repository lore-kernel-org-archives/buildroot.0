Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B26C54ED1
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 10:44:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A018E4043F;
	Sat, 28 Jun 2025 10:44:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z81QkEvK7stA; Sat, 28 Jun 2025 10:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB55D403D7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB55D403D7;
	Sat, 28 Jun 2025 10:44:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D23D4154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B84A7400E9
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:44:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x-iuMsFw7vPM for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 10:44:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D2DC7400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2DC7400B8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2DC7400B8
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:44:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5E8FD2003A4;
 Sat, 28 Jun 2025 12:44:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 12:44:52 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 12:44:52 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250626085444.568020-1-titouan.christophe@mind.be>
References: <20250623160224.953975-1-titouan.christophe@mind.be>
 <20250626085444.568020-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <c3c1bd0520b24a2465734ce172c2cbad@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751107493;
 bh=7pJc4q6FuegnKDjYmix4b88I57+bBh5BZWB9XMyGZ00=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vHWqi5B7M2NogO70qJECwjvaHuy+OOX0BcO1Z4SWXMFA0EsyIQHpgbpwgcEm9/icn
 7KYVaqlTwj+LEens4kJJJF7zon0xxQR8RSwvMu5ncQ9wlFxjUdklv0n1gDkcT01cn2
 noRB+nbNBwZUSKPcQIqzeo6YPza/zL59+azDbr7y14lvlGVXeAuak05K97JjsGdReO
 kDZriIFYr+MIS93u+R756VWuijLxpj3ckQL30opEtS8a2HHmw7J0mg/R79baapKvYI
 LaXA19o7odBwymXHTNodkA57l8/jd9NN+pVqKCzQtfGRNVVxb2syQC+ZjxDJuXOsH3
 t2xxNFUS+/YFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vHWqi5B7
Subject: Re: [Buildroot] [PATCH v2] package/libarchive: security bump to
 v3.8.1
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

On 26/06/2025 10:54, Titouan Christophe via buildroot wrote:
> This fixes the following CVEs:
> 
> - CVE-2025-5914
>     Libarchive: double free at archive_read_format_rar_seek_data()
>     in archive_read_support_format_rar.c
>     https://www.cve.org/CVERecord?id=CVE-2025-5914
> 
> - CVE-2025-5915
>     Libarchive: heap buffer over read in copy_from_lzss_window()
>     at archive_read_support_format_rar.c
>     https://www.cve.org/CVERecord?id=CVE-2025-5915
> 
> - CVE-2025-5916
>     Libarchive: integer overflow while reading warc files
>     at archive_read_support_format_warc.c
>     https://www.cve.org/CVERecord?id=CVE-2025-5916
> 
> - CVE-2025-5917
>     Libarchive: off by one error in build_ustar_entry_name()
>     at archive_write_set_format_pax.c
>     https://www.cve.org/CVERecord?id=CVE-2025-5917
> 
> - CVE-2025-5918
>     Libarchive: reading past eof may be triggered for piped file 
> streams
>     https://www.cve.org/CVERecord?id=CVE-2025-5918
> 
> See the release notes:
> - https://github.com/libarchive/libarchive/releases/tag/v3.8.0
> - https://github.com/libarchive/libarchive/releases/tag/v3.8.1
> 
> In addition to the version bump, the following changes are required:
> - The COPYING file has been edited upstream because of filename change 
> on a
>   sub-licensed component; see
>   
> https://github.com/libarchive/libarchive/commit/c26f0377457db392bd57a640e8fe25506120f810
> - The upstream "sha256sums" is currently unavailable, so the archive 
> checksum
>   has been computed locally
> - Drop patches for libiconv in configure.ac, which has been properly 
> addressed
>   upstream in https://github.com/libarchive/libarchive/pull/2611
> - Following the above, AUTORECONF is not needed any longer
> - Drop mbedtls patch that has been applied upstream
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

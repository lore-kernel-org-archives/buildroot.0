Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEBAAC7115B
	for <buildroot@archiver.kernel.org>; Mon, 23 Jun 2025 16:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74CC681F4D;
	Mon, 23 Jun 2025 16:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FcuwpxFb4n50; Mon, 23 Jun 2025 16:16:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1FE68100C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1FE68100C;
	Mon, 23 Jun 2025 16:16:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E1D8154
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:15:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B947403AB
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:15:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3va1AoMfRQcE for <buildroot@buildroot.org>;
 Mon, 23 Jun 2025 16:15:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6820A4032E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6820A4032E
Received: from mail.tkos.co.il (wiki.tkos.co.il [84.110.109.230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6820A4032E
 for <buildroot@buildroot.org>; Mon, 23 Jun 2025 16:15:56 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id 450FB4402AC;
 Mon, 23 Jun 2025 19:14:41 +0300 (IDT)
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>,  Pierre-Jean Texier
 <texier.pj2@gmail.com>
In-Reply-To: <20250623160224.953975-1-titouan.christophe@mind.be> (Titouan
 Christophe via buildroot's message of "Mon, 23 Jun 2025 18:02:24
 +0200")
References: <20250623160224.953975-1-titouan.christophe@mind.be>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 23 Jun 2025 19:15:51 +0300
Message-ID: <87frfqjux4.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1750695281;
 bh=aQdFmxqVhJCo+/DCzml+ysZuGOYq2GPjkQnRwX+6iuQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=O6sSr0xREazAxOPrIgLHHxanvbXyqDeruoPe4/DAyES/JqOKluO+K+8Pdhfbfa96R
 YtOiD0Q0k7bhpkB7YhoahYT5569aex1d1ldgb/GxnL3MZQufJZfCswrxtYKH9mwyaF
 zhLIV36f4pMh9xB8tYzk1j3LgnbWCAqsTuXPojI8WAgpnR7/Lru8tfeYHCS5Sh/G/Q
 wg07TE/fg08dFAefzlFFfkVyUqQlz2N+X5+j/qdLHIxvjanOURAWMvi76ntpuUV4zW
 KjWSn/F96C4pa6uRcZTWwgm4Mm4D6r3w8z8o80JF6Yqm/Mz6FWI6jLPYmEj2DQvSEc
 3+/IeO/we2xjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=O6sSr0xR
Subject: Re: [Buildroot] [PATCH] package/libarchive: security bump to v3.8.1
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

On Mon, Jun 23 2025, Titouan Christophe via buildroot wrote:
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
>     Libarchive: reading past eof may be triggered for piped file streams
>     https://www.cve.org/CVERecord?id=CVE-2025-5918
>
> See the release notes:
> - https://github.com/libarchive/libarchive/releases/tag/v3.8.0
> - https://github.com/libarchive/libarchive/releases/tag/v3.8.1
>
> In addition to the version bump, the following changes are required:
> - The COPYING file has been edited upstream because of filename change on a
>   sub-licensed component; see
>   https://github.com/libarchive/libarchive/commit/c26f0377457db392bd57a640e8fe25506120f810
> - The upstream "sha256sums" is currently unavailable, so the archive checksum
>   has been computed locally
> - Drop patches for libiconv in configure.ac, which has been properly addressed
>   upstream in https://github.com/libarchive/libarchive/pull/2611
> - Drop mbedtls patch that has been applied upstream

Since this patch drops all configure.ac patches, do we still need
AUTORECONF?

baruch

>
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  ...iconv-to-the-.pc-file-if-needed-1825.patch |  31 ---
>  ...o-not-add-iconv-for-Requires.private.patch |  27 --
>  ...mbedtls-version-3-compatibility-2602.patch | 238 ------------------
>  package/libarchive/libarchive.hash            |   7 +-
>  package/libarchive/libarchive.mk              |   2 +-
>  5 files changed, 5 insertions(+), 300 deletions(-)
>  delete mode 100644 package/libarchive/0001-Revert-Only-add-iconv-to-the-.pc-file-if-needed-1825.patch
>  delete mode 100644 package/libarchive/0002-autotools-do-not-add-iconv-for-Requires.private.patch
>  delete mode 100644 package/libarchive/0003-Fix-mbedtls-version-3-compatibility-2602.patch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

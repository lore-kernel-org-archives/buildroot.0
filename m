Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83326CCF9EA
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 22:22:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 585B840C2C;
	Mon, 27 Oct 2025 22:22:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ADz3Km3zG1l; Mon, 27 Oct 2025 22:22:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 731CC40CD6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 731CC40CD6;
	Mon, 27 Oct 2025 22:22:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 565F9939
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 22:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BEA040C2C
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 22:22:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cvMnE9nvIR6n for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 22:22:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 710FE40BB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 710FE40BB1
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 710FE40BB1
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 22:22:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 11A4B2003AE;
 Mon, 27 Oct 2025 23:22:26 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 27 Oct 2025 23:22:26 +0100
MIME-Version: 1.0
Date: Mon, 27 Oct 2025 23:22:26 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20251027212015.47362-1-thomas.perale@mind.be>
References: <20251027212015.47362-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <eb64619c6c0fdd9b0194b3291602b1b1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761603748;
 bh=AWeilDzfnpWJEgjD0mY7tBv6K4SnleUJ62ZK8pZr/1g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aYuYd7byAKXO1RuM3mZsLW9rWL/U2WCIP4FQCO0QMgPy3PpnrPa0kfCU07MHjPDKU
 0AIykCp6OLPTuObWQQKzXahFWvostRopAyNR+c0fioxfloblD7tFDCT0kGLKP4JZT8
 xabNmSnT/OuTd5/qTH3+gUJw9qiJKwDV0H3TJRSD0TLjxU3xJXljc/BeNL35lnGP/p
 Vv9OEjsyx9sMV5d7aqzb3HmFv2DwOy255zvNcMy6PQqiCNjUmhJl4dnJn4T1Z2tOdO
 65gMlcKGH0lmgDu2tIbRSxBG7oj5HRK+sWFY59qi+u1RwSY3fvoICVcl2hflr85NpT
 MTmi0qz+3b/GA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aYuYd7by
Subject: Re: [Buildroot] [PATCH] package/imagemagick: security bump to
 v7.1.2-8
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

On 27/10/2025 22:20, Thomas Perale via buildroot wrote:
> For more details on the version bump, see:
>   - 
> https://github.com/ImageMagick/ImageMagick/compare/7.1.2-3...7.1.2-8
> 
> Fixes the following vulnerability:
> 
> - CVE-2025-62171
> 
>     ImageMagick is an open source software suite for displaying,
>     converting, and editing raster image files. In ImageMagick versions
>     prior to 7.1.2-7 and 6.9.13-32, an integer overflow vulnerability
>     exists in the BMP decoder on 32-bit systems. The vulnerability
>     occurs in coders/bmp.c when calculating the extent value by
>     multiplying image columns by bits per pixel. On 32-bit systems with
>     size_t of 4 bytes, a malicious BMP file with specific dimensions 
> can
>     cause this multiplication to overflow and wrap to zero. The 
> overflow
>     check added to address CVE-2025-57803 is placed after the overflow
>     occurs, making it ineffective. A specially crafted 58-byte BMP file
>     with width set to 536,870,912 and 32 bits per pixel can trigger 
> this
>     overflow, causing the bytes_per_line calculation to become zero.
>     This vulnerability only affects 32-bit builds of ImageMagick where
>     default resource limits for width, height, and area have been
>     manually increased beyond their defaults. 64-bit systems with 
> size_t
>     of 8 bytes are not vulnerable, and systems using default 
> ImageMagick
>     resource limits are not vulnerable. The vulnerability is fixed in
>     versions 7.1.2-7 and 6.9.13-32.
> 
> For more information, see:
>   - https://nvd.nist.gov/vuln/detail/CVE-2025-62171
>   - 
> https://github.com/ImageMagick/ImageMagick/security/advisories/GHSA-9pp9-cfwx-54rm
>   - 
> https://github.com/ImageMagick/ImageMagick/commit/cea1693e2ded51b4cc91c70c54096cbed1691c00
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

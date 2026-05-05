Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B8C4CD3430
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 08:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23E8940977;
	Tue,  5 May 2026 08:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zJetSUJb0QMS; Tue,  5 May 2026 08:59:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24F6E408F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777971571;
	bh=BEyQM3izMaErRLu8z3YAOievEtMJgYjQS+pB/LyN6uo=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=FbojNqlC66GTIBJ4K463mgkylTzoxDcDSLOyvyvtSpoAk4fUnbkr6DvvPBzggJbMM
	 Q8mc0KKPkRQaJ6DZ6W8kct+JYRNxh4GZ0dmUeW0axI0ro2JcIOCwGBkv9l4quhRvxq
	 V2YX8OGM+m0pwiGJ2Aa0NryvJVksBfM542VmW4+HnG+dbX9+AJaxhfmN+eYO7l+kwA
	 d0xavPucOyvWibnQPioMLy0/ciPXy5qrGbo0H6bJofBAv3xB/sVpaTrbp0TkyPhs8O
	 EuE0dcz9D5wvXkWuDYy1bc2fOIZzUQQrc9MMtsY3fIM0EUq4JKeqRG86gM7aXWR38u
	 yp7TDHqe83RdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24F6E408F1;
	Tue,  5 May 2026 08:59:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3167C2A8
 for <buildroot@buildroot.org>; Tue,  5 May 2026 08:59:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BE7940743
 for <buildroot@buildroot.org>; Tue,  5 May 2026 08:59:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CDqjsAnEdyLN for <buildroot@buildroot.org>;
 Tue,  5 May 2026 08:59:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CC37403E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CC37403E4
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CC37403E4
 for <buildroot@buildroot.org>; Tue,  5 May 2026 08:59:26 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 0C1AA2C88D23;
 Tue, 05 May 2026 10:59:23 +0200 (CEST)
Message-ID: <2f92168f-0d36-4f68-bcdf-7c3bb168c770@bubu1.eu>
Date: Tue, 5 May 2026 10:59:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daniel Houck <Software@DRHouck.me>, buildroot@buildroot.org
References: <20260504230627.2963070-1-Software@DRHouck.me>
 <20260505011139.2973700-1-Software@DRHouck.me>
Content-Language: en-US
In-Reply-To: <20260505011139.2973700-1-Software@DRHouck.me>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777971564; bh=yIiaa0fV3Mk+ryzJM8pw4sqPiETsq4Zhm3SkxYpeprw=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=KQQFhI+QHh+h67jUTy6itCmXZCUgC0oA3Niy6mSuuzP1Brd7YsrqEAPHs7JcRljST
 jJulIuH4PzzjxeB07orQrKpe3ze3cPtemXoyUaTtxT1VHz/Ekj5BgtcLxRlnnLKFol
 ZG1aAx4SbDprqwqWkjlXyt1n5arH5fafBHaqQnAnCbP8E2sHKa1uWE38freBuMBl3J
 MS1+VbDLocvRLlDMXLGnSa5zSBkSVPoc+2sA/mE8WaBNCSihHCLKad4vhWEAQ5c4HT
 QfI9zN2Q+ZXsAGLPEmKoDxnAAhlouikUiRLMJ+UdcwWSk2cCQnaZBQ6RZdmk8s9Tar
 wbwRXvHTaKtiw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=KQQFhI+Q
Subject: Re: [Buildroot] [PATCH v3] package/make: fix build with musl and
 gcc-15.x
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 5/5/26 03:11, Daniel Houck wrote:
> Patch the parts of Make that use code invalid in C23.  It wasn't
> included when compiling with glibc but failed to build with musl.
> 
> Fixes #176.  See also https://savannah.gnu.org/bugs/index.php?68302
> 
> Signed-off-by: Daniel Houck <Software@DRHouck.me>
> ---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

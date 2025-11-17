Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256CACE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 21:31:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E90A160EA4;
	Mon, 17 Nov 2025 21:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y9odh1bdhSWF; Mon, 17 Nov 2025 21:31:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1953060EFB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1953060EFB;
	Mon, 17 Nov 2025 21:31:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 192A81BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0269582796
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:31:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sWKp_0BwFQN8 for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 21:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0989782779
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0989782779
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0989782779
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 21:31:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9EA25780372;
 Mon, 17 Nov 2025 22:31:27 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 17 Nov 2025 22:31:27 +0100
MIME-Version: 1.0
Date: Mon, 17 Nov 2025 22:31:27 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <aRt1RqKmwVREhyar@landeda>
References: <20251117191814.2160335-1-yann.morin.1998@free.fr>
 <aRt1RqKmwVREhyar@landeda>
User-Agent: Webmail Free/1.6.11
Message-ID: <6bde27b81df6d80fbabf2d992cb61b9f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763415088;
 bh=72aptgEgEjNWy3zefbtHke1fsqdqURQYAy0qo19o2Ws=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p1YCXTKH6K3kp1+7x6vNt0yxR+81loQYYS/cphkdVJD7LEEdiikf89wIr7wG15qJt
 kqZvlatNHHPFrh4OoW/bARcralV8wk3IEQJPEVwZNy9w61toPezbrUtxyRLnuiHdjx
 6GEbTpE257AfLMfW34sVrbBPSaGyQPh8jnH1vc+Hi7/FD1+HYYI5BUzXMGIm2ZsDEJ
 TnSalD744aOVYPYB6VrquiIrxxnKWlsT26npOOYvsJn6TjwHgMlZi8Uqp61ddOCXCe
 z8lqYBtEt74vOPtGDnHbTDeavdjty8WNt9vx8roSh/8m3RICrCVph1sSfNVPZoF46E
 7cpXFWuKVQNtA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p1YCXTKH
Subject: Re: [Buildroot] [PATCH] package/distribution-registry: fix build on
 i386
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

On 17/11/2025 20:19, Yann E. MORIN via buildroot wrote:
> All,
> 
> On 2025-11-17 20:18 +0100, Yann E. MORIN spake thusly:
>> The S3 storage drivers defines the maximum size of a chunk to a value
>> thqt does not fit in the native integer on 32-bit architectures. This
>> causes build failures:
>> 
>>     registry/storage/driver/s3-aws/s3.go:312:99: cannot use 
>> maxChunkSize
>>     (untyped int constant 5368709120) as int value in argument to
>>     getParameterAsInteger (overflows)
>> 
>> Ideally, we'd like to use a build tag that refers to whether the
>> architecture is 32- or 64-bit, but there is no such flag. Sigh...
>> 
>> Instead, backport a patch from upstream that papers over the issue, by
>> usig the i386 build tag (of course, that still misses other 32-bit
>> archs, but are they really relevant in this case?).
> 
> Damned, I forgot to mention:
> 
> Fixes: 
> https://autobuild.buildroot.org/results/8fa9c5f63f690b27336051be5178f0516e0c54d4/

Applied to master (after adding the "Fixes" link). Thanks.

> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

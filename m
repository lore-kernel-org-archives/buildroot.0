Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E5BC79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 10:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F1F405A4;
	Sat, 12 Sep 2026 10:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfbTYMUsJNag; Sat, 12 Sep 2026 10:49:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 35DA3405AA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789210189;
	b=etalu3P2tDf9e8x1DqsJIGVYbToUr8UuCyk2ixNwdB+kauAX0OGOgm/Tyfnnk58tuwin
	 763pfKxYQE2f+z9pu9Vmwmxtjl4R30g4Tar4rOMRyjZuj/WhcEwPVqBl4SUUxsMjRRoaY
	 iO38MCNqKGs0/HPGcQ0BukGVxFrX/yC/jjyAtSM+oO9V1hAK1E/WqFi/seBqlpHe0R9cN
	 VZruUzjYgRXYSCzFCuME9K/AijuAyLLWf1Kj6a+qPqcckJB68o8m6dRDrav3JNLlIzaBb
	 GcfuFiJB98ZSZgEgIKrz/Tvfv+OuZl2NErxOVUPjbjXvEkAHEfwAMifdwGkOHChQYBQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789210189;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=LagaW34zot3s9dyuYXMFfa9kQNWpb9YhdnUsBxBiWRc=;
	b=onlPNcmTbl5btBHnP6JDMAKGTHjUU36BFgNhYCgZdDZHRmPQx8R5d9g468IKyiTPJ9SV
	 n946gUc1KTDEu7zZqOsXHoPaK5mvVZ97JIegjx0jiuFpDQ2ufJNDgwZew4MHzLfA/UA4w
	 mTopDSPyxJG9rL4PZlsxdxenZaMXr4qzRvCJ/jElGGG3JT8llvZjHnYJ9gxV+7IRoEMS8
	 aRT568V2dUdHAwqJJbgGnmJcYLHJmpv6KkSdybij2mvXxnarEAlAnWuS3VJzdI8kjxnv1
	 p5e6oTm8XqSp8fPpWFxjf6pOs/lpPBHXbkEYaOAeLrubqS4b0PQUcz6sJk0daiyx32w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789210189;
	bh=LagaW34zot3s9dyuYXMFfa9kQNWpb9YhdnUsBxBiWRc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=c2qSQz0JfLSFQtFab6YnMWCfFA4kJAUBxYR69mlSAvfYMCgCSGzeha5FSeRbaU1gg
	 dirRK8SY9R5cvZd5e79f27SzZUgFArcDV9mi/gKTxmiykXQwZXaqE0jAqbWSq3AdS6
	 QlsikNSKInl+SoiYgaRNkWxccBce+OM3hhegypFofprTyBggYTMUuqpT4KXmDIvpky
	 tA438lhwR8uTr0OEymnc8QIbV9WdIVvkWdginqAbIQWrjM7UJKCYLuUZI7+UrYxdow
	 EMWbIU7je911i/2sgibmzpFikHsTO82fQZpMLjE+ieTpitxo4PXX0R8jZHeQffur/B
	 pGd2T2RQHpN6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35DA3405AA;
	Sat, 12 Sep 2026 10:49:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5490701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CB3C4405AA
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lcfEv3ikpxbS for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 10:49:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org EB87A405A4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789210186;
 b=gyMEN3s4C+TyBANJmigZLEpSgiUaZ9HuEgmQBMG145BRxcRPf2IwzEScWX8WLYC1duvF
 dtyz+XdsFG6ryfcuvy/YFgZl4Bm9+1/8iCVD+H6ABte7pjOo6IGqFiH203PY6QeRsLkNO
 N0sZVobWGtAGlYDisWUV0GZWYozRtPtLaz8NWpVmCNUxMAvcV6zpHx+CbaOF0LC/yqbdm
 SZJLZj0SL/GPaD2s8ZfD1bwxyFSmKr3SCh35ijEWe1dWU0ZLLfAJfYlDe4kKHiau1UCyr
 ynLZHro8rwliKbulhVP0zTMEcJFXux+XaFrmatFIAAy9MoLLTTrtxwWFCRdC5MDi+ug==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789210186;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=aTf5rfrImVSmxd0fl4zu3+XuxVB/YmLTUDmS8omAGUU=;
 b=ahT4qeBYUjmR7eB0BKMLSQelnwdP16l9ZeRhXUHQpSYjPznJGRvhRmlVra+yRTkW2TVt
 W2vxuYF/XEzNUL68MuqXQRQVQaDLKIkmu1GJbUAAHjfxeECJczTfOKKAf88D9HP2QH12G
 dJBLBkaN9GswojbvF7jLiSVQAd237DiFOcgkdEP1VAuThcvydbkZzGWdg9/p0eolbiVE6
 MvPaVT+NI2QPlemCBY+rzQjl+eqGyYIEc4akZWKZVJ7BBj2snOi2U61h1rIbPYeu1vb9j
 pKZMP4nwjqhvNuBAr01BSOxYU0JMoWZbpxVD3n4ObeJupL/sJqoRH+kANJjjqI/dimA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qX4Mqf+R; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::15"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB87A405A4
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 10:49:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B93DF78035B;
 Sat, 12 Sep 2026 12:49:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 12:49:36 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 12:49:36 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Angelo Compagnucci
 <angelo.compagnucci@gmail.com>, Francis Laniel
 <flaniel@linux.microsoft.com>, Asaf Kahlon <asafka7@gmail.com>, Robert Rose
 <robertroyrose@gmail.com>
In-Reply-To: <20260902142754.376028-2-buildroot@heine.tech>
References: <20260902142754.376028-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.19
Message-ID: <6e2b265416425a3023c3b0f6bcdf2c96@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libabseil-cpp: bump to version
 20260817.0
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

On 02/09/2026 16:27, Michael Nosthoff via buildroot wrote:
> - libabseil now requires gcc >= 10
> - drop patch trying to fix build with gcc <= 12 as this is now handled
>   in protobuf >= 35 directly.
> 
> Changelog:
> https://github.com/abseil/abseil-cpp/releases/tag/20260817.0
> https://github.com/abseil/abseil-cpp/releases/tag/20260526.0
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

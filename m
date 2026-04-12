Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4BBE937EA
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 16:23:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 403C461693;
	Sun, 12 Apr 2026 16:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XBPtkGiNqhVq; Sun, 12 Apr 2026 16:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F39BC61691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776010992;
	bh=r2HWHp5yfRP4bJm4KRtFLs/lHO/6vTT7SUXzvAYLbfM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BBx/WA0OSHpUbpLxeEntWNISnOOnZH10pywv26QPykSRTrMoHNujJTUmNqLXH8N/e
	 rCMraaZktZY96t63qDwcZcg32PTkaXRXA5t9eh9YUDCoNp6lfCmtJBS78aoi7FGsmu
	 niyGn0d7b3nCc64pY9rC2D71HOK+ATupXTfohAyqcf2uHRmuKSS2/O2Dif6W07f9VY
	 mFua02ZOJLCxW/e2dmZrtYjmp34kVfu+oMIX6VQTW0HYDN10LuaqVMnYdSPi3uLMc6
	 DsitsClyuY40wcaJ89SUN27Tmf3DwmkxmHxZqPzt9ZxyhwU2j8iA3SkkMwAYdEr4S+
	 g3f3BuFXOdkYw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F39BC61691;
	Sun, 12 Apr 2026 16:23:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A339A237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:23:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8881E400C7
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:23:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1acURAWcTe22 for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 16:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 61115400B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61115400B0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61115400B0
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 16:23:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 9485E2003E0;
 Sun, 12 Apr 2026 18:23:04 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Apr 2026 18:23:04 +0200
MIME-Version: 1.0
Date: Sun, 12 Apr 2026 18:23:04 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
In-Reply-To: <20260410065458.1768122-1-titouan.christophe@mind.be>
References: <20260410065458.1768122-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.14
Message-ID: <f63a4960e37111739c6919bfe819f1ac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776010986;
 bh=SZ65i1NvdANg0+RYor7yLmMEkenfMlDgyp13Qye/1lQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YcAarL3ufYrOLrFZpYXzC3DQIQkUnwMzcKsx150VrweM/n9k+ND7te+lzlgq0OYKI
 us+OcBHvlOp4O7Pk2PPQekQNv4fvjOcJ6jMEakQyKglFOQXwOJrIVQdLYxR56k8mkG
 SVTwl+rAh7ERexhiQJs/trM3RNy6A2ddOgWLUi2pJcLIzuc+se7cK9BWDPIDv79BQf
 7Y9n9wykz3ixv3GxB4s6jQAt1IMahHB5O8/jSNh0BLIZqfZPGFdghb6DS6sOiqfXcc
 O1yfq/dXTwNRmG2SwG5hSJTKFHe+8XYQ95ZrpgVO6tx1xtaROZ6OPbFGBqtud4MEo6
 8EU9SdivGCZ4A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YcAarL3u
Subject: Re: [Buildroot] [PATCH] package/cpp-httplib: bump to v0.41.0
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

On 10/04/2026 08:54, Titouan Christophe via buildroot wrote:
> See the release notes:
> https://github.com/yhirose/cpp-httplib/releases/tag/v0.41.0
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

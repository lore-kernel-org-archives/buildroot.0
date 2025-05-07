Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61075C3ABC0
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 16:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2610060C31;
	Wed,  7 May 2025 16:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KBBdEEAcHb9A; Wed,  7 May 2025 16:40:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6936760E93
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6936760E93;
	Wed,  7 May 2025 16:40:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C4D3950
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 31FD883A8A
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ub4Pm7ELTuhJ for <buildroot@buildroot.org>;
 Wed,  7 May 2025 16:40:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92CAB83A72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92CAB83A72
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92CAB83A72
 for <buildroot@buildroot.org>; Wed,  7 May 2025 16:40:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 59AA013F8E2;
 Wed,  7 May 2025 18:40:53 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:59608])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 07 May 2025 18:40:53 +0200
MIME-Version: 1.0
Date: Wed, 07 May 2025 18:40:53 +0200
From: Julien Olivain <ju.o@free.fr>
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250507093436.1018988-1-titouan.christophe@mind.be>
References: <20250507093436.1018988-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <264c60438d06e0aa3330d77e3529f970@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746636054;
 bh=VUGkeZ3EOqE6d0PZDJzbkJEGTKsLbqbaivln98+rKi0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=W8ujrCbF50apj8QqVy4yC2C1N7+3xybZmrdhw12dTV/cIGwYlU9Q3oJeQgHKVcf7v
 TFcAStL/UId+2ZJ06uKmPcDuolGCHXR7gLEBh3AbOEkacKmrUjqopIxzC2esZj2gcO
 moKssJHs1nVw/tqyAPcOWYT8X5sEzWAsUkjjz2zkysYdzf/XsdAs3kcgqXK/3rVljx
 0ePVGW7jtBUUv20QEltN772rZGc4mIzjofqzPepNqBTuxlOBO5CcD5sDkxJE0wVYsA
 1/dqpY4ef9mi58F1eCx+1audjjotwR8jYcyCcujB/QUMqz6QsiQFSqcU4HqSeWXp/b
 x7OYCH6KKr3Cw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W8ujrCbF
Subject: Re: [Buildroot] [PATCH v2] package/redis: bump to v8.0.0
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

On 07/05/2025 11:34, Titouan Christophe via buildroot wrote:
> Since 8.0.0, Redis now uses the fastfloat library as a bundled
> dependency, and this library is written in C++ (even though the
> rest of Redis is in plain C).
> 
> Therefore, we now require a toolchain with C++ support.
[...]
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

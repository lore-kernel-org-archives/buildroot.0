Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E4B8C61DB9
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 20:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF67B605F4;
	Tue, 25 Aug 2026 20:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LHQ3N0XdAKiz; Tue, 25 Aug 2026 20:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787690881;
	bh=/L/Ei/MOhbbdY7kUYoJJdihsGUaAeGakzQaDxUJJYig=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Xj6mOIXsYXLjr9UlLVONJD4zN+IKLO7XmOdVWyVqGUV5GJ6tBQn9ArX/20GRz8Hv/
	 qtlfreJUDl3iOn59pnafYYdO7HDI/h/7OqbWxmF0GaYUDiEFYuAisn4uGijvuvI61m
	 tlmxBaAE4K9mxiPx+WNYCIB1RA+ku1Dqmvk5piorZeVEFLcAbiO/muhDBWmtlZqJkE
	 41nS+1CFq5GscgfozY9+bg0INZgfQ0B9Q2JLnvEPTHKYKr4KGBB8AmQbJbOPz/Uhg3
	 k/vEEU8jBVJ4+cfFOTo17AAwb3LiMcb8TBW0IZXnY/NSFcjzp7dJcQtL2GEl5i1H4K
	 fbTklNMVr+eAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0FB5060603;
	Tue, 25 Aug 2026 20:48:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EA61105
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4448A60603
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K6VdM4FpozyE for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 20:47:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E57D605F4
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 20:47:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 14F1A5FFB4;
 Tue, 25 Aug 2026 22:47:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Aug 2026 22:47:55 +0200
MIME-Version: 1.0
Date: Tue, 25 Aug 2026 22:47:55 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260817161004.932094-1-aperez@igalia.com>
References: <20260817161004.932094-1-aperez@igalia.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <bd63efae24d0367076e8c973e956cacb@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libpsl: bump to version 0.23.3
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

On 17/08/2026 18:10, Adrian Perez de Castro wrote:
> The most relevant change is included in 0.23.0, which fixed handling
> of trailing dots (so e.g. "co.uk" and "co.uk." are treated as the same
> suffix). Otherwise, it's mostly cleanups and support for non-Linux
> platforms:
> 
>   https://github.com/rockdaboot/libpsl/releases/tag/0.22.0
>   https://github.com/rockdaboot/libpsl/releases/tag/0.23.0
>   https://github.com/rockdaboot/libpsl/releases/tag/0.23.2
>   https://github.com/rockdaboot/libpsl/releases/tag/0.23.3
> 
> The changed hash for the COPYING file does not imply a license change:
> it is unchanged, but the copyright year was removed in favor of a note
> telling to check the Git history.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

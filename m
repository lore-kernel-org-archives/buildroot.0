Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A3D3C36010
	for <buildroot@archiver.kernel.org>; Sat,  5 Apr 2025 19:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 589B360631;
	Sat,  5 Apr 2025 19:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hjgty4jN7Diu; Sat,  5 Apr 2025 19:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6BB56088E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6BB56088E;
	Sat,  5 Apr 2025 19:45:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D74455E
 for <buildroot@buildroot.org>; Sat,  5 Apr 2025 19:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B37E16088E
 for <buildroot@buildroot.org>; Sat,  5 Apr 2025 19:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQzzHKXTOt6E for <buildroot@buildroot.org>;
 Sat,  5 Apr 2025 19:45:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6CB660631
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6CB660631
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6CB660631
 for <buildroot@buildroot.org>; Sat,  5 Apr 2025 19:45:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id BFEC85FFC0;
 Sat,  5 Apr 2025 21:45:39 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35610])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 05 Apr 2025 21:45:39 +0200
MIME-Version: 1.0
Date: Sat, 05 Apr 2025 21:45:39 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250404224700.3410215-1-giulio.benetti@benettiengineering.com>
References: <20250404224700.3410215-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <dba724c32d2420d365c2f2d2035ab694@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743882341;
 bh=Xc+XFiD4fNzmQCTan6dJTRnFo7EXtNaO1aj7+ZBuA4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DUcJufcnlcCMeXCeU/1OOzcppqOeKOZNz5bH2noJEGQNAX7fyqUUaKo227aXBxd3B
 1Oxk5Xx5DJQQKXvfTl8VYV2k/kXGyBuoP65AxiGwQfMRlUOU6zYYfIoUI4iO1vGxgO
 7USHC7FBUWyTG7LGiGKXvYlB/mu3+3lIChlh9pIUWIXLwKeQ6QOkzp8ys5JZ043uPs
 D0z2oEDD9RGiMcahAazjsyqOOcimdWtMQVegaSdShdb79IzyLmFyqh3t5CMd0M+Kin
 OpsG1dQ5V8QFdnQ1OU+vbdJrFWLQ9iRtO5gAK3/GTCF5QCcYSRTLRmcmYRBk71sfHb
 eMy7dKOAMBmjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=DUcJufcn
Subject: Re: [Buildroot] [PATCH] package/esp-hosted: fix build failure with
 Linux 6.13.0
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

On 05/04/2025 00:47, Giulio Benetti wrote:
> Add local patch pending upstream to fix renaming of spi_alloc_master() 
> into
> spi_alloc_host() during Linux version 6.13.0.
> 
> Fixes:
> https://autobuild.buildroot.org/results/68ce3721475d259a0db42b7ab84ef08ed7fba00c/
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

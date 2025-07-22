Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F1AC83F1A
	for <buildroot@archiver.kernel.org>; Tue, 22 Jul 2025 17:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10AEF40C71;
	Tue, 22 Jul 2025 17:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iU9bbiO2oFHz; Tue, 22 Jul 2025 17:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FBA141110
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FBA141110;
	Tue, 22 Jul 2025 17:11:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AF695CD
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 950A9807C5
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:11:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNpnKwUvH30N for <buildroot@buildroot.org>;
 Tue, 22 Jul 2025 17:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BF71D807CF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF71D807CF
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF71D807CF
 for <buildroot@buildroot.org>; Tue, 22 Jul 2025 17:11:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id A5B245FF88;
 Tue, 22 Jul 2025 19:11:46 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Jul 2025 19:11:46 +0200
MIME-Version: 1.0
Date: Tue, 22 Jul 2025 19:11:46 +0200
To: Lance Fredrickson <lancethepants@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250722050542.2949118-1-lancethepants@gmail.com>
References: <20250722050542.2949118-1-lancethepants@gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <e5bc9296299fe91ae488a3e9a1b6365b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753204307;
 bh=KvJrz2Df0i4ZnAin/TAigHXaKGPBW/1vzuKme6z5CwY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DJxqMqSeYbBbqbRkLciD39X+xaKKK5YIXQ341bgams8yBY67J00nt1svSo4JS6VkA
 ijHTe7nHhCiHoZLzeWKSARs1ntJ6B1PlEAtx8RmgHBLyRPXRWfNisQRfAS2ev4cIS4
 1e9DCLFBm2ZdmfJLuTmGuiEp/AphTWXFcG7B3Rm4UjVMqb/m75/sxDjE9vie4Fcx6T
 OsRNUu5eMdSWpj4WuxqHfujORiXWmB7zeLnZFt3+jeDwaiM0Cuom71SMjGN7d3Flh1
 tdF6nsKcVFJEdDi+578dIVM63dZ19E5G/He86rXxAc5eGTD1rGEI0Hq3uZNWDCRxG0
 X17giw9Ymx0tg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DJxqMqSe
Subject: Re: [Buildroot] [PATCH] package/ncurses: bump to version
 6.5.20250720
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

On 22/07/2025 07:05, Lance Fredrickson wrote:
> From: Lance Fredrickson <lancethepants@gmail.com>
> 
> Release notes:
> https://github.com/ThomasDickey/ncurses-snapshots/blob/v6_5_20250720/NEWS
> 
> Fixes observed issues with htop on aarch64/musl after the last ncurses 
> update.
> 
> Signed-off-by: Lance Fredrickson <lancethepants@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

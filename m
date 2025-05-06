Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E72C3ABBE
	for <buildroot@archiver.kernel.org>; Tue,  6 May 2025 21:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30C1481E72;
	Tue,  6 May 2025 21:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xb3777bBROD7; Tue,  6 May 2025 21:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F55181E85
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F55181E85;
	Tue,  6 May 2025 21:04:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A33EB1D72
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A03F160D69
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:04:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ONkfWu8OexYM for <buildroot@buildroot.org>;
 Tue,  6 May 2025 21:04:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 09180606A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09180606A9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09180606A9
 for <buildroot@buildroot.org>; Tue,  6 May 2025 21:04:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id A04CE200528;
 Tue,  6 May 2025 23:04:26 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:52088])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 06 May 2025 23:04:26 +0200
MIME-Version: 1.0
Date: Tue, 06 May 2025 23:04:26 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Louis Aussedat <aussedat.louis@gmail.com>, Sergey Matyukevich
 <geomatsi@gmail.com>
In-Reply-To: <20250425222647.2340402-2-giulio.benetti@benettiengineering.com>
References: <20250425222647.2340402-1-giulio.benetti@benettiengineering.com>
 <20250425222647.2340402-2-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <bf095feef054d99bfaf5a281439c0b87@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746565471;
 bh=1MF9T73v/6P1ZRVXkHkISv4GG1HrFbBJVE80uUlmwFQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jCUjKwGZ8mmuKL21dwIbH/sF9ghJKYEQoIB8sJdIn4+T4xs0yygwUc4ew80kOfslZ
 LZ+TkeF02J8UMDQWQaZNcTCS4wwlWnDVFvS23ux600kUAB0c3gVSvLImK5O157KGN6
 /sZXE/zCU24a5WgpYy0SLwj9ut8hJbn7f1BGdJxb47CZZIk1wtGVAajh4Pp73+SRTv
 dNhCIByReMZQweGJhOMhAPHaZa/mT2+VquBxver0Xbznj/O3Gg4zxQJBVy8cb+oCCy
 y84GYWHZmg0Wj40m1NfJIT0P5HHmUvWbiDnyOj4cEV6Q+0VDByuNNJumTXbPK4A/+B
 /vD2z4/edbS1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jCUjKwGZ
Subject: Re: [Buildroot] [PATCH] package/rtl8189fs: bump to version
 2025-02-24
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

On 26/04/2025 00:26, Giulio Benetti wrote:
> With this version we can build with Linux 6.14 and support for
> cfg80211_rtw_get_txpower() has been added.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1675CCD1AA
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 20:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C416760D59;
	Tue, 21 Oct 2025 20:38:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytHzoxa34JoK; Tue, 21 Oct 2025 20:38:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3702960BEE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3702960BEE;
	Tue, 21 Oct 2025 20:38:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF71F277
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:38:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4E7760BEE
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:38:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aoT_0JrZB1Gm for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 20:38:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E216960B33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E216960B33
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E216960B33
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 20:38:32 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 56D0D5FFB4;
 Tue, 21 Oct 2025 22:38:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 21 Oct 2025 22:38:27 +0200
MIME-Version: 1.0
Date: Tue, 21 Oct 2025 22:38:27 +0200
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, Sen
 Hastings <sen@hastings.org>
In-Reply-To: <20251021165818.1936386-1-buildroot@bubu1.eu>
References: <20251021165818.1936386-1-buildroot@bubu1.eu>
User-Agent: Webmail Free/1.6.11
Message-ID: <56ef2e30e5e883e068dcc4bb3758f76d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1761079110;
 bh=VCZF2iUEN7Oq6yOEOem4jiG0AvZVZMScB0o9Nv7jwZA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VjhQIChS74kQK9WCX+WvxRn2cYe1QdJN1eCCzBbnzavQLrqrrZTCztKN5yMHyR5DF
 qREh0MH/Xq3Qeui1iMNRQ8OA89NM4tLQ7P6kaNN8Fx9u69uHrhAYIxanqWQMsHWL4R
 uc2DVz521Av7+vbiNI/+s9H8IEyXCoobzN/ELMyI7Q7JYPRrdtTz617KHCQyMBgp8s
 vKDaL1/4G1ABTRzbeRYi9qLXqql/eiKf6ISMrNgKGqBkt5GUCvq1GW5sJbSwIU8tNn
 tewVGYWXDS74F85GsRsT1YrqIZNZ2PBNkZNlcNhSkwM3xH0faCZeCLsWqTs5TALQPD
 OFm5h7rDMSpZw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VjhQIChS
Subject: Re: [Buildroot] [PATCH] package/systemd: bump to 257.10
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

On 21/10/2025 18:58, Marcus Hoffmann via buildroot wrote:
> Changes:
> https://github.com/systemd/systemd/compare/v257.7...v257.10
> 
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

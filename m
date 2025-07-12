Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA7CC83F1D
	for <buildroot@archiver.kernel.org>; Sat, 12 Jul 2025 20:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C8C981E7B;
	Sat, 12 Jul 2025 20:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkubhmNJZfQP; Sat, 12 Jul 2025 20:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C4B081E0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C4B081E0C;
	Sat, 12 Jul 2025 20:29:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 66180DF
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 20:29:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BDB841149
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 20:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V2XrLvOwHvN9 for <buildroot@buildroot.org>;
 Sat, 12 Jul 2025 20:29:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48A6541125
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48A6541125
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48A6541125
 for <buildroot@buildroot.org>; Sat, 12 Jul 2025 20:29:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8DFB15FFAA;
 Sat, 12 Jul 2025 22:29:29 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Jul 2025 22:29:29 +0200
MIME-Version: 1.0
Date: Sat, 12 Jul 2025 22:29:29 +0200
To: yegorslists@googlemail.com
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20250708142138.2223430-1-yegorslists@googlemail.com>
References: <20250708142138.2223430-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <8f34361464e6bcf0d90ae2002d11b594@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752352171;
 bh=uYFiK4g+P+ko4XaMpm3RilpHqtGsxmIv2nfe58sP8EA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XpQN7CJbnOppPe3IMNMbR78xW9RkqZ/1VTF0XcoUmJ0Y5Z2RXoKSG0EPG4pwxfiHH
 Gn/NJtnYSR6zRl+6+W2JzCn0unfLFjIaKxRjpfZQdSoj6/iF0n167VSDR7hGsbcX9W
 MYD4dzxbfNp97KpokMvvvFzXhYFCFKDvcTdIMNhhqm1ZpAnEoKEnttTBN/U1wn08jF
 /brCHSiopgGH0/tBcrtWa/VJZsktoOvQ5xLB0MJ+uJziKMnaBXn8Vw6LqCXJNTv4eh
 dduUICe+88+IX5boDvCFPmC2PX9zJwqcmdfJBgjvHtEAoSPJCKUmTZ8giLvJj6ibSp
 ga6nT2mEIHXIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XpQN7CJb
Subject: Re: [Buildroot] [PATCH] package/python-tornado: bump to version
 6.5.1
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

On 08/07/2025 16:21, yegorslists@googlemail.com wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
> For change log, see:
> 
> https://github.com/tornadoweb/tornado/releases/tag/v6.5.1
> 
> Drop an already upstreamed patch.
> 
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

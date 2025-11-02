Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8181FCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 13:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 589E06F560;
	Sun,  2 Nov 2025 13:07:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jXHF8LTlC8cN; Sun,  2 Nov 2025 13:07:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C4DB6F538
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C4DB6F538;
	Sun,  2 Nov 2025 13:07:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E97F222
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 704F7852AB
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chDbfiDq6-_X for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 13:07:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6BED4852A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6BED4852A9
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BED4852A9
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 13:07:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 858D1B00576;
 Sun,  2 Nov 2025 14:07:00 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 14:07:00 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 14:07:00 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251102111011.1390948-1-bernd@kuhls.net>
References: <20251102111011.1390948-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0f7180e1b11f63cd3b2d1adf836f45b3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762088821;
 bh=XXgusXDIfmFzkwihLLJHzag1tEVRoJR1uzX8ST1PbE0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YDamLdnFjuYvWYw3L+4ws/8KdtFEvyfYzEd2XwL5KNqmZSEbVhxXUgvr1aT0xS9Fh
 lU81ePU5jFWV/0B0Uw3WOzP9WGsO73x/0yX702QXUZvsZHA0CkB4QAAT4OfkP3MOti
 QefWsJnw5fO/zmuDmbgY2WqliMNFJD2KjdZPGYQCBXHvkG3t077VEUKBE5ES0dAn3c
 5AZ3bAIIrA2m0rKZMAAn5+p0WYr6WULlllkrt2bfxw9iFczfZhfavh88MYx4ydu2NX
 wBpE8144iP+Mnon0/QX4N77P3gn17Blsu3XjJlzbF+JGf1a9uRQpBofi1ccpT+Hvc7
 IUx3wmltECcMw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YDamLdnF
Subject: Re: [Buildroot] [PATCH 1/2] package/live555: switch _SITE to
 videolan.org
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

On 02/11/2025 12:10, Bernd Kuhls wrote:
> Upstream site http://www.live555.com/liveMedia/public/ removes older
> versions, use videolan.org instead.
> 
> Fixes:
> https://autobuild.buildroot.net/results/7af/7af41a2774ba3ed7049e06fe290d3233e772ab19/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied this patch (only) to master. Thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34A4C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 14:27:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 911D760BDD;
	Sat, 17 May 2025 14:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lHMFm-w6uOc6; Sat, 17 May 2025 14:26:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C96C960BE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C96C960BE6;
	Sat, 17 May 2025 14:26:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 228F4E4
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:26:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1365780F0D
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:26:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFHxrsWQiz89 for <buildroot@buildroot.org>;
 Sat, 17 May 2025 14:26:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0FA3280EE5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FA3280EE5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0FA3280EE5
 for <buildroot@buildroot.org>; Sat, 17 May 2025 14:26:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 877DA6013E;
 Sat, 17 May 2025 16:26:49 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 17 May 2025 16:26:49 +0200
MIME-Version: 1.0
Date: Sat, 17 May 2025 16:26:49 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Anand Gadiyar <gadiyar@ti.com>, Bryan Brattlof
 <bb@ti.com>, Xuanhao Shi <X15000177@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20250429222236.823478-1-dario.binacchi@amarulasolutions.com>
References: <20250429222236.823478-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <3a053f726fc27b4ba39aa71a4058a0cd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747492015;
 bh=gyXGP1W3hNmo1upuZNuLtpZuazyTSV1OxEPZ2TuSL1M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PXMJY7ja7BrJY+epXbul/gnsqBNCZxTo3Jpa0s2s5ZAHbmeV3UXtRAoS4V8XU8IEY
 iO0hq5nSQoYgPnFt2xq32V9rK2w5p3PCVIUNxyTascvBQ2qytNLcgkqCvP0s+SThq2
 8wDm1r1aj67xOYDbgqON0yFT04mqmvmlRAz0l4jnm05Jtm6UOOPdT1tqpDy6eLNV0k
 cKn5AUw4/Q3iJLygXT5/ucnJ5s93XJfo+zIm7W9wGci5QOYUWJ6vFS/KURAlZxedsg
 Spwx2/+Pvy84zrEc4Qlr02gg3xUjoZwE3c7U46zdG7icwXg+Agd/hkjXRMJz6k8jU8
 LW2Wx23q71/HA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PXMJY7ja
Subject: Re: [Buildroot] [PATCH 1/1] boot/ti-k3-boot-firmware: bump to
 version 11.00.11
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

On 30/04/2025 00:22, Dario Binacchi wrote:
> Release-notes:
> https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/tag/?h=11.00.11
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

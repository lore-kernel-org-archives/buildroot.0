Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50B2C2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 08:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A20F844A1;
	Wed,  3 Jul 2024 08:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JdDDn4zM9-Zz; Wed,  3 Jul 2024 08:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50A26844A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50A26844A5;
	Wed,  3 Jul 2024 08:50:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C31F61BF2EC
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF9CF41A5F
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 08:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXfifoxYi7iy for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 08:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 13BCB4020B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 13BCB4020B
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 13BCB4020B
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 08:50:16 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([82.135.81.241]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3lY1-1sPCwH0O2d-00Fhwh for
 <buildroot@buildroot.org>; Wed, 03 Jul 2024 10:50:14 +0200
Date: Wed, 3 Jul 2024 10:50:13 +0200
To: buildroot@buildroot.org
Message-ID: <20240703105013.1bd207f1@gmx.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:t+8WlmNphwJ8aC9FSV7VkC7Mmtoo30mWux1gx7sw019UoWDYN8L
 Iyetl6fQ1+g74S53RaWDvuHq3JGctwWg6UR+MZwa0Ihtbog6SECDj4p5b/s2zAqGMsyevjY
 zNeBB/aeQRzHoxWZTYidPO2sgQtWp3y++OIK84LfhN9R7gbYAxFRI8oFrRfaZkA1lGN0a6Z
 Ky6icBneyEpESuupynSBA==
UI-OutboundReport: notjunk:1;M01:P0:XbffS4r6PGU=;81e7v046zr5ZwMIE5qrLMp5JfC3
 xMu9WMvE/CfsGUyooZke8SR/0D8kCNrDG3+RMWCzYgh/lqzwBYapYtn816OT63Vz5KP1DrvUE
 pHFwzgnJrUdEs3R9o2Q1PkJBe1bVnHQXZv0rsGvNy3hRPGynsrbmuk7OZTOz7Da7tLRHAn7I9
 219FN9sLpndwHUIbs5XH5RQCsd1iZau4/T62NZ78bJkYSfZR/Tif89i23d1wm49+8c4MZwKks
 m9v83UvXU35wMj7Qg8uPTbkGy/6yJnmgEJdF1XPkUD7jGabqVpDp5p/rOkGQvBBW5M+QdUsw8
 EyU00tIzclnzc5/xlUDqVaxlr6uY1kSN1SNG0bIwsXYhVhX+MDLS5/lXrK1+gSBxSANE2A8x8
 15usqVX2GKisH6Y9nskKqdhZtHM0LG+Um96VlByFF1npbOaAEwlEf+rB778QS/zOElNER6DXa
 Lhj0DA69lZZ2kWyTp+yjWfX491UAUyq2+Z2QbwU87CcwiuMo1C1mmVuXaCqHH0Uj1rSTZyh0L
 3KzT9B+y2YvBKTex481gHmwQWR2fh8l30KmsOk49C+0dcBVn/aO0a8f8nXTwODtXMP3GDvJ0D
 hjsPdaqYjbuFx3OjtNy7yCLaoAfPUdxu+rOzKVCmJ4135CCR2txVsIv53sTQsGZlAMgVe665d
 2fMmUoaOCAgD7Dy6/mtfrwafE5EH+ElsIA3E8BHwTgK8Mr8vlHOqa5eJWw1Ogy+URuMYLrVjn
 2g3ns7hEq5nS9o05wJpIXv7+5/VQMLwjFa2BMEyDwjSruFirqG5FBqVG0NE3KxmGjOR/gbKeE
 HR2IR0P2pevQxE3UjO9a+eGhAVXgYE6np8G3ZFM4o0WPE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1719996614; x=1720601414; i=ps.report@gmx.net;
 bh=KU26ArFP6j82f3vqqIxQdHo4AKg9pueo73XPsfJuyCY=;
 h=X-UI-Sender-Class:Date:From:To:Subject:Message-ID:MIME-Version:
 Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=iUbuRcfINTxKu/P7EPA5TQcGM36n5iyriQmKSE4Wnyh5+WjaGc2/OTx+jA88xJWh
 fYkSygP9ppJrGsfgqw9G5HQ7dgS8Fpk3CIQ+pEnHz8rFTWHuaxaI5U0HFArp3j89c
 8s8y7aeptYY2ZWdiSYh3F63gMprAq/JdqmFQ7szUJZiWlDxfYOkqgGPjx9HEPWb0b
 N6+2asoIJHXswWaugOkQmXLZwTsP90XRBJhqvEEPEGAAAJLQpCcacAn/0lr2e0Qo6
 nyN3NnnasC9Yz5YQYqhMjcXHhn1lGVHAzDPtBPty3I5tBM5nACkGOkJwswybZ0psV
 WvPGB3Og52WtZGCGBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=iUbuRcfI
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2024-07-02
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


> Autobuild statistics for 2024-07-02
> ===================================
[...]
>    mipsel    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/7325995c580b83a949017da2fae03808ba8a6362 | ORPH

This one could be fixed by adding 'XZ_AUTORECONF = YES' (or by updating to CMake build)...

Regards,
Peter

>    mipsel    |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/9e09006eb982f5f90fad75f4faf4203541a8a7e7 | ORPH
>    arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/e9e4bc825cf86b01a2ee8014eae91a2abd953160 | ORPH
>    sh4eb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/12ad86f0a5dced0876f2007b50485f0159f9392c | ORPH
>    arceb     |            xz-5.6.2            | NOK | http://autobuild.buildroot.net/results/6907708ccaed8d806d9b84dd19beed0ec456ba58 | ORPH
[...]
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E36C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE6264011A;
	Wed,  3 Aug 2022 16:38:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE6264011A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bPql6FyTsn-B; Wed,  3 Aug 2022 16:38:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A8F40118;
	Wed,  3 Aug 2022 16:38:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5A8F40118
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 169021BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5B3B60C34
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5B3B60C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zLUBAszBcQKW for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:38:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A75560A6D
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A75560A6D
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 16:38:13 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JHNrouSGIcdGJJHNroQN7Z; Wed, 03 Aug 2022 18:38:12 +0200
Message-ID: <0182c00d-6a7d-2269-609a-9f71c06787fa@benettiengineering.com>
Date: Wed, 3 Aug 2022 18:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Content-Language: en-US
To: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org
References: <20220802200522.4619-1-x-shi@ti.com>
 <20220802200522.4619-4-x-shi@ti.com>
 <97eb0b50-ac5d-76d6-57f3-efd2d99304db@benettiengineering.com>
 <4111e69f-df92-2d7f-0964-d4a11cc5b18a@ti.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <4111e69f-df92-2d7f-0964-d4a11cc5b18a@ti.com>
X-CMAE-Envelope: MS4xfDSavrWsYacblFk5HljjdtINC+8n22YJAWZbIWXkjiUK8fd7tOMk38dfMmpq05O/lgvxbJO7CcWnkSO/Z5xAl4PpRKpMw0XFRwgoE4gzEI6D9Li5EXwy
 MIFHJA85MQIV0GTRND5o9BKQ2ce5rR3lg8hi5D4omLr6jUG6dAPj7s/IPd1gSphBgtYjwnwmNAdap7d21etWR8QJ2kSuoPffF0sqIHyWF4cN9TNv4Ly7L4uN
 TRkan3pJZVSAjvM9gPf7EOlm0fkiBuZHxJs+oysqwJsPzlQCXyJ5PWrnXJclhZ1NfUx03j1CCmROCTo+la5Y1w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659544692; bh=Uh3EehPoReTEBygYAdYftNGrRLuwzIO1Swp338Qw67A=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=EEcYxpRGo/vwR2cLv8moTDPDk2ndXKhLftfbAGKVLJgWRhhbX7J5M4k4Apmk8LzWA
 iSFbqxXeH7LezeaWRZqdBR2M2fMsVedNOIWxYmRMVyxALFC4yLeBTwSp/x2ioOLOar
 3lgEeFdkZqV4TIN1vpEvlanNsDnAxcUFaOPDvzTVbyOe/uOss8v51XIBPB7pwewrbX
 j+KeMfGdLfLFphUBYdBZnuJ5NFcywyMo5A9O5LRlLop2WuxGdjecbnKiiFNZVqkO+O
 d2yp/QrULTZl6s+R/AB+0rL5t+7OI1/dAO42Paalos4QXri9o852SNZNc47Ytj/P6m
 zpDWcJLk3+xJQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=EEcYxpRG
Subject: Re: [Buildroot] [PATCH 3/3] board/ti/am64x_sk: add new board
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Xuanhao,

On 03/08/22 18:09, Xuanhao Shi via buildroot wrote:

[ SNIP ]

> 
> Hi Giulio,
> 
> Thanks a lot for the review and testing.

It's a pleasure :-)

> I have fixed the commit logs and sent in v4 of the patch.

I've just built it correctly and looks good to me.

> I'll mark the relevant older versions as superseded.

Well done.

Hope to see am62x board patch soon.

Kind regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DB4EB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 10:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4173560F74;
	Mon,  7 Aug 2023 10:39:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4173560F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ehe_H0sBweIQ; Mon,  7 Aug 2023 10:39:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D5B260E85;
	Mon,  7 Aug 2023 10:39:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D5B260E85
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AEB851BF3FB
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 10:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9563B60E85
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 10:38:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9563B60E85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TRT8-1thaeWt for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 10:38:44 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E406A60E53
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 10:38:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E406A60E53
Received: from postfix03.mail.de (postfix03.bt.mail.de [10.0.121.127])
 by shout02.mail.de (Postfix) with ESMTP id 03E9FA0258;
 Mon,  7 Aug 2023 12:38:42 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix03.mail.de (Postfix) with ESMTP id DBF38801A9;
 Mon,  7 Aug 2023 12:38:41 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id A104FA0482;
 Mon,  7 Aug 2023 12:38:40 +0200 (CEST)
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Date: Mon, 07 Aug 2023 12:38:40 +0200
Message-ID: <4851354.31r3eYUQgx@kilian-aisec>
In-Reply-To: <7a065654-a4bb-5ce7-dc9c-801037f0f4bd@gmail.com>
References: <7a065654-a4bb-5ce7-dc9c-801037f0f4bd@gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 3010
X-purgate-ID: 154282::1691404721-72FFD199-B29E38F4/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1691404721;
 bh=J+HKDRx3VMRnrIv4KaPA+QKD0MvjVw39Cw9ylqCAF2s=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=IaRyjz1lpL8jtLwGJ813m05iInCAswsyEeJhVClusS+Sqr7OUJ1g6UxHuC4wOU+A7
 gzL1Q/dF10ldt2+9AzxdZfqmKZW5yZoyUIacOqwO/3LzfqivfqA4ydHtpTvJYMzv3l
 MDcr5FyumhqIAo1gzQmXhwiPOK4aQIr9cspSGZtiqZOD9ajQm9nCvenmQ4ce/SY1OM
 YhxNd14SMLQs+CK8TLuXbuT+U2rAHKSj4CZF8xEmfjt9h3in69xbkwK6OlxU6ECxzo
 f9gQmsKruG2wFxBuh/KdUCb8TOl3g1GFVmxyECzm8u8vKDporW/g6LuJDB6E4228xY
 i9s7mdgbMQ+hg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=IaRyjz1l
Subject: Re: [Buildroot] rock5b & 2023.08-rc1
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Cc: Nick Betteridge <lists.nick.betteridge@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Nick, all

> I just tried to build the rock5b, with a 'make rock5b_defconfig' and
> 'make', and the build failed during the kernel compilation

Thanks for your mail. I think your issue is related to the current build job 
fail, see here:

https://gitlab.com/buildroot.org/buildroot/-/jobs/4795673759

> (page_alloc.c) - there were many 'error, forbidden warning', many
> referencing 'in expansion of macro 'adj_init_size''.

I am not sure, whether I completely understand it yet. I believe some setting 
changed, such that some gcc warnings now produce actual errors (because it is 
now a "forbidden warning"). Maybe some gcc version bumb changed these 
settings, or some other config change to buildroot introduced this - to be 
honest: I don't know. Maybe someone has an idea an can help?

> I tried out the rock5b last month using the patches posted to the list
> and the build completed - is there something I can modify in the
> defconfig to make this work?

Now, regarding those error producing warnings: to me it seems that Radxa (or 
Rockchip) did fork from mainline kernel at some point to introduce their code 
to support their boards (or SoCs respectively). Unfortunately this also means, 
that mainline kernel fixes are not automatically introduced to the forked Linux 
version. I already looked into it and I found two patches to mainline Linux, 
which fix two (now error producing) warnings, but which are not yet applied to 
the Radxa kernel:

https://github.com/gregkh/linux/commit/
08ad7a770efacfecf903143f8de88d1e351a1f2d

https://github.com/gregkh/linux/commit/69848f9488bc1088bcd9a73987dff8d2cb47a060

So I made patches from these commits:

git format-patch -1 08ad7a770efacfecf903143f8de88d1e351a1f2d
git format-patch -1 69848f9488bc1088bcd9a73987dff8d2cb47a060

I then put these patches into the rock5b folder (i.e., board/radxa/rock5b/) 
and added the following line to the rock5b_defconfig, so that buildroot applies 
the patches during build:

BR2_LINUX_KERNEL_PATCH="board/radxa/rock5b/0001-etherdevice-Adjust-ether_addr-
prototypes-to-silence-.patch board/radxa/rock5b/0002-mm-page_alloc-fix-
building-error-on-Werror-array-com.patch"

However, the build did fail again, because there are even more "forbidden 
warnings". These warnings are produced by kernel code which is located in 
"drivers/net/wireless/rockchip_wlan/". To me it seems that this folder is not 
part of mainline linux, but contains code some wireless driver code, put there 
by Radxa or Rockchip. I am now not sure what to do about this. It would be 
possible to try to fix these issues and then add more patches to the board/
radxa/rock5b folder. However, I am not sure, whether I want to touch that 
code. I am a bit afraid, I might not properly understand the code and then 
introduce some bugs myself ...

Does anyone have some suggestions, ideas and overall helpful info about this? 
Help is really appreciated!

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

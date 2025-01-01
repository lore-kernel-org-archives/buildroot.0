Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4083E7718B
	for <buildroot@archiver.kernel.org>; Wed,  1 Jan 2025 20:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B21541272;
	Wed,  1 Jan 2025 20:01:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a6gJgdHiUS7n; Wed,  1 Jan 2025 20:01:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3847541297
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3847541297;
	Wed,  1 Jan 2025 20:01:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9474BF27
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7566281250
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ThPzRGenUliN for <buildroot@buildroot.org>;
 Wed,  1 Jan 2025 20:01:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:868:100:600::217; helo=shout02.mail.de;
 envelope-from=kilian.zinnecker@mail.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 670FE8122B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 670FE8122B
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 670FE8122B
 for <buildroot@buildroot.org>; Wed,  1 Jan 2025 20:01:54 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id C175D240D5E;
 Wed,  1 Jan 2025 21:01:52 +0100 (CET)
Received: from smtp01.mail.de (smtp03.bt.mail.de [10.0.121.213])
 by postfix02.mail.de (Postfix) with ESMTP id 8DEF6240596;
 Wed,  1 Jan 2025 21:01:52 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 8448424102E;
 Wed,  1 Jan 2025 21:01:51 +0100 (CET)
To: buildroot@buildroot.org, Drew Fustini <dfustini@tenstorrent.com>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Revy <rabenda.cn@gmail.com>, robertcnelson@beagleboard.org,
 jkridner@beagleboard.org, Drew Fustini <drew@beagleboard.org>
Date: Wed, 01 Jan 2025 21:00:54 +0100
Message-ID: <2292259.iZASKD2KPV@kilian-laptop>
In-Reply-To: <Z3WcIOKr8jnCUVCY@x1>
References: <20241230224631.1080014-1-kilian.zinnecker@mail.de>
 <Z3WblFPOphrna9FD@x1> <Z3WcIOKr8jnCUVCY@x1>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2164
X-purgate-ID: 154282::1735761712-BE51689A-06CE4530/10/3626336762
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1735761712;
 bh=6ppadoPsibZjzafcUw5KX5O0Lo36DAWdAO0+7NKkoVA=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=YrjABQeFsmiMhYdn/dstNf7ZXw+0mxJmPpNY8LhahBwpuGVKLTWYD3espm58GwXN0
 dmLu0ir/GROKHvL8LtakGditu9PVeoypXl5zAJQjJ54yHkiiUxKOkHS4pEA0TZbKzY
 rS2RRVc+4jMCbjNgCuNpo42zUlvzg02f3KDahn7UqhPYAQN4WKITyUvEAxw+31+kjD
 qxYJ9XL7nQ3HXAtr+SLtsigGGC2Vhb5sV60VUDq+S3CZYzseIc1zRnIY8qzOE03eEa
 xFXjpo4Fc4p3Xfya45Zj2Nq46vgf5uKS2tOikdWS9XJ89+xXz6uuhd5DHFakBAVb6u
 DwbVjxo+Begrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mail.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mail.de header.i=@mail.de header.a=rsa-sha256
 header.s=mailde202009 header.b=YrjABQeF
Subject: Re: [Buildroot] [PATCH v5 0/2] Add board support for the
 BeagleV-Ahead
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
From: Kilian Zinnecker via buildroot <buildroot@buildroot.org>
Reply-To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Drew,

[--SNIP--]

> > I think that u-boot is the ideal solution since that is the direction
> > that T-Head decided to go. I asked Revy on Telegram [1] and they showed
> > me where in thead-u-boot [2] that reset_sample() is called.
> > 
> > Revy pointed me to a build of u-boot-with-spl-beagle.bin [3] that I've
> > just flashed to my Ahead [4]. Unfortunately, there is an issue that
> > results in the board not booting [5]. Revy is going to look into the
> > issue and get back to me.
[--SNIP--]
> 
> Revy just replied that I should be trying mainline OpenSBI. I have to go
> offline for awhile but I will try that later today.

I actually didn't wait and acutally already tried the revyos uboot and it 
seems to work with kernel 6.12.7 and OpenSBI 1.6. I now get:

[    0.113565] smp: Bringing up secondary CPUs ...
[    0.121700] smp: Brought up 1 node, 4 CPUs
[--SNIP--]
[    0.216965] cpuidle: using governor menu
[    0.251283] cpu3: Ratio of byte access time to unaligned word access is 
6.14, unaligned accesses are fast
[    0.251283] cpu2: Ratio of byte access time to unaligned word access is 
6.14, unaligned accesses are fast
[    0.251284] cpu1: Ratio of byte access time to unaligned word access is 
6.14, unaligned accesses are fast
[    0.303594] cpu0: Ratio of byte access time to unaligned word access is 
6.14, unaligned accesses are fast

So I think all cores are up and running now! :D Thanks for all the help so 
far! I still have some questions though and there are still some things to do. 
However, I will send a v6 of the patches, although they are still not ready to 
get accepted.

Regarding the revyos boot, I have two questions:

1) Are the xuantie binary blobs still needed? The light_aon_fpga.bin and the 
light_c906_audio.bin?

2) The revyos uboot seems to also need the reset-sampe device tree node. I 
therefore added it via a custom device tree. However I still get the error 
message "## fdt has no reset_sample". Any idea, what could be wrong here?

https://github.com/revyos/thead-u-boot/blob/th1520/arch/riscv/lib/bootm.c#L115

Thanks and best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

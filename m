Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DBD4C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 06:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7AE7400CE;
	Tue,  6 Feb 2024 06:41:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7AE7400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GT0iM9JxcAjz; Tue,  6 Feb 2024 06:41:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B1F8B402DC;
	Tue,  6 Feb 2024 06:41:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B1F8B402DC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E5F741BF255
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 06:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE5CF41D67
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 06:41:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE5CF41D67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUV5zEE_m6GQ for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 06:41:17 +0000 (UTC)
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43A8A41BF8
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 06:41:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43A8A41BF8
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id 7318F240CAB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 07:41:15 +0100 (CET)
Received: from smtp01.mail.de (smtp01.bt.mail.de [10.0.121.211])
 by postfix02.mail.de (Postfix) with ESMTP id 57D0AA00E2
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 07:41:15 +0100 (CET)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id 28F1B2409F5
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 07:41:14 +0100 (CET)
To: buildroot@buildroot.org
Date: Tue, 06 Feb 2024 07:41:13 +0100
Message-ID: <2716329.mvXUDI8C0e@laptop>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2839
X-purgate-ID: 154282::1707201675-CF5B9670-EEC94A85/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1707201675;
 bh=FzNEnuKeXv2ut5CRLn5yY4pS8zH8WAeq/B3kk+A7ddg=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=wFBH90c6eznJxXV338/++Wn2p8DG92nDPCZl3/tWb2yLBB068SWlUYtRFLZUDe1RQ
 pkUqDVjD5tyF03xDfJYBEfX002FlvtmbLEPXkBfFsYltUVcxg1Ezf1bXXWNo8nta6j
 M6i7F3AH+71jpmcY41kmbM+vHVvDYOcNBFDXkThH2bXaXj4HJjOO65e9Wo5LzXb6lU
 MwQXhvnW+pJ2Bn7czhH9MXTEZH11AEDSgAgbAUj4yxDEVjZu+lgZ9L6eYc/Q+KTzBA
 tQAW00A6hMh8hHjw0hOUV1WG03ZrKKEo7QZOCeFiyqVb/JbJRSkGqMLjY6kVw1YL7z
 nVZuTVKYvQ8ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=fail reason="signature verification failed" (2048-bit key)
 header.d=mail.de header.i=@mail.de header.a=rsa-sha256 header.s=mailde202009
 header.b=wFBH90c6
Subject: [Buildroot] [help] configs/rock5b_defconfig: Switch to mainline
 kernel
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
From: "kilian.zinnecker--- via buildroot" <buildroot@buildroot.org>
Reply-To: kilian.zinnecker@mail.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

The board support for the Rock5b uses a custom kernel. However, there already 
exists some mainline support for its SoC, the Rockchip RK3588 [1]. Some of it 
seems to already be present in kernel 6.6, which is the current latest version 
in buildroot. I would like to change the kernel used for the Rock5b from 
custom to mainline. Unfortunately I face a challenge.

In order to get kernel log output on the serial interface, I changed the 
consosole from ttyS2,1500000n8 to serial2,1500000n8 in the kernel bootargs (as 
seen in Sebastian Reichel's Kernel Recipes 2023 talk). After that, it shows 
the kernel messages, but it never reaches a shell:

[    0.321600] mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req 
400000Hz, actual 400000HZ div = 0)
[    0.370827] hub 4-0:1.0: USB hub found
[    0.371218] hub 4-0:1.0: 1 port detected
[    0.372291] Waiting for root device /dev/mmcblk0p2...
[    0.382457] mmc_host mmc1: Bus speed (slot 0) = 198000000Hz (slot req 
200000000Hz, actual 198000000HZ div = 0)
[    0.497629] usb 1-1: new high-speed USB device number 2 using ehci-platform
[    0.655570] hub 1-1:1.0: USB hub found
[    0.656181] hub 1-1:1.0: 4 ports detected
[    0.794063] dwmmc_rockchip fe2c0000.mmc: Successfully tuned phase to 118
[    0.794672] mmc1: new ultra high speed SDR104 SDHC card at address 5048
[    0.796162] mmcblk1: mmc1:5048 SD32G 29.7 GiB
[    0.802500] GPT:Primary header thinks Alt. header is not at the end of the 
disk.
[    0.803155] GPT:563351 != 62357503
[    0.803459] GPT:Alternate GPT header not at the end of the disk.
[    0.803985] GPT:563351 != 62357503
[    0.804287] GPT: Use GNU Parted to correct GPT errors.
[    0.804761]  mmcblk1: p1 p2
[   31.717905] vdd_gpu_s0: disabling
[  115.285576] random: crng init done

Of course it could be, that it is just not configured anymore to put a shell on 
the serial interface, but I already tried to address that with:

BR2_TARGET_GENERIC_GETTY=y
BR2_TARGET_GENERIC_GETTY_PORT="serial2"

However, that did not seem to help. Could it be, that there is something wrong 
with the SD card formatting? It at least complains about it, but I am too 
unfamiliar with that, so I don't know whether it is a problem. I also tried to 
change the rootfs partition in the bootargs mmcblk0p2 to mmcblk1p2, but then 
the boot got stuck at some other place.

As kernel defconfig I use the default arm64 defconfig 
(BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y). Could that also be an issue, 
i.e., that I should provide a tailored one, e.g., by starting from the one 
used by the custom kernel?

I appreciate any help or suggestions, thanks and best regards,
Kilian

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3588/-/blob/main/mainline-status.md


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

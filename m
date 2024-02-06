Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BBCC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 09:25:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43642820B1;
	Tue,  6 Feb 2024 09:25:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFOftMeMAqQo; Tue,  6 Feb 2024 09:25:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3015D820D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3015D820D8;
	Tue,  6 Feb 2024 09:25:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 065D71BF27C
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:25:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D133541030
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 09:25:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D133541030
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2lUZSRuJqM33 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 09:25:51 +0000 (UTC)
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AE25400FF
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 09:25:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AE25400FF
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-5114cd44fdbso4021067e87.2
 for <buildroot@buildroot.org>; Tue, 06 Feb 2024 01:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707211549; x=1707816349;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hHfKSou2lXGEBzjD4zCLnGMRx6+IFMJAyDOEhMAeHJ0=;
 b=gb5dNsT8soYPoSCEopK2vKTcpw+dmso7qh4ABM1RhO7l0aeXw2hwBwaDl6nb+GVV42
 b9GdWzqnRT3JCwJqJmqPexKLqmi675cMy2burriGfU/jb9W+0Jhp2R56NMb0xTgmpE2k
 Q//dB2Rysg/U3uLXhJxokkam02TokbxvjE9QDv7fsW2EkLwo5vD2sohFP0Ol0W6yZlRm
 deJCk5WqvV0x2la+hSCbS6nO6fReL5yDfwbdV+EryRHVBtiKmiaAxEFjzSbIRmYOa7Ck
 kRc4FXY3vGx/mPucrnwvf9VjQnmhTXMHRtjIGQ/AnufCy1pHnz+dDsqVan3sqj+pID30
 BFjg==
X-Gm-Message-State: AOJu0YyRa0d2J+bLrisVhlA5gvJtbWQxROan7qiOfvZfNDQGk+YSXte+
 9YPnN9ERdcEZCoxG7mItfaZWgjNqgofhsQt6RSLpXC+vWxVUzZB6hnRaaZcX0k0=
X-Google-Smtp-Source: AGHT+IHHYxQqcjUClVj1cQb+VRfrHzlN9sfQv7LRM9tcFvFQA01Qb8SE795SbmPD6nlK6DArlxJqXQ==
X-Received: by 2002:a2e:9255:0:b0:2d0:b572:1e07 with SMTP id
 v21-20020a2e9255000000b002d0b5721e07mr1635245ljg.39.1707211548653; 
 Tue, 06 Feb 2024 01:25:48 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVtTzDYF074GPEEkVceipvpLbmoJ/OdymDwKW2sQNM/dyXwVoMXUshGsk1FGkwgq2zCOTxinSVrmJa1aPvukO5wGaGFnz8vtQ==
Received: from [192.168.16.188] ([85.119.216.19])
 by smtp.gmail.com with ESMTPSA id
 g24-20020adfa498000000b0033afed6e9desm1597198wrb.98.2024.02.06.01.25.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Feb 2024 01:25:47 -0800 (PST)
Message-ID: <b52d94dd-072c-42bc-8958-58141e8a20e2@mind.be>
Date: Tue, 6 Feb 2024 10:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: kilian.zinnecker@mail.de, buildroot@buildroot.org
References: <2716329.mvXUDI8C0e@laptop>
In-Reply-To: <2716329.mvXUDI8C0e@laptop>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1707211549; x=1707816349; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hHfKSou2lXGEBzjD4zCLnGMRx6+IFMJAyDOEhMAeHJ0=;
 b=UPyGsPFa8fSek8JAXvP+nGBQfqIhNKXGEQk8LyGASWqfq40BZlkXMqRPa0UegpjpNB
 gcIl559qk/OnB+TiS8nXjJVARBPA2bsMmIK9lyHoeSMVbZrblUszZk2dl0sEymKEyqv7
 +rtdfTHi5uS7Dy01KtJFlW4Mpj2Dk6vVeMzEElQsbmaXyLkWf2bemhCD38cuXqTklhIv
 gGQJ3h+UAf5iyidhTbtKn9JXwccw1+BlyE/Uey8/N0hWo3QHu8WTvy33kl/bn02nH0+E
 0er3H8Nd4/Z77IEcgDnRV6ASKCWhiwvOgDE4O9cAIu6IISwtZBfGMImY/Y96UtsPkqGa
 GgJA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=UPyGsPFa
Subject: Re: [Buildroot] [help] configs/rock5b_defconfig: Switch to mainline
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Kilian,

On 06/02/2024 07:41, kilian.zinnecker--- via buildroot wrote:
> Hello,
> 
> The board support for the Rock5b uses a custom kernel. However, there already
> exists some mainline support for its SoC, the Rockchip RK3588 [1]. Some of it
> seems to already be present in kernel 6.6, which is the current latest version
> in buildroot. I would like to change the kernel used for the Rock5b from
> custom to mainline. Unfortunately I face a challenge.
> 
> In order to get kernel log output on the serial interface, I changed the
> consosole from ttyS2,1500000n8 to serial2,1500000n8 in the kernel bootargs (as
> seen in Sebastian Reichel's Kernel Recipes 2023 talk). After that, it shows
> the kernel messages, but it never reaches a shell:
> 
> [    0.321600] mmc_host mmc1: Bus speed (slot 0) = 400000Hz (slot req
> 400000Hz, actual 400000HZ div = 0)
> [    0.370827] hub 4-0:1.0: USB hub found
> [    0.371218] hub 4-0:1.0: 1 port detected
> [    0.372291] Waiting for root device /dev/mmcblk0p2...
> [    0.382457] mmc_host mmc1: Bus speed (slot 0) = 198000000Hz (slot req
> 200000000Hz, actual 198000000HZ div = 0)
> [    0.497629] usb 1-1: new high-speed USB device number 2 using ehci-platform
> [    0.655570] hub 1-1:1.0: USB hub found
> [    0.656181] hub 1-1:1.0: 4 ports detected
> [    0.794063] dwmmc_rockchip fe2c0000.mmc: Successfully tuned phase to 118
> [    0.794672] mmc1: new ultra high speed SDR104 SDHC card at address 5048
> [    0.796162] mmcblk1: mmc1:5048 SD32G 29.7 GiB
> [    0.802500] GPT:Primary header thinks Alt. header is not at the end of the
> disk.
> [    0.803155] GPT:563351 != 62357503
> [    0.803459] GPT:Alternate GPT header not at the end of the disk.
> [    0.803985] GPT:563351 != 62357503
> [    0.804287] GPT: Use GNU Parted to correct GPT errors.
> [    0.804761]  mmcblk1: p1 p2

  Clearly, the rootfs is on mmcblk1p2, not mmcblk0p2. So if you have mmcblk0p2 
on your command line, and rootwait, it will just wait indefinitely for the 
rootfs to appear.

> [   31.717905] vdd_gpu_s0: disabling
> [  115.285576] random: crng init done

  That's pretty late for the RNG to be initialized, you'll need the RNG seeder 
from userspace - but this is enabled by default in Buildroot I think.

> Of course it could be, that it is just not configured anymore to put a shell on
> the serial interface, but I already tried to address that with:
> 
> BR2_TARGET_GENERIC_GETTY=y
> BR2_TARGET_GENERIC_GETTY_PORT="serial2"
> 
> However, that did not seem to help. Could it be, that there is something wrong
> with the SD card formatting? It at least complains about it, but I am too
> unfamiliar with that, so I don't know whether it is a problem.

  That's normal. It's because the generated image is not the exact size of your 
SD card, so the backup GPT partition table is somewhere in the middle instead of 
at the end. You can run parted on your laptop after writing the SD card and 
before booting it to fix the issue. But it shouldn't make any difference at all 
for booting.

> I also tried to
> change the rootfs partition in the bootargs mmcblk0p2 to mmcblk1p2, but then
> the boot got stuck at some other place.

  That other place is the interesting one, with mmcblk0p2 I would indeed expect 
it to stop where you've shown it above.

> 
> As kernel defconfig I use the default arm64 defconfig
> (BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y). Could that also be an issue,
> i.e., that I should provide a tailored one, e.g., by starting from the one
> used by the custom kernel?

  It's indeed possible that the arm64 defconfig misses some things that are 
needed by the RK3588, hard to say from here. But if it already gets to MMC 
enumeration, it looks like it's mostly working.

  Regards,
  Arnout

> I appreciate any help or suggestions, thanks and best regards,
> Kilian
> 
> [1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/notes-for-rockchip-3588/-/blob/main/mainline-status.md
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

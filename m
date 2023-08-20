Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C48EE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 12:54:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87C7C81F61;
	Sun, 20 Aug 2023 12:54:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87C7C81F61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id O6ul4kbccZJ5; Sun, 20 Aug 2023 12:54:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F4981F58;
	Sun, 20 Aug 2023 12:54:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7F4981F58
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50CC31BF420
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 12:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2A79B81F58
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 12:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A79B81F58
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LPTIeP5lCJBM for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 12:54:42 +0000 (UTC)
Received: from shout01.mail.de (shout01.mail.de [IPv6:2001:868:100:600::216])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1CEB81F55
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 12:54:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1CEB81F55
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout01.mail.de (Postfix) with ESMTP id 13B4CA01F0;
 Sun, 20 Aug 2023 14:54:40 +0200 (CEST)
Received: from smtp01.mail.de (smtp04.bt.mail.de [10.0.121.214])
 by postfix02.mail.de (Postfix) with ESMTP id EA7D6A00E2;
 Sun, 20 Aug 2023 14:54:39 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp01.mail.de (Postfix) with ESMTPSA id E44DF241237;
 Sun, 20 Aug 2023 14:54:38 +0200 (CEST)
To: buildroot@buildroot.org, Robert Nelson <robertcnelson@gmail.com>
Date: Sun, 20 Aug 2023 14:54:38 +0200
Message-ID: <4856011.31r3eYUQgx@kilian-aisec>
In-Reply-To: <CAOCHtYjVZLkEe0FXnh16dpNDC5cCPA5_kmk7ELWOnkTEPuxpvA@mail.gmail.com>
References: <2691942.mvXUDI8C0e@kilian-aisec>
 <CAOCHtYh7RMBBFJKySPkcHqA5LoCK3jUpYv2k+80Q1GmenWnuDQ@mail.gmail.com>
 <CAOCHtYjVZLkEe0FXnh16dpNDC5cCPA5_kmk7ELWOnkTEPuxpvA@mail.gmail.com>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2441
X-purgate-ID: 154282::1692536079-F37FD668-5C31F2FC/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1692536080;
 bh=kzM8BYcO9mOmoFzRHdg2vfvbxuVEYbAAgI1jV14psaE=;
 h=From:To:Cc:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=zgNHPwTVhn1SzQGaAdO5G8W1ngkv9npQ5dEGrbNs+veLuZm8HaYkrlUO88Ps656/b
 prHnVOYXI9G+lYlKzMtygNj/HRPADvuSf856ZRn9VGysB//4AJI6JxNfmxUCnnPx3A
 aIPlVCfldZv9IZyGArblEb/+cSsQIT53tAJnnVAfd38zQJASsfWxca6axdCXXudTzn
 S0EWyrmkfmWd6U//yIPA4JYYSq4HNFZ0amOmnTqZbFiXkvv0WMu1ANjsoeygtwYbc9
 VjKXljY7k0ETsls8tBH0sfdP9bqPdPGdRqrHOkpbie0wp/T2aGdUlnj71FHylW+bJx
 WzUJvxC538f/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=zgNHPwTV
Subject: Re: [Buildroot] Interested in board support for BeagleV-Ahead
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Robert,

> > Oh let's backport:
> > https://github.com/riscv-software-src/opensbi/commit/6139ab272b1e69e4ff8a3
> > 7655969c877ae86de49
> > 
> > Remember, our version of OpenSBI is pretty ancient (0.9) we are only
> > stuck on it for the thead v5.10.113-1.1.2-ubuntu branch, on mainline
> > we are already usig mainline openSBI..
> 
> and pushed:
> https://git.beagleboard.org/beaglev-ahead/beaglev-ahead-opensbi/-/commits/0
> .9-1.1.2-ubuntu

Great, thanks, it does work now!

I am now able to compile everything. The u-boot-with-spl.bin, generated by 
buildroot, is also working. When I flash it to an SD card, I can boot the uboot 
(see also the beagle forum thread how booting the u-boot-with-spl.bin from SD 
card works here: https://forum.beagleboard.org/t/beaglev-ahead-automatic-sd-card-boot/35586)

I also have created a genimage.cfg, which creates a boot partition with all 
files you mentioned earlier. However, when creating an sdcard.img with this 
genimage.cfg, then the uboot does not boot anymore. I therefore believe, that 
my script is not yet correct, probably with regards to how the uboot partition 
is set up. I am not so much familiar with this. Does anyone have an idea? are 
the contents of my current genimage.cfg:

# SD card image for BeagleV-Ahead

image boot.vfat {
	vfat {
		files = {
			"fw_dynamic.bin",
			"Image",
			"light_aon_fpga.bin",
			"light-beagle.dtb",
			"light_c906_audio.bin",
		}

		file overlays/BBORG_LOAD-00A2.dtbo {
			image = "overlays/BBORG_LOAD-00A2.dtbo"
		}

		file overlays/BBORG_RELAY-00A2.dtbo {
			image = "overlays/BBORG_RELAY-00A2.dtbo"
		}

		file overlays/BONE-LED_P8_03.dtbo {
			image = "overlays/BONE-LED_P8_03.dtbo"
		}

		file overlays/BONE-LED_P9_11.dtbo {
			image = "overlays/BONE-LED_P9_11.dtbo"
		}

		file overlays/BVA-MIKROBUS-0.dtbo {
			image = "overlays/BVA-MIKROBUS-0.dtbo"
		}

		file extlinux/extlinux.conf {
			image = "extlinux.conf"
		}
	}
	size = 32M
}

image sdcard.img {
	hdimage {
		partition-table-type = "hybrid"
	}

	partition uboot {
		in-partition-table = "false"
		image = "u-boot-with-spl.bin"
		offset = 0K
		size = 1048576
		holes = {"(440; 1048576)"}
	}

	partition boot {
		partition-type = "0xC"
		bootable = "true"
		image = "boot.vfat"
	}

	partition rootfs {
		partition-type = 0x83
		image = "rootfs.ext2"
	}
}

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

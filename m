Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A994EB64D9
	for <buildroot@archiver.kernel.org>; Thu, 29 Jun 2023 23:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AA8083486;
	Thu, 29 Jun 2023 23:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AA8083486
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zV2NouuB8RrG; Thu, 29 Jun 2023 23:36:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804BA83123;
	Thu, 29 Jun 2023 23:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804BA83123
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 100281BF852
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 23:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E93644187D
 for <buildroot@lists.busybox.net>; Thu, 29 Jun 2023 23:36:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E93644187D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s4VXPXDlcx6N for <buildroot@lists.busybox.net>;
 Thu, 29 Jun 2023 23:36:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D5694185E
Received: from shout02.mail.de (shout02.mail.de [IPv6:2001:868:100:600::217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D5694185E
 for <buildroot@buildroot.org>; Thu, 29 Jun 2023 23:36:01 +0000 (UTC)
Received: from postfix02.mail.de (postfix02.bt.mail.de [10.0.121.126])
 by shout02.mail.de (Postfix) with ESMTP id ECCE3A0669
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 01:35:59 +0200 (CEST)
Received: from smtp02.mail.de (smtp02.bt.mail.de [10.0.121.212])
 by postfix02.mail.de (Postfix) with ESMTP id D13E5A03C1
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 01:35:59 +0200 (CEST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp02.mail.de (Postfix) with ESMTPSA id A4885A039F
 for <buildroot@buildroot.org>; Fri, 30 Jun 2023 01:35:58 +0200 (CEST)
To: buildroot@buildroot.org
Date: Fri, 30 Jun 2023 01:35:58 +0200
Message-ID: <12235072.O9o76ZdvQC@kilian-aisec>
In-Reply-To: <12234290.O9o76ZdvQC@kilian-aisec>
References: <12221308.O9o76ZdvQC@kilian-aisec>
 <898ad257-a549-95e2-44ae-898a9db5c4b8@mind.be>
 <12234290.O9o76ZdvQC@kilian-aisec>
MIME-Version: 1.0
X-purgate: clean
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for
 further information)
X-purgate: clean
X-purgate-size: 2165
X-purgate-ID: 154282::1688081759-1AFFD199-D20AAB76/0/0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=mail.de; s=mailde202009; t=1688081759;
 bh=/vVaqUkmvG0FV9gQcaynpjgamXxsqcfSnZxy99FLW5A=;
 h=From:To:Subject:Date:Message-ID:From:To:CC:Subject:Reply-To;
 b=n2QJrMJFxbKzsj8Asx7tyvaqQmGQGTSyK9vXibrjFbqwVuEM4O4NCqofXKJpOCjex
 SIpz5Rm51asK6dD7M245Ef8IVrEbddV+k0YTPIpFLxdSpEO7eRXHdH3hYyd2sETUjN
 ZxRt6ZHAu2+U/oeuvlyc3PwddLDaewMvQKBMhW7jixUHNsn4B1OyumTFpYMEnzmLIO
 cadQLYE9sUK/lbsSS0dqQeOEPAfTlKZE01vRue5sNDS5nIrqWLSPFRFwD2SHbtP0qL
 eTFdLA8p3YDz4syA0enjb6wBox74QcFOc9Zqs02SDkR30oNBp0vGqeB+QkFIEdAfUl
 516ewD7Lv8dag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mail.de header.i=@mail.de
 header.a=rsa-sha256 header.s=mailde202009 header.b=n2QJrMJF
Subject: Re: [Buildroot] Interested in board support for Radxa Rock 5b
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

I now created a linux config fragment file containing CONFIG_R8169=y to enable 
the ethernet support and added BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/
radxa/rock5b/linux.fragment" to the defconfig, so that the fragment file is 
applied. After a rebuild I was then able to boot the kernel via tftp (rootfs 
via nfs). So that seems to work now.

I now want to create a proper post-image script to create a bootable image for 
an SD card. I therefore created a post-image.sh and a genimage.cfg, by taking 
existing ones from buildroot as template, and the following rock5b.its:

/dts-v1/;

/ {
	description = "Rock 5B FIT Image";
	#address-cells = <1>;

	images {
		kernel {
			description = "Kernel";
			data = /incbin/("Image.gz");
			type = "kernel";
			arch = "arm64";
			os = "linux";
			compression = "gzip";
			load = <0x0a200000>;
			entry = <0x0a200000>;
			hash {
				algo = "sha256";
			};
		};
		fdt {
			description = "Device Tree";
			data = /incbin/("rk3588-rock-5b.dtb");
			type = "flat_dt";
			arch = "arm64";
			compression = "none";
			load = <0x0e000000>;
			entry = <0x0e000000>;
			hash {
				algo = "sha256";
			};
		};
	};

	configurations {
		default = "bootconfig";
		bootconfig {
			description = "Boot configuration";
			kernel = "kernel";
			fdt = "fdt";
			hash {
				algo = "sha256";
			};
		};
	};
};


When I use this its-file manually (i.e., "mkimage -f rock5b.its image.itb"), it 
creates the fit image correctly: I can load the image.itb via tftpboot and boot 
it successfully. Hence, in the post-image.sh I use the line:

mkimage -f board/radxa/rock5b/rock5b.its ${BINARIES_DIR}/image.itb

However, when buildroot executes the post-image.sh the mkimage command 
suddenly throws the following error:

mkimage: unsupported type Flat Device Tree

Unfortunately I don't find any hints on the internet what is going wrong here. 
I only find one old buildroot ml thread, but this only reports the same error 
and does not give any clue what is going wrong. Does somebody have a hint for 
me, what may be going wrong?

Best regards,
Kilian


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A005C433FE
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 17:02:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FE2281D73;
	Tue,  8 Feb 2022 17:02:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1TiKPuSvKIWD; Tue,  8 Feb 2022 17:02:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EB5D813D7;
	Tue,  8 Feb 2022 17:02:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 17BB41BF301
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 17:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0570D813D7
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 17:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WkPK20wR7uxp for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 17:02:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3400C813C1
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 17:02:36 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HTswnZmGHNVvLHTsxn1Uti; Tue, 08 Feb 2022 18:02:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644339755; bh=+WllvwuvU8SgiREZh0a5TTPGamZtBP7pmOFyqa4TQw4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=G0Mg6X13p2pIUmRlwQ7e+QK453fZjQAiMqw48tVoYx97cT561qXiJvhqp/lJAHuhH
 N4ScFoOH7a7R+PMAHt3YjiOkgQPlxcz7IUN/JiMHRyDOcpVVoO8P//PfeqE6NFouVS
 hbs/RZ7R91sECwIcQBuBeD23w9W2v4+Yo9gFjptX2K5ZlXTgPv+CND/0xk7Ua9FUCh
 b676EZsn3uETzOLMPoTYPFqL9M9GKqN7XbxjCg/68R/KfGJaK7YPcn9s+hKG+t/gP1
 mVBZMrZBKMSNDj0mNC+AncrpAQFGTp89Dfbtg6Q0VtvM5VGhEqLsVfCRvunfrw+j+l
 irXHUrErItUdg==
Message-ID: <97653013-1d33-4a03-00cf-ffdb3fa5e723@benettiengineering.com>
Date: Tue, 8 Feb 2022 18:02:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
 <SJ0PR02MB77585322044616B1600B5D83D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <cfd7b2a1-f06b-c068-939b-f4f0bfe740b8@benettiengineering.com>
 <PH0PR02MB7750946D063D95F7A04A75DBD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <PH0PR02MB7750946D063D95F7A04A75DBD72D9@PH0PR02MB7750.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfN1nTbNloSs8emDZSCXPqqgH+hWYEZdveisanTm/caOMe8N9QmGVHU/PpPLu7LpUkAGfjy0XqBfxsl0Is11x271jf2eU2eVq5zXZWDH8RQvO63IErq6W
 WEDCgmA65Kjaayki724vholfcy59QtLYWKqLoPDPScc+rbYnNzF41F7cpy0Bh4rRiXM5KcqyFW1D2tjxRQspZV0YluLQkpsbBEbcONTyujB7o2C+up9W2W9B
 EhSgmnGU/Gl3EAJ9SNeU7WiwABjdMQOXZ9q8ohuQ7o1iL6XCJLti4fTkEndGGUNi
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 Michal Simek <michals@xilinx.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 08/02/22 17:43, Neal Frager wrote:
> Hi Giulio,
> 
>> I'm building both defconfigs and see if everything is ok.
>> In meanwhile I ask you to subscribe and set as "superseded" the old patches in buildroot patchwork:
>> https://patchwork.ozlabs.org/project/buildroot/list/
> 
> Done.  Let me know if you see any issues with my patch set.  On my side, it builds and runs without any manual steps required.

You've missed one thing in defconfig you couldn't see because it's on 
host-side:
BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

that goes after:
BR2_TARGET_UBOOT_NEEDS_DTC=y

that is required by uboot in hosts where openssl is not installed, in 
your system is installed so you don't see the error.
This is true for both defconfigs.

I ask you to reproduce it by using these docker's instructions:
https://patchwork.ozlabs.org/project/buildroot/patch/20220203235438.610277-1-giulio.benetti@benettiengineering.com/

Have you already used docker?

Also there is another problem on post-image.sh:
```
INFO: cmd: "find 
'/home/br-user/git/upstream/ci-tests/zynqmp_zcu106_defconfig/build/genimage.tmp/root' 
-depth -type d -printf '%P\0' | xargs -0 -I {} touch -r 
'/tmp/tmp.OZIeSLbRSO/{}' 
'/home/br-user/git/upstream/ci-tests/zynqmp_zcu106_defconfig/build/genimage.tmp/root/{}'" 
(stderr):
ERROR: file(extlinux.conf): 
stat(/home/br-user/git/upstream/ci-tests/zynqmp_zcu106_defconfig/images/extlinux.conf) 
failed: No such file or directory
ERROR: vfat(boot.vfat): could not setup extlinux.conf
```

That is because you need extlinux.conf to be copied in post-build.sh 
script, not in post-image.sh because it is too late(image is already 
generated), but you need it *to* generate image.

So you have to create a specific post-build.sh with:
cp board/zynqmp/extlinux.conf output/images/extlinux.conf
and point to it with BR2_ROOTFS_POST_BUILD_SCRIPT.
BUT don't use explicit paths like them, but always try to imitate what 
other boards/packages do, like:
```
#!/bin/sh
BOARD_DIR="$(dirname $0)"

install -m 0644 -D $BOARD_DIR/extlinux.conf 
$BINARIES_DIR/extlinux/extlinux.conf
```
Because if you change the output directory to build buildroot with:
# make O=../output-zynqmp zynqmp_zcu102_defconfig
that script will never work.

And that fixes the problem.

So now I wait for V2 :-)

>> Take care next times, when you send another version you should produce the patch with -v2(or -v3 etc.) flash and indicate what you've changed between versions.
> 
> Ok, no problem.

+1

> Thanks again for all your help!

It's a pleasure

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA534C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 17:16:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86BF460B99;
	Mon,  7 Feb 2022 17:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n8KIdcAFcbUN; Mon,  7 Feb 2022 17:16:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0B4D60B96;
	Mon,  7 Feb 2022 17:16:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34ABA1BF29C
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30C6C60B95
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 17:16:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 16Reu7WUBStM for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 17:16:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id 935FC60B20
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 17:16:41 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id H7d0nDzwtvHpTH7d0nIXEu; Mon, 07 Feb 2022 18:16:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644254199; bh=A8T9+2MlPsrk12xovtGAkwqy40Gb4bZ1MNxMW1iU6zA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=cFwvagJt5Az/kWkFpanWMC4Klmg2nqsQEdTwqDiuucqrMr24gQWKOzvE9hFwxSgjs
 QaJIy8Qg+evyXQo7FH+oLB+XM0CS+1rz1tVXldoXTvvitAZQrp+aUJyjSi+QSrZn0w
 HCYGrCPAmOS8mZ12i+DkDQfODYfjbIZsPTfDzRgD81UoPSleIrmjiCMA/m39WPgAXi
 ONbrbLf7RC9xj2dW+62QQgS1kL02V+q50Q0PoxZQ7Gco2gxd9g6XVybT0+Wxbfkah1
 UPIfSkzO4MUWvXcIsVr9MdzHCJbcx6pzM65qCX69nrTuDtKcVgZVP0f+DoPd1HtE25
 4Aw6hzeGRf80A==
Message-ID: <fb6fd9dc-7619-5768-a1b4-00324516b4d4@benettiengineering.com>
Date: Mon, 7 Feb 2022 18:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>, Luca Ceresoli <luca@lucaceresoli.net>
References: <SJ0PR02MB7758F655ACB4D148D78E403BD72B9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <0a82d8c7-a0c6-06a5-6a0b-788fd5c4a935@benettiengineering.com>
 <8be136a0-1263-3b17-0b78-b7d34ef146c2@lucaceresoli.net>
 <SJ0PR02MB775843B513EA2CAFD0FEBD82D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <032d657b-eb9a-2dc9-f60b-8536f1fc6c57@lucaceresoli.net>
 <SJ0PR02MB7758A5DBC6DD4DA837E0F47FD72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <SJ0PR02MB7758129FFD78D128D3393198D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <16f4b7bf-546b-3bf4-c6a3-b711c8cfcadb@lucaceresoli.net>
 <SJ0PR02MB77586A616AEE69FE18916F15D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB77586A616AEE69FE18916F15D72C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfKpGlvbN+YKb0Fef5654ics/SUDMwmcZ7dflNyVV2wGCXPstu7PXxC9a8IcDzcWcpJf3zkZ88SlcKCW7ZVHKZ4GDxi1ZSrzS5JGeipzggu1PLHOQNC6Z
 09Wjodi7zYlHz29TCXVDjoSJzZv59d2rFCPP+QfXJkWJB2zN3g7YABb+IPiZ/Gk7VJs4MDtZP7MmiitE/wySfVBLApi8UOoaS2u9r8r8YoTLl8wJqnpq+B9o
 piT2XxHeXM0VQg8uBUOxyxD5kxJCdEIyK8Z/2WEiwJU=
Subject: Re: [Buildroot] Xilinx zynqmp_zcu10x_defconfigs: two things left
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 07/02/22 18:03, Neal Frager wrote:
> Hi Luca,
> 
>> Vitis 2020.1 changed the format of pm_cfg_obj.c. There's a fix commit [0] in U-Boot 2021.04 but as you are based on 2021.01 you don't have it.
> 
>> You have two options to use that fix:
>>   1. use U-Boot >= 2021.04
>>   2. provide that commit as a patch to the uboot package in Buildroot
> 
>> To go for option 2, you'll have to put the patch in the BR2_GLOBAL_PATCH_DIR, and of course _not_ remove BR2_GLOBAL_PATCH_DIR from the defconfig as you would otherwise.
> 
>> Hint to create the patch file:
>> cd <u-boot-clone>
>>   git format-patch -1 d42ab39f58e828c99a0cba6890e29986e87d11f5
>>   mv 0001-*.patch <path-to-buildroot>/board/zynqmp/patches/uboot/
>> Then add a "Backported from:" line to the patch (see [1])
> 
> I have tested the new version of zynqmp_pm_cfg_obj_convert.py with U-Boot 2022.01, and I confirm that is solves the problem!  Great job!
> 
> I now just need to figure out how to generate an vfat partition that has the file extlinux.conf in the path /extlinux/extlinux.conf.  Once I have this piece, I will have a version of the defconfigs that builds and runs without manual steps.

In the boards I've pointed you before:
https://github.com/buildroot/buildroot/tree/master/board/orangepi/orangepi-lite2

there is everythyng you need, the post-build script:
https://github.com/buildroot/buildroot/blob/master/board/orangepi/orangepi-lite2/post-build.sh
that copies the extlinux.conf.

And as explained before you have to point to it like this:
https://github.com/buildroot/buildroot/blob/master/configs/orangepi_lite2_defconfig#L48

For creating the VFAT you can imitate this genimage.cfg file:
https://github.com/buildroot/buildroot/blob/master/board/orangepi/orangepi-lite2/genimage.cfg#L1-L11

that must be pointed by:
https://github.com/buildroot/buildroot/blob/master/configs/orangepi_lite2_defconfig#L46-L47

So you can imitate those steps and it should work as expected.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

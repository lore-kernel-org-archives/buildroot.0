Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC99C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 19:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC45982116;
	Sat, 23 Dec 2023 19:37:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC45982116
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCQZ93Bm0stu; Sat, 23 Dec 2023 19:37:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14B3B820E1;
	Sat, 23 Dec 2023 19:37:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B3B820E1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2B61BF32A
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 19:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2700820E1
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 19:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2700820E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MCLTrTrvmrwj for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 19:37:28 +0000 (UTC)
Received: from mail.tkos.co.il (hours.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DA709820E5
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 19:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA709820E5
Received: from localhost (unknown [10.0.8.4])
 by mail.tkos.co.il (Postfix) with ESMTP id DDACB440636;
 Sat, 23 Dec 2023 21:35:33 +0200 (IST)
References: <20231223064053.759D560AFF@smtp3.osuosl.org>
User-agent: mu4e 1.10.8; emacs 29.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Louis Chauvet
 <louis.chauvet@bootlin.com>
Date: Sat, 23 Dec 2023 21:23:40 +0200
In-reply-to: <20231223064053.759D560AFF@smtp3.osuosl.org>
Message-ID: <874jg8n218.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1703360133;
 bh=hn0e1v/mJPwBUtKEePMgDhYRV9fCIgTyC1DMR/RTzc4=;
 h=References:From:To:Cc:Subject:Date:In-reply-to:From;
 b=vcwDu+wMNpEtyHttLJN3OjCuXxQoUQNBv6xU3QR+3tfhoXjfD/xYEduW3NPYdNpQW
 MsTG6qs1YtyM8Cu6JX3D9dobwJQrXynM9q3jWXabPOhOIXfWKqdA22xU7Zg/2odRcr
 uHQOy0sebWJmhAYgpcDpUkRrPJDEYFkrg9HH5gtErKBMktCQOIN1Dej42i4hCg9vyY
 /IrnX+azr8FPqsTKS06WOA93yI1d3lGCJlVgN1ERIlEYCTlKAkbzkVY+hRW3QmJAxi
 83qxer25fikA3pi5DvqejYVgAYC0wTU4MtaYQxaNUL+p8yehNKR4jCjIyad5PNXnnv
 zY8iwuj1aLz2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=tkos.co.il header.i=@tkos.co.il
 header.a=rsa-sha256 header.s=default header.b=vcwDu+wM
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2023-12-22
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Louis, Buildroot list,

On Sat, Dec 23 2023, Thomas Petazzoni via buildroot wrote:
[snip]
> Detail of defconfig failures for master
> ---------------------------------------
>
>                         defconfig |                        link to the job                        | orph?
> ----------------------------------+---------------------------------------------------------------+------
>                           beaglev | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987287  |      
>                broadcom_northstar | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987344  |      
>               freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987418  |      
>                        imx8mmpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987483  |      
>                         imx8mpico | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987492  |      
>                         imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987495  |      
>                kontron_pitx_imx8m | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987511  |      
>                        ls1028ardb | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987542  |      
>                      ls1046a-frwy | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987545  |      
>               octavo_osd32mp1_brk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987654  |      
>               octavo_osd32mp1_red | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987659  |      
>                    orangepi_lite2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987699  |      
>                 orangepi_one_plus | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987705  |      
>                 qemu_aarch64_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987830  |      
>                 qemu_aarch64_sbsa | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987835  |      
>                     qemu_arm_ebbr | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987844  |      
>              qemu_arm_vexpress_tz | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799987857  |      
>                raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988095  | ORPH 
>                 raspberrypizero2w | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988122  |      
>              sipeed_licheepi_nano | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988208  |      
>                snps_arc700_axs101 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988296  |      
>                  snps_arc700_nsim | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988310  | ORPH 
>                 socrates_cyclone5 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988347  |      
>           solidrun_clearfog_gt_8k | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988354  |      

arm-trusted-firmware build fails with:

In file included from fiptool.h:16,
                 from fiptool.c:19:
fiptool_platform.h:19:11: fatal error: openssl/sha.h: No such file or directory
   19 | # include <openssl/sha.h>
      |           ^~~~~~~~~~~~~~~

I could not reproduce this issue here. The CI build log also shows
host-libopenssl build way before TF-A (lines 320-325):

>>> host-libopenssl 3.2.0 Downloading
>>> host-libopenssl 3.2.0 Extracting
>>> host-libopenssl 3.2.0 Patching
>>> host-libopenssl 3.2.0 Configuring
>>> host-libopenssl 3.2.0 Building
>>> host-libopenssl 3.2.0 Installing to host directory

An immediate suspect might be the recent change in fiptool build with
commit e7d16c35ae6b21 ("boot/arm-trusted-firmware: fix the RPATH of
fiptool"). Maybe something is missing in fiptool CFLAGS?

Any other idea?

Thanks,
baruch

>             solidrun_macchiatobin | https://gitlab.com/buildroot.org/buildroot/-/jobs/5799988359  | ORPH 
>                       ti_am62x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5808182268  |      
>                       ti_am64x_sk | https://gitlab.com/buildroot.org/buildroot/-/jobs/5808182300  |      
>               toradex_apalis_imx6 | https://gitlab.com/buildroot.org/buildroot/-/jobs/5808182330  |      


-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

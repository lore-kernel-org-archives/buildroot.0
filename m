Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF0CC4167D
	for <buildroot@archiver.kernel.org>; Thu,  2 Nov 2023 18:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F24D34EC55;
	Thu,  2 Nov 2023 18:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F24D34EC55
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B6TPMIvLZ272; Thu,  2 Nov 2023 18:31:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F8FF4F276;
	Thu,  2 Nov 2023 18:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F8FF4F276
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 014F51BF287
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:30:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7C454F276
 for <buildroot@lists.busybox.net>; Thu,  2 Nov 2023 18:30:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D7C454F276
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Odb3amESzKCz for <buildroot@lists.busybox.net>;
 Thu,  2 Nov 2023 18:30:53 +0000 (UTC)
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AC95E4EC55
 for <buildroot@buildroot.org>; Thu,  2 Nov 2023 18:30:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC95E4EC55
Received: from [192.168.50.220] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ycSvq9jLIV2laycSvq0UaL; Thu, 02 Nov 2023 19:30:49 +0100
Message-ID: <7f1c47f6-91f0-438a-83ab-621eabf032b6@benettiengineering.com>
Date: Thu, 2 Nov 2023 19:30:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231013210841.153788-1-giulio.benetti@benettiengineering.com>
 <20231102190748.3232ab71@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231102190748.3232ab71@windsurf>
X-CMAE-Envelope: MS4xfDo/fnIViZxcLf29oEpVc0Vf+9IdiPLSfepyBTZ/80keUO/4cxnogzGtbTLkrVcjtx1m84LOTFECdjOyhvWzs/b4Pf9OtGyRLojPGeyK84js0a8B7Blu
 hjmFrz6KRNmIQ9YvgDwlvUVkMYOZh8ZlSAKXJ3v9gvMx+62Fg09fkR6tFdcwyfiSrK5KSLBEqeHqj15gFU2hbZUOVVUDvJ1QO2tUVlq9Qq37dwi1QCfaBqXF
 yQI4ZZWIQz7qc34297js6dyYD3bKlvmmhIHBwYu58Lwz5cMvuIgT6Jwbfr02smGpVVMdby1J2f2mAZw13XrWIS8p1u5qQOtrJG3o8duzJCY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1698949849; bh=nGrRsMeKvurAQ7k/NNJIsNLTvGOpKeq/TzFa03jsRCk=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=A+D2/h1o2thWveLu72cFWtr5W0dE62Pj4o8IBdzSWb57Q/6uOWFEV4+vy54Wf7iM6
 iGtj6ZLr8fwzblZHCyVYxDdfZTbKmz6c8oruQk4Ms13pVZcPIk1TXtzc+bmDGvsmvR
 uxPO6uguLSzII+m7jqLy5pcBsP2BoX7MCa3fVYr6rPSk3ObiOGZAbzgoBLQDE3FSgc
 Wjp9E5tP3kNwbWdPGYu+Meoj2XdlWynBYDgGO1wYK+dHdGxrjNnRznSbzJaXnIHSMu
 3ct3Csqxbv71idh4ZdobgvxgLiNWANdDI4jfT+5QCvqTiiCnfzwHFQxW1sIwNcphwO
 js3h5YApHcLPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=A+D2/h1o
Subject: Re: [Buildroot] [PATCH 1/2] board/bananapi/bananapi-m2-berry:
 switch to use extlinux.conf
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
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 02/11/23 19:07, Thomas Petazzoni wrote:
> Hello Giulio,
> 
> Thanks for your work on this!
> 
> On Fri, 13 Oct 2023 23:08:40 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> diff --git a/board/bananapi/bananapi-m2-berry/genimage.cfg b/board/bananapi/bananapi-m2-berry/genimage.cfg
>> index 535f3dffee..92c8677545 100644
>> --- a/board/bananapi/bananapi-m2-berry/genimage.cfg
>> +++ b/board/bananapi/bananapi-m2-berry/genimage.cfg
>> @@ -1,15 +1,3 @@
>> -image boot.vfat {
>> -	vfat {
>> -		files = {
>> -			"zImage",
>> -			"sun8i-v40-bananapi-m2-berry.dtb",
>> -			"boot.scr"
>> -		}
>> -	}
>> -
>> -	size = 64M
>> -}
>> -
>>   image sdcard.img {
>>   	hdimage {
>>   	}
>> @@ -21,12 +9,6 @@ image sdcard.img {
>>   		size = 1016K # 1MB - 8KB
>>   	}
>>   
>> -	partition boot {
>> -		partition-type = 0xC
>> -		bootable = "true"
>> -		image = "boot.vfat"
>> -	}
>> -
>>   	partition rootfs {
>>   		partition-type = 0x83
>>   		image = "rootfs.ext4"
> 
> Are you sure this works? Indeed the FAT partition used to have the
> bootable = "true" flag. Now, no partition has this flag. But from what
> I remember, the heuristic that U-Boot uses to determine which partition
> has the extlinux.conf file is precisely this bootable flag.
> 
> Could you double check this?

Just rebuilt, flashed and given a run, this is the log, specifically in
u-boot:
```
Bus usb@1c19000: USB EHCI 1.00
scanning bus usb@1c19000 for devices... 2 USB Device(s) found
        scanning usb for storage devices... 0 Storage Device(s) found
Hit any key to stop autoboot:  0
switch to partitions #0, OK
mmc0 is current device
Scanning mmc 0:1...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
1:      Bananapi M2 Berry linux
Retrieving file: /boot/zImage
append: console=ttyS0,115200n8 root=/dev/mmcblk0p1 rootwait
Retrieving file: /boot/sun8i-v40-bananapi-m2-berry.dtb
Kernel image @ 0x42000000 [ 0x000000 - 0x4ee608 ]
## Flattened Device Tree blob at 43000000
    Booting using the fdt blob at 0x43000000
Working FDT set to 43000000
    Loading Device Tree to 49ff6000, end 49fff231 ... OK
Working FDT set to 49ff6000

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0

```

It looks for /boot/extlinux/extlinux.conf among the medias and other 
scripts. So yes, it works.

Kind regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

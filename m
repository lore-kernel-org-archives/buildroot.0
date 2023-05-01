Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F6B3C77B61
	for <buildroot@archiver.kernel.org>; Mon,  1 May 2023 15:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15AC1401CC;
	Mon,  1 May 2023 15:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15AC1401CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 39A6zjQmkvWe; Mon,  1 May 2023 15:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C5E34046A;
	Mon,  1 May 2023 15:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C5E34046A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C65D1BF319
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 15:31:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22D584046A
 for <buildroot@lists.busybox.net>; Mon,  1 May 2023 15:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22D584046A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xfky5BqRmHEA for <buildroot@lists.busybox.net>;
 Mon,  1 May 2023 15:31:31 +0000 (UTC)
X-Greylist: delayed 00:07:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B2D040108
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B2D040108
 for <buildroot@buildroot.org>; Mon,  1 May 2023 15:31:30 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.104.90])
 by Aruba Outgoing Smtp  with ESMTPSA
 id tVO2pZQU5PFeJtVO2peRuO; Mon, 01 May 2023 17:24:23 +0200
Message-ID: <a6f4c8b1-3690-06a7-ecf2-72998ef08535@benettiengineering.com>
Date: Mon, 1 May 2023 17:24:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20230423170820.1395767-1-dario.binacchi@amarulasolutions.com>
 <5d85dc91-bd40-1637-60d3-8717d7a5ecf6@benettiengineering.com>
In-Reply-To: <5d85dc91-bd40-1637-60d3-8717d7a5ecf6@benettiengineering.com>
X-CMAE-Envelope: MS4xfL1SEcLcfRp95IINNZIQonue2lXQWNOSxeFGrz4RQmIPoZdwYSsMBN2GfURZEhe4uDm87h8+c7NKaKKeM9KiGBaFtFAzuffGUWxl+Q2nY0DAkBQ3lKDJ
 3KyVSq+F6hgfyv4VSEEz/9a0DFru5AsGojnqdvir7FfnQLbd9McoX/ewzIUpcycmm4fAl1p2vWG6a25iNwybmVxTOMPor/js2uU7/ubnerr9ES/syoCQvDzH
 GdbnNjRuJUp/lC02oIt5n735gDrDaE89RrRpjMqZOeo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1682954663; bh=8IM9vuRQCiiq1yJOA/St8B3L83bMOdJXAC3cHS62nrg=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=CmeHvKUkvFuDZKmVwz6XrwofLNaAGpDl4UqfSRbw6TGT3Aag0y0ztEOBTtXMUTyDk
 W9j0YFbRkFpd2ROH/j/+yDKRwotATC9stx3nj0BV1sbaz6q4+fk04NueR2AUqNEsPR
 5rbehxU/1qxwY9/LMv7s4gEqElFXe57HIF+GpnKYmFCwEWyAshD9f6NGUBiesfM0eV
 dnScXcnFiiRVlyB8iIyzMqNVtOJ8mb7rWcUQwknRUDhg5u6FrpwOEulLHHD7ji2qgG
 UKgdrYsTbJoKhEqN0PgrsKxU//+wmt7042SLkH/oRXspjCVrfTGbb1wwmVDJN5KYxw
 U0F645wQ36tqA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CmeHvKUk
Subject: Re: [Buildroot] [PATCH v2 1/1]
 configs/stm32f769_disco_sd_defconfig: new defconfig
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pardon, please drop this answer. The other stm32fxxx boards use
the same script naming convention.

Sorry for the noise

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas

On 01/05/23 17:17, Giulio Benetti wrote:
> Hi Dario,
> 
> On 23/04/23 19:08, Dario Binacchi wrote:
>> Board support package includes the following components:
>> - mainline Linux kernel 5.15.108
>> - mainline U-Boot 2023.04
>> - default packages from buildroot
>>
>> Note: There is a problem in u-boot display management. It should display
>> the ST microelectronics logo but "noise" is displayed (like when running
>> the command dd if=/dev/urandom of=/dev/fb0 in Linux). I also tried to
>> change version (even the first version in which this feature was
>> introduced), but without success. Despite this I decided not to disable
>> the video management configuration to remind us that it needs to be
>> fixed :).
>>
>> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Link: https://www.st.com/en/evaluation-tools/32f769idiscovery.html
>> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
>>
>> ---
>>
>> Changes in v2:
>> - Replace BR2_cortex_m4 with BR2_cortex_m7
>> - Use Linux kernel version 5.15.108
>>
>>    DEVELOPERS                                    |  2 ++
>>    .../stm32f769-disco/extlinux.conf             |  4 +++
>>    .../stm32f769-disco/flash_sd.sh               | 18 +++++++++++
>>    .../stm32f769-disco/genimage.cfg              | 27 ++++++++++++++++
>>    .../stm32f769-disco/linux-sd.fragment         |  1 +
>>    .../stm32f769-disco/post-build.sh             |  7 ++++
>>    .../stm32f769-disco/readme.txt                | 32 +++++++++++++++++++
>>    configs/stm32f769_disco_sd_defconfig          | 30 +++++++++++++++++
>>    8 files changed, 121 insertions(+)
>>    create mode 100644 board/stmicroelectronics/stm32f769-disco/extlinux.conf
>>    create mode 100755 board/stmicroelectronics/stm32f769-disco/flash_sd.sh
>>    create mode 100644 board/stmicroelectronics/stm32f769-disco/genimage.cfg
>>    create mode 100644 board/stmicroelectronics/stm32f769-disco/linux-sd.fragment
>>    create mode 100755 board/stmicroelectronics/stm32f769-disco/post-build.sh
>>    create mode 100644 board/stmicroelectronics/stm32f769-disco/readme.txt
>>    create mode 100644 configs/stm32f769_disco_sd_defconfig
>>
>> diff --git a/DEVELOPERS b/DEVELOPERS
>> index d9e95a3d0531..438d4738b307 100644
>> --- a/DEVELOPERS
>> +++ b/DEVELOPERS
>> @@ -702,8 +702,10 @@ F:	package/xinetd/
>>    
>>    N:	Dario Binacchi <dario.binacchi@amarulasolutions.com>
>>    F:	board/bsh/
>> +F:	board/stmicroelectronics/stm32f769-disco/
>>    F:	configs/imx8mn_bsh_smm_s2_defconfig
>>    F:	configs/imx8mn_bsh_smm_s2_pro_defconfig
>> +F:	configs/stm32f769_disco_sd_defconfig
>>    F:	package/sscep/
>>    F:	package/uuu/
>>    
>> diff --git a/board/stmicroelectronics/stm32f769-disco/extlinux.conf b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
>> new file mode 100644
>> index 000000000000..48483a01fc4e
>> --- /dev/null
>> +++ b/board/stmicroelectronics/stm32f769-disco/extlinux.conf
>> @@ -0,0 +1,4 @@
>> +label stm32f769-disco-buildroot
>> +  kernel /zImage
>> +  devicetree /stm32f769-disco.dtb
>> +  append console=ttySTM0,115200 root=/dev/mmcblk0p2 rw rootfstype=ext2 rootwait earlyprintk consoleblank=0 ignore_loglevel
>> diff --git a/board/stmicroelectronics/stm32f769-disco/flash_sd.sh b/board/stmicroelectronics/stm32f769-disco/flash_sd.sh
>> new file mode 100755
>> index 000000000000..0ff3ae7dbfb3
>> --- /dev/null
>> +++ b/board/stmicroelectronics/stm32f769-disco/flash_sd.sh
>> @@ -0,0 +1,18 @@
>> +#!/bin/bash
>> +
>> +OUTPUT_DIR=$1
>> +
>> +if ! test -d "${OUTPUT_DIR}" ; then
>> +    echo "ERROR: no output directory specified."
>> +    echo "Usage: $0 OUTPUT_DIR"
>> +    exit 1
>> +fi
>> +
>> +"${OUTPUT_DIR}"/host/bin/openocd -f board/stm32f769i-disco.cfg \
>> +  -c "init" \
>> +  -c "reset init" \
>> +  -c "flash probe 0" \
>> +  -c "flash info 0" \
>> +  -c "flash write_image erase ${OUTPUT_DIR}/images/u-boot.bin 0x08000000" \
>> +  -c "reset run" \
>> +  -c "shutdown"
> 
> this script flashes the uboot rinary only, so can you please change its
> name to flash_uboot.sh or similar? Or if it is a uboot specific for
> sd-card then append a -uboot suffix.
> 
> Thank you!
> Best regards

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

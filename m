Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0748C32771
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 16:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 485D641A17;
	Sun, 18 Sep 2022 16:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 485D641A17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uBBXSHdciThx; Sun, 18 Sep 2022 16:22:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4ADE41A0F;
	Sun, 18 Sep 2022 16:22:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E4ADE41A0F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8794A1BF5B5
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6300E60A6B
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 16:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6300E60A6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S6-CvRFuvgts for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 16:22:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5498607D1
Received: from smtpcmd01-sp1.aruba.it (smtpcmd01-sp1.aruba.it [62.149.158.218])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5498607D1
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 16:22:28 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.46.240])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Zx3qovXgCsT4eZx3qogD4O; Sun, 18 Sep 2022 18:22:26 +0200
Message-ID: <789d2331-074e-8cb9-4378-4b91d10f7d0e@benettiengineering.com>
Date: Sun, 18 Sep 2022 18:22:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220918125309.1128650-1-giulio.benetti@benettiengineering.com>
 <20220918153710.GC1127102@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220918153710.GC1127102@scaer>
X-CMAE-Envelope: MS4xfPtE4dRPu1jTi5DedV5a0nRpH5fiDOAjv1tF+zFagCtOf/E54u1q6a2lSqTln671mo8JBIYmpH4KMYNtw+eoGzWgPKkY+eKIg5Fnz0rS0JtSttPX4Unp
 RjD5MnTbWhlJBc29hzh5cWdBJiQzVTiGbdZkyhvjy1OtdxzyETtbE60ThQ0TE8WycYtp/9ryko3pJZain1Tp4iTk7qNBTLBZqtxA0BwzUnKYiTsyEJbOZK40
 uPKQPWGSh7bqYbCQnWM/fG02+xju2xOx/TNiTbg8PAI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663518146; bh=QtvL1ts6ICTghN6kFRx858Hz+lAGrVF5XbHom2YYeYw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Lgb3d6tKNH1ytfoBQapfVY+Oil60n9CAk1imFCLQl3islxjtuqyESWxGzc2MuyKXq
 cwmYgjnd+EYINhQKbKIp50TbInhbp/RRNGQrSUIGfP9zygKELYx2HoF+5BaYjZg5TZ
 857Pi8jmV+kSpXKd6ta9B8jEcVrH8/7OiSyPhIbD7UprT5m6g1mp2Nond7sEM5XwQ5
 tAHsvnXew6qmKW5ShpfyVcOpNy14zqeSWWTv/RSl4ckNsqCsmDIGX4XDLOOV8xEL7K
 x6W80jKL9EVV/0PPtnaSOFqVGrwVE/ZZ00RoVURVwxXS3UU/xBNWVh+03OQMDW921Y
 yoG46DGwIOWog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Lgb3d6tK
Subject: Re: [Buildroot] [PATCH] package/mmc-utils: fix build failure due to
 a warning and -Werror enabled
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnd,

On 18/09/22 17:37, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2022-09-18 14:53 +0200, Giulio Benetti spake thusly:
>> Add patch to fix warning that is treated like error:
>> ```
>> In function '__bswap_32',
>>      inlined from 'do_rpmb_write_block' at mmc_cmds.c:2293:27:
>> /home/autobuild/autobuild/instance-15/output-1/host/aarch64-buildroot-linux-gnu/sysroot/usr/include/bits/byteswap.h:52:10: error: 'cnt' may be used uninitialized [-Werror=maybe-uninitialized]
>>     52 |   return __builtin_bswap32 (__bsx);
>>        |          ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mmc_cmds.c: In function 'do_rpmb_write_block':
>> mmc_cmds.c:2270:22: note: 'cnt' was declared here
>>   2270 |         unsigned int cnt;
>>        |                      ^~~
>> cc1: all warnings being treated as errors
>> ```
>> Patch is pending upstream:
>> https://patchwork.kernel.org/project/linux-mmc/patch/20220918124210.1127345-1-giulio.benetti@benettiengineering.com/
> 
> Arnd requested a different fix, arguing the one you proposed is hiding a
> compiler warning without fixing the root cause.

Yes, he's totally right and I've just re-spinned V3 patch:
https://lore.kernel.org/linux-mmc/20220918124210.1127345-1-giulio.benetti@benettiengineering.com/T/#mce3840c0bf84e1743552aa9428ef9097b613c610

Now I prepare send the V2 Buildroot patch.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Regards,
> Yann E. MORIN.
> 
>> http://autobuild.buildroot.net/results/18c4fce5416e5d1ccd95900ccef87d4c045a361e/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   ...ds.c-fix-warning-on-uninitialized-cn.patch | 27 +++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>   create mode 100644 package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch
>>
>> diff --git a/package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch b/package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch
>> new file mode 100644
>> index 0000000000..e2f74879a6
>> --- /dev/null
>> +++ b/package/mmc-utils/0002-mmc-utils-mmc_cmds.c-fix-warning-on-uninitialized-cn.patch
>> @@ -0,0 +1,27 @@
>> +From bf783bbc2da0348591dd317ccd53bbfc5a57f2f8 Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Sun, 18 Sep 2022 14:10:29 +0200
>> +Subject: [PATCH] mmc-utils: mmc_cmds.c: fix warning on uninitialized 'cnt'
>> +
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +[Upstream status: https://patchwork.kernel.org/project/linux-mmc/patch/20220918124210.1127345-1-giulio.benetti@benettiengineering.com/]
>> +---
>> + mmc_cmds.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/mmc_cmds.c b/mmc_cmds.c
>> +index 12b7802..777d649 100644
>> +--- a/mmc_cmds.c
>> ++++ b/mmc_cmds.c
>> +@@ -2436,7 +2436,7 @@ int do_rpmb_write_block(int nargs, char **argv)
>> + 	int ret, dev_fd, key_fd, data_fd;
>> + 	unsigned char key[32];
>> + 	uint16_t addr;
>> +-	unsigned int cnt;
>> ++	unsigned int cnt = 0;
>> + 	struct rpmb_frame frame_in = {
>> + 		.req_resp    = htobe16(MMC_RPMB_WRITE),
>> + 		.block_count = htobe16(1)
>> +--
>> +2.34.1
>> +
>> -- 
>> 2.34.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

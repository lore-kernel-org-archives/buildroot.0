Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB8FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 19:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF665408D1;
	Mon, 21 Feb 2022 19:10:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ucyH8Sqrod2S; Mon, 21 Feb 2022 19:09:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFC9F4046D;
	Mon, 21 Feb 2022 19:09:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 574AC1BF319
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 19:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 533C4813BB
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 19:09:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mH71-HtHIMql for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 19:09:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F113813AB
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 19:09:55 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.188.82])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ME4GnLpvmDQ7SME4HnHl9N; Mon, 21 Feb 2022 20:09:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1645470593; bh=X2knmjp/9qQtPxyLYP1yQs4NZ/YfVD/OFbsfLUFuVsI=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=Tg7VFbTcWRmFLdGQWstR/2P6pzNyyi7XbHykis4Lo1rHFEM1nijzfsxiQ7gUPfA5E
 dDlf/3V+TOK/dwPguGqs2/aFtSJ4mpJ483fkKmuJoj/jzEFHcuaupJLqaZechxk8GP
 plhbrUosL5k4Wpw8m8Z6HJJG/7LZOkkLBHU5v/VDr6FpLUcrYVCgmGSJLCjeAcZQ86
 OmrnrGdFo4Kl7h8/AnXy1bZ6nGoZVh6bnkRXjGyAaiBT5/A2umwbIoRRlGDu3k1SI0
 GPNZOmNAkB8ImpXWSDE7YFEZq4yuQMHM5AuDr8Me50Ifp6q1qKWeqkymfRaRSd2688
 ZUNJ/voJqGCUA==
Message-ID: <d743fa6b-701f-b24d-3a9f-4879a014e463@benettiengineering.com>
Date: Mon, 21 Feb 2022 20:09:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Yu Chien Peter Lin <peterlin@andestech.com>
References: <20220215053327.4046-1-peterlin@andestech.com>
 <b7e77527-b4a2-e0ea-90d9-eebc08a9ac62@benettiengineering.com>
 <YhMI2gtO4W/g5qhv@APC323>
 <1c7b8b85-7b50-0832-24e8-174100f5a6f5@benettiengineering.com>
In-Reply-To: <1c7b8b85-7b50-0832-24e8-174100f5a6f5@benettiengineering.com>
X-CMAE-Envelope: MS4wfMf+IZ9caM8Mp7UkGOAhvpasRDjAtxz841alYW7/vnrPQg6A8jItWUI53VRR6dPBts6Q11HFfGMv5BBwp2oDsPwjjh2ZwTx/Aby6cTzOWlaZYTXXbz2o
 6rprfLTMdn5mL/ev+VNlmZWxtf5QiFAeG1bM7Le8twR55DwgOTlmhTp6bNe4uDUXcu/+vtf+KayyahgQ9c01fPqHmKFTxwxOKYVC3h/lVOs24X5frajMFKeY
 bPhN35RFbgdf103BlavksNBFoCysnIEy3Qkc5nKLtc4=
Subject: Re: [Buildroot] [PATCH v3 1/3] board/andes: rearrange nds32 folder
 structure
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
Cc: alankao@andestech.com, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ah, forgotten to mention,

On 21/02/22 10:07, Giulio Benetti wrote:
> Hi Peter, Alan,
> 
> On 21/02/22 04:37, Yu Chien Peter Lin wrote:
>> Hi Giulio,
>>
>> On Thu, Feb 17, 2022 at 04:55:49PM +0100, Giulio Benetti wrote:
>>> Hi Peter,
>>>
>>> On 15/02/22 06:33, Yu Chien Peter Lin wrote:
>>>> Rearrange nds32 folder structure to add AE350 platform.

Please explain here that AE300 and AE350 are 2 different platform by 
also pointing the URL I've pointed you below.

Thank you
-- 
Giulio Benetti
Benetti Engineering sas

>>>> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
>>>> Signed-off-by: Alan Kao <alankao@andestech.com>
>>>> ---
>>>>     .../patches/linux/0001-nds32-Fix-boot-messages-garbled.patch    | 0
>>>>     ...2-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch | 0
>>>>     board/andes/{ => ae3xx}/readme.txt                              | 0
>>>>     configs/andes_ae3xx_defconfig                                   | 2 +-
>>>>     4 files changed, 1 insertion(+), 1 deletion(-)
>>>>     rename board/andes/{ => ae3xx}/patches/linux/0001-nds32-Fix-boot-messages-garbled.patch (100%)
>>>>     rename board/andes/{ => ae3xx}/patches/linux/0002-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch (100%)
>>>>     rename board/andes/{ => ae3xx}/readme.txt (100%)
>>>
>>> Here we have both:
>>> board/andes/ae3xx
>>> and
>>> board/andes/ae350
>>>
>>> ae3xx should be use for every ae3xx family(ae350 included), but for ae350
>>> you use a specific folder.
>>> What I see digging into ae3xx is that it is for FPGA demonstration, so I
>>> would move ae3xx directory to be name as ae3xx-fpga. Otherwise I would
>>> expect ae350(and newer parts) to be part of ae3xx.
>>>
>>> Same goes for the defconfig, I would name it like:
>>> andes_ae3xx_fpga_defconfig
>>>
>>> This way we can divide the 2 typologies:
>>> - fpga demonostration for ae3xx
>>> - ae3xx SoC family
>>>
>>> Otherwise you should provide a single family folder(ae3xx) compatible for
>>> both fpgas and SoCs.
>>>
>>> Thank you
>>>
>>> Best regards
>>> -- 
>>> Giulio Benetti
>>> Benetti Engineering sas
>>
>> For this naming issue, we decide to make ae3xx
>> explicit to have these two platform residing
>> in its own folder. So it would be:
>>
>> board/andes/
>>    |- {ae3xx => ae300}/
>>    `- ae350/
>>
>> If this make sense to you, I will submit PATCH v4.
> 
> It works for me.
> I've checked your website and I see:
> http://www.andestech.com/en/products-solutions/andeshape-platforms/
> 
> where you have:
> AE300:
> http://www.andestech.com/en/products-solutions/andeshape-platforms/ae300/
> 
> and AE350:
> http://www.andestech.com/en/products-solutions/andeshape-platforms/ae350-axi-based-platform-pre-integrated-with-n25f-nx25f-a25-ax25/
> 
> so your solution fits perfectly since they are two very distinct platforms.
> 
> So yes please send V4 with that change.
> 
> Thank you!
> 
> Best regards

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

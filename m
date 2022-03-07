Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8D3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Mar 2022 22:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 309DD60D57;
	Mon,  7 Mar 2022 22:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3vO12llJyyxp; Mon,  7 Mar 2022 22:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6041E60EF9;
	Mon,  7 Mar 2022 22:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF0AD1BF39D
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:39:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC7C2812D8
 for <buildroot@lists.busybox.net>; Mon,  7 Mar 2022 22:39:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NnCrheDPYRux for <buildroot@lists.busybox.net>;
 Mon,  7 Mar 2022 22:39:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp1.osuosl.org (Postfix) with ESMTP id 546528131E
 for <buildroot@buildroot.org>; Mon,  7 Mar 2022 22:39:16 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.7.124])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RM0Wn9f61POoWRM0Wnhy2U; Mon, 07 Mar 2022 23:39:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1646692753; bh=kufbrQEVYnnGDxoNNcuu6220z9gBux/KQ/IrDIpZrSc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=MorBfdWmJASDXOcY81fTLkdd+D8SlMpAgJA6QRwd3OHRCClBURSI8m1vTRLKM/P7u
 xgc2TLLzG+espAohBb2gRCU8JC/ids+XAe1Gljbs0n6iwtMBEf++B/ZVYm9xG0aHJ/
 hz9sFe1iHvZ+hgvKKPXtYDo84jiLkHm2Qp8j0U4Ql+mzsmpYmTc3rX9lVdsBT1jQfc
 nROeBmdREcG0+k+53eVIt/us4eze4SicjDBqRFDTIn+bqt4VToNei3uNCBnNsH/KXc
 cdB/Q1VsIQI82UakacjPE8emnOFxLvsVHn6ndcsUxHOECLhlTcmIcIfM8WK7SIYhJ2
 Bt3sUcy2MaWPw==
Message-ID: <5226fc1a-8e39-26ea-8ef8-ad435bc317f8@benettiengineering.com>
Date: Mon, 7 Mar 2022 23:39:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220218110914.3098061-1-giulio.benetti@benettiengineering.com>
 <67313303-db84-93cd-d96b-56db0c73976b@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <67313303-db84-93cd-d96b-56db0c73976b@mind.be>
X-CMAE-Envelope: MS4wfDLV8yfD5Z8RvQe9SYsYs2tugELT+PKrNPzT998rGQTXH5kITkW/YjxJ8k9kQbrZCPS/YpkUvHLt+esPhlitmZZNWHMbhk2ArawYkSS0USpUmWief4Fg
 cpwduJ6rOCACvz0nS8STcs8MYhf6SgEq+uN/jHqsVvZxkTC+25aX1ZjvEQAFfyycwgksXT2+pmVm2dtX2Bd2LcDDZD2bN0XgjcjDPE5FDV/2dmWmfKCK7wEC
 aBr0TlkqPXFOA8vUdgxDveJ5Qp7ElbjN3PiXejaJP5o=
Subject: Re: [Buildroot] [PATCH]
 configs/microchip_sam9x60ek_mmc_dev_defconfig: fix build failure due to
 previous wrong commit
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
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 07/03/22 22:46, Arnout Vandecappelle wrote:
> 
> 
> On 18/02/2022 12:09, Giulio Benetti wrote:
>> Commit 616ba9c90b014637dc9925fa442a0af4a11f04b8 extended rootfs size, but
>> the option was listed in the wrong place. Options must be set in the order
> 
>    Order doesn't matter in kconfig. The problem was the lack of quotes.

Oh, maybe I was told only because of style some time ago. I didn't see 
the quotes.. probably I was/am cooked.

>    Updated the commit message and applied to master, thanks.

Thank you!
-- 
Giulio Benetti
Benetti Engineering sas

>    Regards,
>    Arnout
> 
>> they are specified by Config.in files. So let's move
>> BR2_TARGET_ROOTFS_EXT2_SIZE="120M" right after BR2_TARGET_ROOTFS_EXT2_4=y
>> as it should be.
>>
>> Fixes:
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784289
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>    configs/microchip_sam9x60ek_mmc_dev_defconfig | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configs/microchip_sam9x60ek_mmc_dev_defconfig b/configs/microchip_sam9x60ek_mmc_dev_defconfig
>> index 00ccd784b5..06e03967c4 100644
>> --- a/configs/microchip_sam9x60ek_mmc_dev_defconfig
>> +++ b/configs/microchip_sam9x60ek_mmc_dev_defconfig
>> @@ -7,7 +7,6 @@ BR2_TARGET_GENERIC_HOSTNAME="sam9x60ek"
>>    BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>>    BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
>>    BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sam9x60ek_mmc/genimage.cfg"
>> -BR2_TARGET_ROOTFS_EXT2_SIZE=120M
>>    BR2_LINUX_KERNEL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
>>    BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,linux4microchip,linux,linux4microchip-2021.10)/linux-linux4microchip-2021.10.tar.gz"
>> @@ -67,6 +66,7 @@ BR2_PACKAGE_HTOP=y
>>    BR2_PACKAGE_VIM=y
>>    BR2_TARGET_ROOTFS_EXT2=y
>>    BR2_TARGET_ROOTFS_EXT2_4=y
>> +BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
>>    BR2_TARGET_AT91BOOTSTRAP3=y
>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
>>    BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.1)/at91bootstrap-v4.0.1.tar.gz"
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

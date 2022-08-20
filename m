Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59185C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 13:40:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE2B382871;
	Sat, 20 Aug 2022 13:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE2B382871
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sDCAqZOjcxx5; Sat, 20 Aug 2022 13:40:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7084C82796;
	Sat, 20 Aug 2022 13:40:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7084C82796
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71F881BF57C
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 13:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58958416DC
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 13:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58958416DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cg_Hp--fMqcD for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 13:40:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28A72416E2
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 28A72416E2
 for <buildroot@buildroot.org>; Sat, 20 Aug 2022 13:40:19 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id D668E5C17BA;
 Sat, 20 Aug 2022 15:40:15 +0200 (CEST)
MIME-Version: 1.0
Date: Sat, 20 Aug 2022 15:40:15 +0200
From: Stefan Agner <stefan@agner.ch>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
In-Reply-To: <20220820121323.GI2167049@scaer>
References: <0e18605c9938776a707a4aab032be74a1a9afe8e.1660828116.git.stefan@agner.ch>
 <20220820121323.GI2167049@scaer>
Message-ID: <93037fb13a2d46a9ad5d4821b8cf76f4@agner.ch>
X-Sender: stefan@agner.ch
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=agner.ch; s=dkim; t=1661002815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DwUojeUBc1uGRnBSVncmYsHIwQlzQ0eMP3XUliy0m0=;
 b=QEcZ9CP4TEHu/h0VQdFUSBIcuG9RC00L9ryz/ekeMf2sRvlkTO92U0gVn0vlHw80goJhsX
 lWuRFpUgOiUFvg7//qn2qDf2Wi6YcmidxOySB7/r6IiyR5VHRiGLbpWwottbt6Fg5Ts6/S
 a/ZYB15NHehtaWwy7anEaoKbsuckIkc=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=agner.ch header.i=@agner.ch
 header.a=rsa-sha256 header.s=dkim header.b=QEcZ9CP4
Subject: Re: [Buildroot] [RFC PATCH] package/linux-firmware: Add more Intel
 WiFi 22000 series
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-08-20 14:13, Yann E. MORIN wrote:
> Stefan, All,
> 
> On 2022-08-18 15:18 +0200, Stefan Agner spake thusly:
>> Add more Intel WiFi 22000 series firmware files. Allow to select the
>> firmware version using shell globs.
>>
>> Signed-off-by: Stefan Agner <stefan@agner.ch>
>> ---
>> With the Intel WiFi 22000 series the amount of firmwares is just stagering. So
>> much so that it causes size issues in our case.
> 
> You know that you can write a post-build script to tweak the target/
> directory at the end of the build? That can be a workaround until a
> better solution is devised.

Thanks, good idea, I'll consider that!

> 
>> Intel firmwares seem to have an API version, which is the last digit before the
>> file ending .ucode. The Linux kernel sources have defines which API each
>> individual driver supports (e.g. Linux 5.15 22000 series kernel driver
>> supports ucode API 39 up to 66).
>>
>> This crude method uses just file glob matching to allow to select firmwares
>> which match the kernel in use. However, this approach has a problem: Some
>> API versions are missing. E.g. simply using "66" doesn't work since some
>> firmware are not available with the latest API supported (e.g.
>> iwlwifi-so-a0-gf-a0-64.ucode).
>>
>> Also if an older kernel is in use, some firmware files with an older maximum
>> API might just be missing, which leads to tar complaining about missing files.
>>
>> In this case, we can use 6[46], which happens to select the newest version of
>> all firmwares (it seems that firmwares which are available with API version 66
>> have only been released with version 63 before).
>>
>> However, this of course might be just a coincidence. Ideally Buildroot would
>> select the newest version available for a particular API version. Not sure if
>> this is easily doable.
>>
>> Thoughts?
> 
> First: on one hand, I like the simplicity of that patch; if we can't
> come up with better, I can see going with it.
> 
> But on the other hand, it is also very un-userfriendly. I don't see how
> we could _reasonably_ come up with a way to cherry-pick appropriate
> firmware files.
> 
> First, the linux package depends on linux-frimware, so linux-firmware
> can't depend on linux; we could still use a patch-dependency, so that
> linux gets at least extracted and patched before linux-firmware gets
> installed, but that is going to be tricky to maintain.
> 
> We could then grab IWL_22000_UCODE_API_MIN and IWL_22000_UCODE_API_MAX
> from drivers/net/wireless/intel/iwlwifi/cfg/22000.c
> 
> And then, we'd have to code some non-trivial magic that iterates over
> all iwlwifi-Qu{,Z}-*.ucode and check if their API part is in the range,
> and for a single "family" of firmwares, keep the highest one (how do we
> know that two firmware files are f the same family? Just because they
> only differ in API version?) That's a bit brittle...

To avoid the direct dependency I was thinking of using the
BR2_TOOLCHAIN_HEADERS_AT_LEAST Kconfigs, essentially maintain a list of
default max supported API per kernel version in Kconfig. Not sure if
that is a good idea.


> 
> [--SNIP--]
>> diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
>> index 64d096df14..2283cd7d5e 100644
>> --- a/package/linux-firmware/linux-firmware.mk
>> +++ b/package/linux-firmware/linux-firmware.mk
>> @@ -436,7 +436,20 @@ LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
>>  endif
>>
>>  ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000),y)
>> -LINUX_FIRMWARE_FILES += iwlwifi-QuZ-*.ucode iwlwifi-Qu-*.ucode
>> +LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB = $(call qstrip,$(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB))
>> +LINUX_FIRMWARE_FILES += \
>> +	iwlwifi-Qu-b0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-Qu-c0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-Qu-b0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-Qu-c0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-QuZ-a0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-QuZ-a0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-cc-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-so-a0-jf-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-so-a0-hr-b0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-so-a0-gf-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-ty-a0-gf-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode \
>> +	iwlwifi-so-a0-gf4-a0-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode
> 
> This list is not entirely alphabetically sorted.

This is on purpose, I've used the order in
drivers/net/wireless/intel/iwlwifi/cfg/22000.c.

> 
> Also, why do you extend the prefixes, from iwlwifi-QuZ- and iwlwifi-Qu-,
> to include extra c0, b0, a0 and so on? Why can we just have:
>     iwlwifi-Qu-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode
>     iwlwifi-QuZ-*-$(LINUX_FIRMWARE_IWLWIFI_22000_UCODE_API_GLOB).ucode
> 

Same reason: Align with kernel sources.

> Oh, and in at least linu 5.17, there are also references to
> iwlwifi-QuQnj-, iwlwifi-SoSnj- and a bunch of others. And
> specifically, there is also iwlwifi-cc-a0- which in Buildroot is
> installed with BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260 and not
> BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22000

There are more firmwares in the kernel sources than present in the
linux-firmware git repository. This is essentially the common
denominator of Linux 5.15 and the current version of linux-firmware. It
might deploy too many firmwares for an older kernel, but it is
guaranteed to work (list a non existing firmware causes the tar command
in the build step to complain).

> 
> So, maybe we could split the families further as an alternate solution?

I'd prefer to group them as they are grouped in the kernel sources.

Some kernel drivers have multiple API max versions (e.g. 6000.c), for
those it probably would make sense to have one config per (distinct) API
version max.

--
Stefan

> 
> Regards,
> Yann E. MORIN.
> 
>>  LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
>>  endif
>>
>> --
>> 2.37.2
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

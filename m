Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C45C4829E
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 17:22:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52CBB41E03;
	Thu, 15 Feb 2024 17:22:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5i9ONXyncJ31; Thu, 15 Feb 2024 17:22:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34E4641E56
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E4641E56;
	Thu, 15 Feb 2024 17:22:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 974BA1BF33D
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9118441E03
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 17:22:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lv8hACVaUY58 for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 17:22:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.117;
 helo=smtpcmd11117.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D73B641E56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D73B641E56
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D73B641E56
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 17:22:26 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id afRHrMCtLa6zwafRHrcrgB; Thu, 15 Feb 2024 18:22:24 +0100
Message-ID: <2191bba4-462a-4168-bbbc-91997f1e108d@benettiengineering.com>
Date: Thu, 15 Feb 2024 18:22:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: kilian.zinnecker@mail.de, buildroot@buildroot.org
References: <20240211120857.6622-1-kilian.zinnecker@mail.de>
 <20240211120857.6622-3-kilian.zinnecker@mail.de>
 <bf30e91f-1061-4aab-8670-c1ef9f7d895d@benettiengineering.com>
 <4868466.GXAFRqVoOG@laptop>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <4868466.GXAFRqVoOG@laptop>
X-CMAE-Envelope: MS4xfKW2V7uUduuK1VfyUjW3ah9+2J0wLh9YqZVno5g9j+oTnANFw0KQGvJYbi13sLKYdLyANc5IMYQa495HXDHGmX+hE3gKkA87ZamUt3vcGEZDKjZ82zfr
 JCcn5TNnJSViQe387/xDSRMHfstE4trrHu1thGR4pknSKEfgoAYZurNpy4ewd5/VYAdgSvkzI9FmJ9L5NjObndpSW01eOR/Juz0LW59CuQyGtd7d0kvkaTgV
 gwcbyvFicAEstoZmN0q3P1UAUleP8ViFlwAEsQhHDjpaTFVG53SfPfRJPV3y46CxsG/JFVt45aow8ICc53VBwzxb5HeJrZH4zwRXeCvkQAw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708017744; bh=WReD7sdKsyF8R5nVihomjDUqaSRn6SDWzSyYm7bjpao=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=iZ5uF7qkxTSMoAQb9kbGaApFmHGaMws3YlOpp9a/vLxD8f1R/z9uPQVvkKehYrxBn
 1t3jHSCvLwM89C8X7ONBsJanrQDbJoZ77YfWDfmH+JFkOA7bocYFk88wOeGJQuL8p+
 1SkalIV+KZDyvS2XLTebHQSlbAINcc9aW+IIF/7jdE4kyJ+0wgZy5HOcASXKLIudRW
 R+wrGpqP7CDoFdMw7qb44oqF1bhLK88YS3InR0lAdbcOLHxg2m7aSqkOoT7gjq8rHe
 t36Mn1GL43YXBccmicmuebtWlOAZ7MYDNJPFDN5kp8iwCK1kcODi/lOUiIoMD0yowV
 Eg/XNHu6vK+7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=iZ5uF7qk
Subject: Re: [Buildroot] [PATCH v3 2/2] configs/beaglev_ahead: new defconfig
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
Cc: Robert Nelson <robertcnelson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kilian,

On 15/02/24 00:03, kilian.zinnecker--- via buildroot wrote:
> Hello Giulio, all,
> 
> [--SNIP--]
> 
>>> a/board/beaglev-ahead/patches/uboot/0001-Overwrite-bootcmd-by-force.patch
>>> b/board/beaglev-ahead/patches/uboot/0001-Overwrite-bootcmd-by-force.patch
>>> new file mode 100644
>>> index 0000000000..bcf5b965ce
>>> --- /dev/null
>>> +++
>>> b/board/beaglev-ahead/patches/uboot/0001-Overwrite-bootcmd-by-force.patch
>>> @@ -0,0 +1,30 @@
>>> +From 81db2d155db74192e127ae1d98dd4ec415f53dd3 Mon Sep 17 00:00:00 2001
>>> +From: Kilian Zinnecker <kilian.zinnecker@mail.de>
>>> +Date: Mon, 21 Aug 2023 23:51:59 +0200
>>> +Subject: [PATCH] Overwrite bootcmd by force
>>> +
>>> +This patch is a dirty hack: Trying to overwrite the bootcmd via the
>>> +usual BOOT_COMMAND had no effect: Upon boot the bootcmd defaulted
>>> +to some preset value and could not be changed easily. Therefore a
>>> +hook is used to force the bootcmd to be overwritten.
>>
>> This is strange because if so also the bootcmd content of uEnv.txt below
>> should be skipped, or maybe there is a bug in this u-boot that evaluates
>> bootcmd too early without taking into account environment variables.
>> But I'm also noticing that you have your Environment variables in Fat,
>> but it depends how u-boot deals with environment variables. Usually
>> you have to specificy an offset in memory where environment variables
>> live.
>>
>> But I see in your "make uboot-menuconfig" that CONFIG_ENV_IS_IN_FAT is
>> not enabled, but only CONFIG_ENV_IS_IN_MMC is and you have to specify:
>> CONFIG_ENV_OFFSET
>> CONFIG_ENV_SIZE
>>
>> So if you want to go with vfat way you need to enable
>> CONFIG_ENV_IS_IN_FAT and specify:
>> CONFIG_ENV_FAT_INTERFACE
>> CONFIG_ENV_FAT_DEVICE_AND_PART
>> and most of all:
>> CONFIG_ENV_FAT_FILE=uEnv.txt
>> in uboot.fragment below
>>
>> I would go with this last way instead of adding such dirty hack, can you
>> work on that?
> 
> I tried, but so far I am not successful, maybe due to my lack of experience
> with uboot or maybe due to the customization of this particular uboot. I
> removed my custom-uboot patch and added the following configs to the
> uboot.fragment file, but it did not work yet:
> 
> # CONFIG_ENV_IS_IN_MMC is not set
> CONFIG_ENV_IS_IN_FAT=y
> CONFIG_ENV_FAT_INTERFACE="mmc"
> CONFIG_ENV_FAT_DEVICE_AND_PART="1:1"
> CONFIG_ENV_FAT_FILE="uEnv.txt"

First of all you have to give a try using ush(u-boot shell) to see if
you can really access fat partition and read uEnv.txt file.
Like:
=> fatload ...
to a memory address

If that works then you should also:
=> printenv
and check if the variables you want to override look like expected

> 
> I also tried to use mainline uboot v2024.01, which features the Lichee Pi 4A,
> which features the same SoC, but this didn't work either. I had a look at the
> custom uboot source and it defines a lot of configs inside this header file:
> 
> https://openbeagle.org/beaglev-ahead/beaglev-ahead-u-boot/-/blob/beaglev-v2020.01-1.1.2-ubuntu/include/configs/light-c910.h?ref_type=heads#L363-388

This is a usual way for the these variables. You can dig into it or 
override them as you're trying to do. But you need to make sure uEnv.txt
is really read from your sd-card.

For example it could be a problem with CONFIG_ENV_FAT_INTERFACE name or
CONFIG_ENV_FAT_DEVICE_AND_PART numbering.
If you try using ush everything will be clearer.

> 
> I tried to remove the hard-coded bootcmd from this header, but that also
> didn't work. I don't understand the inner workings of uboot well enough yet to
> get it properly working, so I appreciate all hints and any help here.

Above there is some explanation. Anyway do all the tests without the
uboot patch applied.

> However, I will already send a v4 of the patches, in which I try to address
> all the other issues. > Thanks again for reviewing and best regards,

You're welcome, the goal is to make this patch looks the best it could.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

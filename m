Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170E9C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:32:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6479A4049F;
	Tue, 26 Jul 2022 19:32:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6479A4049F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5A5sZ-_Qrrij; Tue, 26 Jul 2022 19:32:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3314C40442;
	Tue, 26 Jul 2022 19:32:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3314C40442
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD0051BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7071780C1E
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:32:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7071780C1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1YEYobb9nmFG for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:32:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E52480CE3
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5E52480CE3
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:32:13 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QJW8i4057032;
 Tue, 26 Jul 2022 14:32:08 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QJW8Ut084156
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jul 2022 14:32:08 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 14:32:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 14:32:08 -0500
Received: from [128.247.75.130] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QJW75d061754;
 Tue, 26 Jul 2022 14:32:07 -0500
Message-ID: <7c1e1a84-2a16-130c-a547-96c92f6d3fca@ti.com>
Date: Tue, 26 Jul 2022 14:32:07 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xuanhao Shi via buildroot
 <buildroot@buildroot.org>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-2-x-shi@ti.com> <20220726193735.735588e4@windsurf>
In-Reply-To: <20220726193735.735588e4@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658863928;
 bh=sblAa2qSPtkGo0aVR8Ubn5tnt6dwqEDJefz1crJSYIY=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=Te8mfNeJAIBGN0wiKf5eXZQM2CTl795uN48hGbSrbahK59wzhQ2aj9P9EtfbiF0PZ
 G5zzOKnTSAmuAzR3L4aUEn4muiBiupOl9+mX4LjWbBuzyo6zNXlJufLw1KR2D807UY
 TkFUR/kLCayCm55OMtBI7UYBWvQXWC/egsHz4pqs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=Te8mfNeJ
Subject: Re: [Buildroot] [PATCH 1/4] package/arm-gnu-toolchain: add version
 selection
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
From: Xuanhao Shi via buildroot <buildroot@buildroot.org>
Reply-To: Xuanhao Shi <x-shi@ti.com>
Cc: Suniel Mahesh <sunil@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/26/22 12:37, Thomas Petazzoni wrote:

Hello, thank you very much for your input!

>> to bugs in the newest version.
> 
> Could you give some details on the "bugs" ?
> 

I have experienced bugs very similar to this while building with version 
11 for k3-image-gen:
https://bugs.launchpad.net/gcc-arm-embedded/+bug/1969997
I think the problem is that when the pre-packaged GCC was built, it 
could be targeting a newer x86_64 architecture than the processor being 
used, but I am not that sure.
They are confirming that they will fix this in the next release:
https://bugs.linaro.org/show_bug.cgi?id=5825#c19
In the meantime, since this bug did not appear on version 10, I decided 
to add the option to use version 10 at the moment.

>> diff --git a/package/arm-gnu-toolchain/Config.in.host b/package/arm-gnu-toolchain/Config.in.host
>> new file mode 100644
>> index 0000000000..25d0af1d04
>> --- /dev/null
>> +++ b/package/arm-gnu-toolchain/Config.in.host
>> @@ -0,0 +1,38 @@
>> +config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN
>> +	bool "host arm-gnu-toolchain"
>> +	help
>> +	  Separate ARM32 cross-compilation toolchain
>> +	  for some AArch64 platforms.
>> +
>> +menu "host arm-gnu-toolchain version"
>> +	depends on BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN
> 
> The menu is not needed.
> 
> Use:
> 
> if BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN
> 
> ...
> 
> endif
> 
> to enclose the options of this package.
> 
>> +choice
>> +	bool "host arm-gnu-toolchain version"
> 
> Just "version"
> 
>> +config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_DEFAULT
>> +	bool "Version 11.2-2022.02"
>> +	help
>> +	  Use version 11.2.
>> +
>> +config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_CUSTOM
>> +	bool "Custom archived sources"
>> +	help
>> +	  Specify custom archive for the toolchain.
> 
> Seeing what you end up needing in your defconfig, I think I would
> prefer explicit options for 11.x and 10.x, rather than all this
> "custom" mess.
> 
> So just:
> 
> config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_VERSION_11_X
> 	...
> config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_VERSION_10_X
> 	...
> 
> Thanks!
> 
> Thomas

Ok. I'll rework this patch accordingly.

Xuanhao
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

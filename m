Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAED1C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 10:41:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85E3E6110D;
	Thu,  6 Jun 2024 10:41:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9P26bodnBfqs; Thu,  6 Jun 2024 10:41:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76EED608B3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76EED608B3;
	Thu,  6 Jun 2024 10:41:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4DBBC1BF5AD
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3A1D440896
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 10:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmU3hQk_3NAM for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 10:40:59 +0000 (UTC)
X-Greylist: delayed 767 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 06 Jun 2024 10:40:58 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C37EB404D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C37EB404D0
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=198.47.19.142;
 helo=fllv0016.ext.ti.com; envelope-from=p-bhagat@ti.com; receiver=<UNKNOWN> 
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C37EB404D0
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 10:40:58 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 456ASAT8062920;
 Thu, 6 Jun 2024 05:28:10 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 456ASA8G026863
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 Jun 2024 05:28:10 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jun 2024 05:28:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jun 2024 05:28:10 -0500
Received: from [172.24.227.38] (ula0502350.dhcp.ti.com [172.24.227.38])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 456AS7sS109778;
 Thu, 6 Jun 2024 05:28:08 -0500
Message-ID: <0b898432-d7b4-49a5-92e2-e7ec0d733f0e@ti.com>
Date: Thu, 6 Jun 2024 15:58:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bryan Brattlof <bb@ti.com>
References: <20240604061556.3167647-1-p-bhagat@ti.com>
 <20240605175435.pbfqas47c7wpvj3r@bryanbrattlof.com>
Content-Language: en-US
In-Reply-To: <20240605175435.pbfqas47c7wpvj3r@bryanbrattlof.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1717669690;
 bh=z6dyitP6iLOFNc4KT37poAkl1Weg3msoLpYeG549Px0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=w3Dz2YOypXkHk42lajRP9INyKs+ZHl9Vvs6p+ex1aqyWJMQIbbqS/vwrMZ5SnwUix
 rFe95UyLDKkVEc6dju3pXWdcS6mKWnMXRTAAWtjgSnr/XHyYgRLNUIZsLgpfbY/saS
 IylpRoolvQYTKfvZ0nIWz1HvUrFNX3pa+BJdjIkw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=ti.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=w3Dz2YOy
Subject: Re: [Buildroot] [PATCH 1/1] boot/ti-k3-boot-firmware: Add config
 option to specify version
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
From: Paresh Bhagat via buildroot <buildroot@buildroot.org>
Reply-To: Paresh Bhagat <p-bhagat@ti.com>
Cc: Xuanhao Shi <X15000177@gmail.com>, Gyan Gupta <g-gupta@ti.com>,
 Chirag Shilwant <c-shilwant@ti.com>, Syed Mohammed Khasim <khasim@ti.com>,
 buildroot@buildroot.org, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bryan,

Thanks for the review. I will send v2 with your suggested changes.

Regards,

Paresh

On 05/06/24 23:24, Bryan Brattlof wrote:
> Oops! Just noticed some white-space issues while cleaning up.
>
> On June  4, 2024 thus sayeth Paresh Bhagat via buildroot:
>> Previously the version of ti-k3-boot-firmware (TI_K3_BOOT_FIRMWARE_VERSION) was
>> fixed in mk file. Introduce a new config option
>> BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION so that user can change the version
>> for ti-k3-boot-firmware using menuconfig.
>>
>> This provides greater flexibilty for users to select different versions of
>> ti-k3-boot-firmware without modfying the build script directly.
>>
>> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
>> ---
>>   boot/ti-k3-boot-firmware/Config.in            | 30 +++++++++++++++++++
>>   .../ti-k3-boot-firmware.mk                    |  2 +-
>>   2 files changed, 31 insertions(+), 1 deletion(-)
>>
>> diff --git a/boot/ti-k3-boot-firmware/Config.in b/boot/ti-k3-boot-firmware/Config.in
>> index d80bb4bdb3..adc201c468 100644
>> --- a/boot/ti-k3-boot-firmware/Config.in
>> +++ b/boot/ti-k3-boot-firmware/Config.in
>> @@ -5,3 +5,33 @@ config BR2_TARGET_TI_K3_BOOT_FIRMWARE
>>   	  This package downloads and installs the TI-specific ti-sysfw
>>   	  and ti-dm firmware needed to boot TI K3 platforms (which
>>   	  include AM62x, AM64x, AM65x and more).
>> +
>> +if BR2_TARGET_TI_K3_BOOT_FIRMWARE
>> +choice
>> +	prompt "ti-k3-boot-firmware version"
>> +	default BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
>> +	help
>> +		Select the version of Ti k3 boot firmware you want to use
> Do you mind replacing the indentation with a <Tab> + 2 <Space> here? to
> align with the help label a little better.
>
>> +
>> +config BR2_TARGET_TI_K3_BOOT_FIRMWARE_LATEST_VERSION
>> +	bool "09.02.00.009"
>> +
>> +config BR2_TARGET_TI_K3_BOOT_FIRMWARE_CUSTOM_VERSION
>> +	bool "Custom version"
>> +	help
>> +      This option allows to use a specific official version from
>> +      git.ti.org.
>> +
> For now ;) but same here. <Tab> + 2 <Space>
>
> ~Bryan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

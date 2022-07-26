Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE67C00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:29:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31A4C408F5;
	Tue, 26 Jul 2022 21:29:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 31A4C408F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOF3dphqEMv6; Tue, 26 Jul 2022 21:29:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC7EE408F1;
	Tue, 26 Jul 2022 21:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC7EE408F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 196551BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E6FDF40167
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:29:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6FDF40167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NJf9l5w9ZgoC for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:29:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E916340145
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E916340145
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:29:09 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QLT4fP086681;
 Tue, 26 Jul 2022 16:29:04 -0500
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QLT4FG014261
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jul 2022 16:29:04 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 16:29:04 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 16:29:04 -0500
Received: from [128.247.75.130] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QLT4R4113965;
 Tue, 26 Jul 2022 16:29:04 -0500
Message-ID: <c6c9a0ed-928c-e08a-1eb1-240ceada4019@ti.com>
Date: Tue, 26 Jul 2022 16:29:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-2-x-shi@ti.com> <20220726193735.735588e4@windsurf>
 <7c1e1a84-2a16-130c-a547-96c92f6d3fca@ti.com>
 <20220726220755.238d4f48@windsurf>
In-Reply-To: <20220726220755.238d4f48@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658870944;
 bh=LnM8N8AaqAAo75JDgjNsEkYRVlgrJbMzVBrYlDm4xD0=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=SufX7br85cWC7FwXwAnB8rh+N041hm6tm2HGVqZrb3odXU8ufw3ldwwkXoY02MGNl
 K23ZyBjyl21qUJ8JSpjUrvNphEGN2gA/yW5IOWh5fBWO+p84y21uPZSQSYLZPjnqp/
 jwRrwFU/T8nWZhUZyOdCL7wsTnpRqJaPU4Ec8Um8=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=SufX7br8
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>,
 Xuanhao Shi via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/26/22 15:07, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 26 Jul 2022 14:32:07 -0500
> Xuanhao Shi <x-shi@ti.com> wrote:
> 
>> I have experienced bugs very similar to this while building with version
>> 11 for k3-image-gen:
>> https://bugs.launchpad.net/gcc-arm-embedded/+bug/1969997
>> I think the problem is that when the pre-packaged GCC was built, it
>> could be targeting a newer x86_64 architecture than the processor being
>> used, but I am not that sure.
>> They are confirming that they will fix this in the next release:
>> https://bugs.linaro.org/show_bug.cgi?id=5825#c19
>> In the meantime, since this bug did not appear on version 10, I decided
>> to add the option to use version 10 at the moment.
> 
> Aah, thanks, that's a very good explanation. Then based on this, I
> think we should not add a version choice, and simply revert back to the
> 10.x version in package/arm-gnu-toolchain.
> 
> Thanks!
> 
> Thomas

Ok. I'll do that and send it with the reworked patch afterward then.

Thanks!

Xuanhao
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

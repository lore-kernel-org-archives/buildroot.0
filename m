Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E13CC00144
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 21:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7BAF408F6;
	Tue, 26 Jul 2022 21:32:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7BAF408F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IRM3vmm7OepP; Tue, 26 Jul 2022 21:32:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F742408F5;
	Tue, 26 Jul 2022 21:32:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F742408F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DF9B1BF59F
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:31:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6940840145
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 21:31:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6940840145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XL1w6F-YK8pr for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 21:31:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6E324013F
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A6E324013F
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 21:31:58 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26QLVrJW087323;
 Tue, 26 Jul 2022 16:31:53 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26QLVrSi016334
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 26 Jul 2022 16:31:53 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Jul 2022 16:31:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Jul 2022 16:31:53 -0500
Received: from [128.247.75.130] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26QLVrcL119216;
 Tue, 26 Jul 2022 16:31:53 -0500
Message-ID: <16705dba-bf96-5627-0c45-603ce5d7965e@ti.com>
Date: Tue, 26 Jul 2022 16:31:53 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220726165041.17584-1-x-shi@ti.com>
 <20220726165041.17584-3-x-shi@ti.com> <20220726205529.0e85e2de@windsurf>
 <8d1611db-29ae-e53b-f900-f57c037cfd01@ti.com>
 <20220726230742.0e538187@windsurf>
In-Reply-To: <20220726230742.0e538187@windsurf>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1658871113;
 bh=89XOuQgONfXw7pr1iaqdPj93jmlv2pwP6etYFz/rr3s=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=S1o6vJthhK6Gg7fgRwmS7Q82vdn/xeGFWVkkNF59YsdxbskUY4rs49fXiKVJnrIRy
 WLhIyxwiUhjo4mjFKLzhAVk+n7nnlpHQaiRVZhFdsa8+GjRVTDm6vK8w2zfqdIXFFS
 vo+eMpyXIz5BB4bRptoYOtZYz2C7dH0plPtXSrPc=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=S1o6vJth
Subject: Re: [Buildroot] [PATCH 2/4] package/k3-image-gen: new package
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 7/26/22 16:07, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 26 Jul 2022 15:56:31 -0500
> Xuanhao Shi <x-shi@ti.com> wrote:
> 
>>> Could you explain what you are trying to do? Is it because you need to
>>> build two different U-Boot configurations?
>>
>> Yes, the R5 core requires a different U-Boot build than the A53 core. I
>> mentioned a bit about it above.
>>
>> I understood that this patch currently does not achieve that in a proper
>> way. Would you mind recommending a proper way to do this? Should I find
>> a way to patch U-Boot directly so it has an option for a separate build?
>>
>> Since you mentioned earlier that k3-image-gen should be a package in
>> boot/, should the patch modify boot/uboot/ for the separate U-Boot build
>> instead?
> 
> One option that I see, which isn't very nice, is to do like Barebox in
> boot/barebox/, where boot/barebox/barebox.mk contains most of the code,
> but in fact two barebox packages exist, boot/barebox/barebox/ and
> boot/barebox/barebox-aux/.
> 
> Another option, much simpler, is to do something that is more TI
> specific, such as a ti-am64x-r5-loader package that would download your
> U-Boot for R5 and build it, but without relying on the boot/uboot/
> package. Exactly like if you had a custom bootloader/firmware for the
> R5. I think this is the best option.
> 
> What do you think?
> 
> Thomas

Thanks a lot for the input.

I think we will take the second option to just add a separate TI U-Boot
package to build the R5 in this case.

Should this package also be in boot/ just like the k3-image-gen package?

Thanks!

Xuanhao
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

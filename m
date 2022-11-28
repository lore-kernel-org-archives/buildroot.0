Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D40C43217
	for <buildroot@archiver.kernel.org>; Mon, 28 Nov 2022 13:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9052D408EB;
	Mon, 28 Nov 2022 13:57:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9052D408EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q4w2CHbC6g74; Mon, 28 Nov 2022 13:57:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64838408E0;
	Mon, 28 Nov 2022 13:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64838408E0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 347D71BF38D
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 13:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19C54408E0
 for <buildroot@lists.busybox.net>; Mon, 28 Nov 2022 13:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19C54408E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCWj8MkRcL6l for <buildroot@lists.busybox.net>;
 Mon, 28 Nov 2022 13:57:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07796408DE
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id 07796408DE
 for <buildroot@buildroot.org>; Mon, 28 Nov 2022 13:57:20 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.87.80])
 by Aruba Outgoing Smtp  with ESMTPSA
 id zedJoVPqlb7IjzedJo4SKb; Mon, 28 Nov 2022 14:57:18 +0100
Message-ID: <f1c8711c-7dbb-e41a-e3cb-ac0208f34d00@benettiengineering.com>
Date: Mon, 28 Nov 2022 14:57:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Content-Language: en-US
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20221127132855.510943-1-giulio.benetti@benettiengineering.com>
 <20221128105535.5a2c0798@booty>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221128105535.5a2c0798@booty>
X-CMAE-Envelope: MS4xfMd++e2UZtw/wZ69NuJ617d01NPkoDaf+o76vIWq+CEvJwvMXdv63VIIltUH/h5fVAooPSkMWxQDlWpYNG76IWofxRLDhuboV2WcTF5r/JY2HhSqOagS
 lzo/Rub2rsT2wy/xC4YaDmTODmGr4DtPjb3YYTWYvwEoqSL9wLzy0aLwRyYBz/615rsHnBKwaSunfrTI9PjWyTOJa/JS70MRZ1dFBVxAPnjfQLnyyEDM4kBs
 uI4K07Ir56mBBykvAtgTpgJHeyRthjmx/niO2ha1vEk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1669643838; bh=5aK3tyQ148Y3JLMFnlhypHVj1mG0/5E5oAGK2f5oMGM=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=Nrf/qbUiywB6339r6VkA5HxYvXLmU/BZTqmXLhiDYXXqGjwjDNJvEOwRcW8KbUcB0
 kLUI2uXMYMZeB7ZohF5aWsHiXccanUKr+9blcs//Pxr7ASO4HWN7hYRFuwt4F4pg4L
 qAInCH57eRrsSH2lvWCyBzJpSRsWtm7Wc94hPit174fquvqCOg7ouKHgGkbmVR9X55
 yAHY0jFYcv8L1xzc5AupUybxZMFpyJNTLLC8bXf1Gv3wJOHHO8JaHJlHkjd96ZH97H
 HD2jbegbeQqAvH+b2FZdyGo+6w6D1vu4ThTiqahEBKTIOVkiwAZTzRl8f7Y3iKMkvy
 +lXUZ1euABSNg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Nrf/qbUi
Subject: Re: [Buildroot] [PATCH] package/rtl8188eu: fix build failure on
 PowerPC
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

Hi Luca,

On 28/11/22 10:55, Luca Ceresoli wrote:
> Hi Giulio,
> 
> On Sun, 27 Nov 2022 14:28:55 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Add local patch(pending upstream[0]) to fix build failure with PowerPC due
>> to a package re-defition of get_ra() that is only defined in Linux PowerPC
>> implementation.
>>
>> [0]: https://github.com/lwfinger/rtl8188eu/pull/432
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/8bcb4d0adabc141ff8144f9e22bd549e3cd8858a/
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   ...uild-failure-on-PowerPc-architecture.patch | 106 ++++++++++++++++++
>>   1 file changed, 106 insertions(+)
>>   create mode 100644 package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
>>
>> diff --git a/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch b/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
>> new file mode 100644
>> index 0000000000..b16a312c7e
>> --- /dev/null
>> +++ b/package/rtl8188eu/0001-Fix-build-failure-on-PowerPc-architecture.patch
>> @@ -0,0 +1,106 @@
>> +From 2a91a721d634a2eca131628b5c9c028af20037af Mon Sep 17 00:00:00 2001
>> +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> +Date: Sun, 27 Nov 2022 14:20:43 +0100
>> +Subject: [PATCH] Fix build failure on PowerPc architecture
>> +
>> +In PowerPc Linux only get_ra() exists[0] and conflicts with local get_ra()
>> +that has a completely different purpose. So let's rename local get_ra()
>> +to wifi_get_ra() to make it different from Linux's get_ra().
>> +
>> +[0]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/powerpc/include/asm
>> +
>> +Upstream: https://github.com/lwfinger/rtl8188eu/pull/432
>> +Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Thank you!
> 
> I have posted some change request to the commit message on your patch
> for upstream, but the patch content itself looks good, so I guess for
> the Buildroot needs this is enough:

Unfortunately I've forgotten some code replacement on get_ra() that has
been pointed upstream. The maintainer answered quickly so at this point
I'd wait some day, if the patch is then merged I'll send a patch to
bump the version, otherwise a send a V2 of this patch with the local
patch.

Thank you!
Kind regards
-- 
Giulio Benetti
Benetti Engineering sas

> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

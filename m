Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD07C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 23:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A32380F3D;
	Wed, 19 Jan 2022 23:56:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vy4rC_GFOAyF; Wed, 19 Jan 2022 23:56:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C06980CD0;
	Wed, 19 Jan 2022 23:56:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9A31BF2B8
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 23:56:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16A1480CD0
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 23:56:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tK6OKeW5JtXm for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 23:56:47 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd15176.aruba.it (smtpcmd15176.aruba.it [62.149.156.176])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A3B380C42
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 23:56:47 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.178.108])
 by Aruba Outgoing Smtp  with ESMTPSA
 id AKomnj6jSXfntAKonnTxgJ; Thu, 20 Jan 2022 00:56:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1642636605; bh=25DMKNoICW0WXt9WLvyqAu0SWmMViZKTwFCrJwnPFU4=;
 h=Subject:To:From:Date:MIME-Version:Content-Type;
 b=D9wSeGR1x79jZIS8V9aD/ofNtIUJHst17we2cSGr+FCejOa6EetKV7wu7tCbZ8EI7
 HUD4P/7B5WoqeGQKb0uynir8P4GoEGxZlHOiT1CwVn3RlEkwyqDPba9WVOUklmoG7i
 V0tY0mzEQpGnyEHwX7qKdF1MMvwhA0xTmO8rA7fCQwEHk/08WwlfXnyBKX2jzfPA1c
 ORYeURdkpd+SHENgw8mKEzdZI1YabQokfLPcdkpVnSGtywCQ3iMHy/4GB/cKNcK2sL
 sH+5uXfR+zekFbDgPWe5z/aN4Z4ak8oIXcrOI0+uCniziSzNcCdvcFz+6nZGMPuHY2
 nonaogxpEmK5w==
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20210128125256.1419587-1-maxime.chevallier@bootlin.com>
 <20220119222332.66485-1-giulio.benetti@benettiengineering.com>
 <20220119233944.7ba2d09f@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <58f6a9d8-70e2-308e-d756-e1ec0b18d042@benettiengineering.com>
Date: Thu, 20 Jan 2022 00:56:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220119233944.7ba2d09f@windsurf>
Content-Language: en-US
X-CMAE-Envelope: MS4xfFfkT2RxUmfHdbBGnDzI5qly0CFTavVBQdbLBKAE8I7K6NZ9uUDduQMd9EsxkcnIX5tFutaNwZAEadXidYJptwr85VH8WKMo2NcEZXQos3gQiBsuOCOP
 LL8ExABaoHpvzmUKJ67t/EkeybjdMwubiMfrcVl2FA/iitMnrmp3YeAV4j3cjycvzL1WJOJzkavjWS8DlGl3vG947yYeKV+1W2a/yvUPIr9MRanoZ9bK8iVv
 gJ6805Zr8g/Kf5LYnMAjKTGGCwp8cuQpLocv+nDDzlJLuPUiIKPj8gGgC0Dr6mkX4TxM2benYLbOrsn7JYaG8k73B6ZdaLqwosZOQTAm8u8=
Subject: Re: [Buildroot] [PATCH v3] package/refpolicy: Add option to disable
 "dontaudit" rules
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
Cc: Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 19/01/22 23:39, Thomas Petazzoni wrote:
> On Wed, 19 Jan 2022 23:23:32 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> +config BR2_REFPOLICY_DISABLE_DONTAUDIT
>> +	bool "Disable dontaudit"
> 
> I am still extremely confused by the name of option, with its double
> negative.
> 
> When enabled, this option will disable something that doesn't audit.
> Meh.
> 
> Is it possible to find a better name / description that doesn't make
> one's brain segfault when trying to understand what it does ?
> 
> The make target that gets triggered is "enableaudit". Would it make
> sense to call this option BR2_PACKAGE_REFPOLICY_ENABLE_AUDIT ?

I didn't check well the make argument..... Sorry. I agree with Thomas on 
changing the option variable to BR2_PACKAGE_REFPOLICY_ENABLE_AUDIT and 
name to:
"Enable audit"

And I would change the help section from:
```
Builds the refpolicy with the "dontaudit" rules disabled.
This will trigger unseen, and ...
```
to:
```
Remove all dontaudit rules from policy.conf.
This will trigger unseen, and ...
```
as reported in refpolicy README:
https://github.com/SELinuxProject/refpolicy/blob/master/README#L78

> It would be nice to get the feedback from Antoine and/or Maxime on this.

Following this since I'm not used to this package.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

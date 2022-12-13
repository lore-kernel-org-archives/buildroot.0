Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0CDC4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 21:14:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C88980B94;
	Tue, 13 Dec 2022 21:14:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C88980B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OaX0fgcliMmw; Tue, 13 Dec 2022 21:14:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FA8D81EE5;
	Tue, 13 Dec 2022 21:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FA8D81EE5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1BEA11BF4E4
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 024AD417C5
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 21:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 024AD417C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-0PbVlvyefW for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 21:14:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7E0F417C1
Received: from smtpcmd04131.aruba.it (smtpcmd04131.aruba.it [62.149.158.131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7E0F417C1
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 21:14:08 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5CbGpak3YOQIK5CbGp2mmv; Tue, 13 Dec 2022 22:14:06 +0100
Message-ID: <7963427e-93ed-f5a5-84f8-1ed12a4d7bd5@benettiengineering.com>
Date: Tue, 13 Dec 2022 22:14:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@mind.be>
References: <ec8d8bd9-5185-b9fb-f6cb-6aec971a5de1@mind.be>
 <0D32AFEE-0712-48AE-A855-3FFC249371DD@benettiengineering.com>
 <20221211212957.27aa9e19@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221211212957.27aa9e19@windsurf>
X-CMAE-Envelope: MS4xfNWrkBX/MjtZIpc4oJfJCroDizLjdNI5C26koSQ7ytCgypnmbqXa5kT3j93/Pl92KAraPT8RCJ4dOSkskbxkYRUHYTVNLWYot7C2+d1Lwe2IroHe2e+z
 hwrpZbbzp/TXz79WVfZrEgd6S3tuWns7TGYFyCIyPu3MWCAGfZmbuSk76yiYC8bhfSLzyHKXtlG795XZ+evK6Oynd9jV44rgr+HAmHdX/fbAK8P1i/p9po3d
 wwEFGbmragpuFN0sIEIvdcrE3PSSqTCqXBAHEfcdWYAne0Cen4yi3nDVRkLLIbJt7ONGNzV9Q1rxnTijAMWQy/MZrxhXU3rSh2jH3M+b0Q4=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1670966046; bh=KX0rApiUuyUD7piVoeR3sKHh0pO441cA7o2Bc+J3n6c=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=WDP6EP7k0stbSDiRUpyZwox+kLCWvT3Y+p4L9bCuA6hp57TpTQapBMdzY6H54b7Fc
 ASp/9JltCJVRZp0XnFU8pu9ye442DA0dguYIAuvpMjWhF82BbJU4PiP0WYBFIov/xp
 N3POyE3wGStqJljPzfG3sCOky4J1mMJssuZwjbiwy+LDhLgDKbSVY6f+JGcA9lCrYO
 Zrx9nmhDE/a7uf29DwswEbM+NYkBaQEtLmyIyUX4rpZMzCT9W8XCf+iHZuk9HUjUkL
 6SvvOiPbyBP2boRagUGYECrZ1AKGqK0Boeq+1lApZxLxAEy07HMqUYFQ8Yv5Oa4M+C
 pwXq3tDK9Gw3w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WDP6EP7k
Subject: Re: [Buildroot] [PATCH 2/2] package/rtl8192eu: fix build failure on
 Big Endian architectures
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas, Arnout, All,

On 11/12/22 21:29, Thomas Petazzoni via buildroot wrote:
> On Tue, 29 Nov 2022 23:25:29 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>> Clearly, all of this is rubbish in Buildroot context. So what we should do is to set
>>>
>>> RTL8192EU_MODULE_MAKE_OPTS = ... CONFIG_PLATFORM_I386_PC=n
>>>
>>> At that point, we can set all the appropriate config options we like, which would be the -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT in USER_EXTRA_CFLAGS.
>>
>> Yes, this is another approach, but there is only a patch with my proposed solution applied [1]
>> so maybe for consistency we could keep it the same, what about it?
> 
> Well, Arnout has a point that having CONFIG_PLATFORM_I386_PC=y is not
> really good. 


Yes, I've rechecked the Makefile and Arnout had a very good idea that
gives us the total control and I've sent a V2 patch for this:
https://patchwork.ozlabs.org/project/buildroot/patch/20221213203236.171656-1-giulio.benetti@benettiengineering.com/

> So perhaps 354f9387f33b5fab023cb98e52d84d58624f0ecf also
> needs to be changed like Arnout suggested?

Yes, I've sent one for this too:
https://patchwork.ozlabs.org/project/buildroot/patch/20221213211313.735422-1-giulio.benetti@benettiengineering.com/

If new bugs like this arise I will use that approach now on.

Thank you both!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1609C3DA7A
	for <buildroot@archiver.kernel.org>; Mon,  2 Jan 2023 23:05:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56DDE408AE;
	Mon,  2 Jan 2023 23:05:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56DDE408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78tVm1KsDMUQ; Mon,  2 Jan 2023 23:05:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A4F1404AE;
	Mon,  2 Jan 2023 23:05:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A4F1404AE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B52B1BF397
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 23:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76DCB404AE
 for <buildroot@lists.busybox.net>; Mon,  2 Jan 2023 23:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76DCB404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n0CDWNruCAUd for <buildroot@lists.busybox.net>;
 Mon,  2 Jan 2023 23:05:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ECA740412
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ECA740412
 for <buildroot@buildroot.org>; Mon,  2 Jan 2023 23:05:42 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id CTsBpR5mb8R19CTsBpMjtt; Tue, 03 Jan 2023 00:05:40 +0100
Message-ID: <d381df43-3af6-52ec-473a-666a8cff8e01@benettiengineering.com>
Date: Tue, 3 Jan 2023 00:05:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: kris@embeddedTS.com, buildroot@buildroot.org
References: <20221228205323.71420-1-giulio.benetti@benettiengineering.com>
 <1672687476.3896.3.camel@embeddedTS.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <1672687476.3896.3.camel@embeddedTS.com>
X-CMAE-Envelope: MS4xfIbSdZlXZwk28MZjo189RaOANXsDl1+/AYCLQl0jFwO4dNiCcIiZ1sbe2p1BLwE0IBfKsCsEq2+KNreQXRiKVvaiaHhVTIlx6ncc+rHlUduiM95cEuQ6
 7PTYSpvXjF2uVF+fSZuyHztNxkt4TknGsc7bM6zWZHU6tujR0ZE2nZ44C7pM6iBLAFmv+ukw8BvvuX5m2d4uHcIZrnkx0yrOKtrMZu63X631XBYJ0DEvQtz+
 JUDkBDqRRMBiX9hVw6w3IyU5BnEtNQLQxKHpB88SRyDffhNMHTtHEuTXDECXbOdj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1672700740; bh=9qR8Gj5Q50I0pXDTgD9i+LaM41jgO5UH4x83kl4Nrlc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=JGjIUWiBB784mAaoPs6TF4R78GWeQ9IHBecQE8OuDYeLclKPCPcPDjAULppwWsMiw
 c9408dIPy/PTw2mxdy0wK8KIODRefi2cT8dFilgjuFx/DO9voQd5t5KtKQbh886B8q
 iNXqqpgZIagMz3DjyxAk+toYV3xlMD/Xuti39nSbuauESvQT/xSfCHOKc+43I+f2Po
 Q3u7cHfIr4l8pYcnMAWxv4I0hQZMRG5UMKRytROdK8mZkM8TMIPwazPIfP5Q8dA0pJ
 sOaCl8Ycb0h7AcPXjVq8zgseslPhpF6Ro65FYAebePDX6yZ5V69CVV6dIFSFufw4q0
 AFB6JqG9kzteg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=JGjIUWiB
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure up
 to Linux 6.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Kris, Thomas, All,

On 02/01/23 20:24, Kris Bahnsen wrote:
> On Wed, 2022-12-28 at 21:53 +0100, Giulio Benetti wrote:
>> Add patches pending upstream[0] to handle various data types and api
>> changes up to Linux 6.1.
>>
>> [0]: https://github.com/embeddedTS/wilc3000-external-module/pull/2
>>
>> Fixes:
>> http://autobuild.buildroot.net/results/6aa7475a21a6060e9fce3552f73e6e7100a8b2aa
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   ...missing-prandom_u32-with-Linux-6.1.0.patch |  34 +++
>>   ...fix-build-failure-on-remove-callback.patch |  44 ++++
>>   ...uild-failure-with-Linux-5.19-and-6.1.patch |  98 ++++++++
>>   ...on_parameters-Linux-6.1-build-failur.patch | 216 ++++++++++++++++++
>>   4 files changed, 392 insertions(+)
>>   create mode 100644 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
>>   create mode 100644 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
>>   create mode 100644 package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
>>   create mode 100644 package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
>>
> 
> Giulio, all,
> 
> I figure this is the most appropriate place to have a discussion on
> this topic as these patches were also pushed to our github repo:
> https://github.com/embeddedTS/wilc3000-external-module/
> 
> I want to note that we are not intending on doing any maintenance
> or patch work on this driver, except to keep this driver functional
> on our platforms. 

Oh, I thought the goal was to keep the module successfully building
through all Linux versions like we usually have in Buildroot for other
packages. For example all the Wi-Fi modules(i.e. rtlxxx packages) and
gpu(mali-driver, sunxi-mali-utgard, kernel-module-imx-gpu-viv etc.) or 
other out of tree drivers.

> It is maintained as a buildable external module
> of this folder tree:
> https://github.com/linux4sam/linux-at91/tree/master/drivers/net/wireless/microchip

The problem is that with that we can't build for older Linux versions
and this is one of our goals. Someone can be interested in having it
running on Linux 4.x or earlier.

> We did this because during the Microchip takeover they abandoned
> their maintained external tree as well as halted any plans to
> bring WILC3000 support to the kernel upstream. Our fork gives us
> easy access to building the modules without having to keep pulling
> changes in to all of our kernels.
> 
> I'm not sure the best way to go about handling these patches as
> Microchip is currently only maintaining support for 5.15 it
> appears. I also don't want to pollute our external module tree
> with fixes that arn't in the upstream we're pulling in.
> 
> Giulio, would you be willing to attempt pushing these changes
> to the Microchip repo?

Yes, this is the idea once they create the 6.1 branch, at least I
expect they will do it soon since it's the new Linux LTS version.
Then for sure I will open a PR without all the #ifdef's I've created
in the PR I've opened to your Repo. Of course those patches will be
usable only for Linux 6.1 and that's it.

> Does it make more sense to just leave these as patches to the
> driver in Buildroot?

Not very much, because they must be reworked over the time and they
will continue to increase along with Linux versions. For sure we hope
WILC1000/3000 will be totally upstreamed at a certain point. But anyway
we will need your repository(or a fork of it) to keep all the #ifdef's
for LINUX_VERSION to support it on old Linux versions.

> Would it make sense to instead apply some limits to the package
> or external module to only build on already compatible kernel
> versions?

I'd like to support the driver for any possible Linux version like we
do for the other drivers in Buildroot.

I understand that there is an effort on your side to test the changes
you pull, but this will keep your repository aligned with the latest
Linux versions and it will be build-tested a lot with our autobuilders.

This is my 2 cents. I leave the last answers to the maintainers, Thomas
is one of them.

Best regards!
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

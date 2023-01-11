Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BC1C5479D
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 12:02:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45026417F7;
	Wed, 11 Jan 2023 12:02:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 45026417F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xPxTsPtwZtoK; Wed, 11 Jan 2023 12:02:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD69241831;
	Wed, 11 Jan 2023 12:02:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD69241831
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6C41BF215
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 12:02:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE02A81FC9
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 12:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE02A81FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RrxiVuhRgazZ for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 12:02:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C8A581FAE
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C8A581FAE
 for <buildroot@buildroot.org>; Wed, 11 Jan 2023 12:02:14 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FZo4pbHLI2HZAFZo4pdDYE; Wed, 11 Jan 2023 13:02:13 +0100
Message-ID: <4b19876a-c62c-e915-b8a9-da5226cafe5f@benettiengineering.com>
Date: Wed, 11 Jan 2023 13:02:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Content-Language: en-US
To: kris@embeddedTS.com, buildroot@buildroot.org
References: <20221228205323.71420-1-giulio.benetti@benettiengineering.com>
 <1672687476.3896.3.camel@embeddedTS.com>
 <d381df43-3af6-52ec-473a-666a8cff8e01@benettiengineering.com>
 <1672703557.3896.7.camel@embeddedTS.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <1672703557.3896.7.camel@embeddedTS.com>
X-CMAE-Envelope: MS4xfFwPyD8B6sziN+K0bvz7BUgQiBuynZO+Ur3rhGSAmBnuObl9llIJMp1AJ5mdKsdRsp7iePUTbAjUAlOSEIcNGGzo4llR9w0L44C36E+RnKon+TspSx3L
 /E/SDxfe258MIeq8o199mjIw0FmklZx82vMA/AECV5AEsWzheTK0VUW52VaIzRL1q36m1YUoWOh++hUg+BOFruVVBxq7iD9mXN41cH2c2ebZWn0QFwvfy5ZC
 J7KIRpgXaypscmG9jnb0z3FK8+5PvozDLr5LmBUdxGmISlPsw0ZGHgRsA+LK4XCN
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1673438533; bh=YxdfvBvVHqDVt/AIVLUqxrw/boFDym8LO/5BZ2KiAjA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=kjX8/ML7XoVuL/stm77oa/f3QKCgupcIc50G/G3ChVsDyp2rQNARXP0BQSJeMghQ3
 OlekdPrqWD0Xb/0KH2kVLMixnp0q3/jagQMHFyX7yXjLtPJmGJgLCevKxK2IP6hUCB
 Fv8HcBY2juWu+COgjUewjB2jnz/CwP21BGbejrKZwmwsHBWTHeNZeYSTblj0kOikzx
 W7R+4ipr/XfIXWGlWxkBBdQZEceOOXIS0rBWs3TOY3wThSFs9b70/1RV5BQ/AjMp3V
 0o6GoqboRqgj/+MKvN3uDRgoVShvjJeaF4gM1TtCr6XSDpwAbOtoH7f6UsegmxmG9i
 qgQrgM6j3BwJQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=kjX8/ML7
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

Hi Kris,

On 03/01/23 00:52, Kris Bahnsen via buildroot wrote:
> Giulio,
> 
> On Tue, 2023-01-03 at 00:05 +0100, Giulio Benetti wrote:
>> Hi Kris, Thomas, All,
>>
>> On 02/01/23 20:24, Kris Bahnsen wrote:
>>> On Wed, 2022-12-28 at 21:53 +0100, Giulio Benetti wrote:
>>>> Add patches pending upstream[0] to handle various data types and api
>>>> changes up to Linux 6.1.
>>>>
>>>> [0]: https://github.com/embeddedTS/wilc3000-external-module/pull/2
>>>>
>>>> Fixes:
>>>> http://autobuild.buildroot.net/results/6aa7475a21a6060e9fce3552f73e6e7100a8b2aa
>>>>
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>>> ---
>>>>    ...missing-prandom_u32-with-Linux-6.1.0.patch |  34 +++
>>>>    ...fix-build-failure-on-remove-callback.patch |  44 ++++
>>>>    ...uild-failure-with-Linux-5.19-and-6.1.patch |  98 ++++++++
>>>>    ...on_parameters-Linux-6.1-build-failur.patch | 216 ++++++++++++++++++
>>>>    4 files changed, 392 insertions(+)
>>>>    create mode 100644 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch
>>>>    create mode 100644 package/wilc-driver/0002-spi.c-fix-build-failure-on-remove-callback.patch
>>>>    create mode 100644 package/wilc-driver/0003-cfg80211.c-fix-build-failure-with-Linux-5.19-and-6.1.patch
>>>>    create mode 100644 package/wilc-driver/0004-Fix-struct-station_parameters-Linux-6.1-build-failur.patch
>>>>
>>>
>>> Giulio, all,
>>>
>>> I figure this is the most appropriate place to have a discussion on
>>> this topic as these patches were also pushed to our github repo:
>>> https://github.com/embeddedTS/wilc3000-external-module/
>>>
>>> I want to note that we are not intending on doing any maintenance
>>> or patch work on this driver, except to keep this driver functional
>>> on our platforms.
>>
>> Oh, I thought the goal was to keep the module successfully building
>> through all Linux versions like we usually have in Buildroot for other
>> packages. For example all the Wi-Fi modules(i.e. rtlxxx packages) and
>> gpu(mali-driver, sunxi-mali-utgard, kernel-module-imx-gpu-viv etc.) or
>> other out of tree drivers.
> 
> Not quite. We decided to carve the tree from Microchip and make it
> externally buildable. We submitted it to Buildroot because it had
> appeared that the WILC support was neglected by Microchip. We took
> that opportunity to at least keep the firmware up to date while also
> giving any supported platforms a more up-to-date access to a driver.
> 
> We've been mostly relying on upstream from Microchip (and have an
> outstanding driver bug open with them for the WILC3000 that has
> been in process for the better part of 4 months) and touching bits
> that make sense to touch that do not impact function.
> 
>>
>>> It is maintained as a buildable external module
>>> of this folder tree:
>>> https://github.com/linux4sam/linux-at91/tree/master/drivers/net/wireless/microchip
>>
>> The problem is that with that we can't build for older Linux versions
>> and this is one of our goals. Someone can be interested in having it
>> running on Linux 4.x or earlier.
> 
> Which is why we havn't pulled in their latest round of changes
> and any feature updates from them we now have to carefully navigate.
> 
>>
>>> We did this because during the Microchip takeover they abandoned
>>> their maintained external tree as well as halted any plans to
>>> bring WILC3000 support to the kernel upstream. Our fork gives us
>>> easy access to building the modules without having to keep pulling
>>> changes in to all of our kernels.
>>>
>>> I'm not sure the best way to go about handling these patches as
>>> Microchip is currently only maintaining support for 5.15 it
>>> appears. I also don't want to pollute our external module tree
>>> with fixes that arn't in the upstream we're pulling in.
>>>
>>> Giulio, would you be willing to attempt pushing these changes
>>> to the Microchip repo?
>>
>> Yes, this is the idea once they create the 6.1 branch, at least I
>> expect they will do it soon since it's the new Linux LTS version.
>> Then for sure I will open a PR without all the #ifdef's I've created
>> in the PR I've opened to your Repo. Of course those patches will be
>> usable only for Linux 6.1 and that's it.
> 
> If we pull future patches in from linux4wilc tree, we will be careful
> not to upset the existing #ifdef madness to keep backward compatible
> support. But we do want to avoid getting ahead of linux4wilc if we
> can so if those changes do come in eventually, we can avoid an
> excessive amount of conflicts.

I understand

>>
>>> Does it make more sense to just leave these as patches to the
>>> driver in Buildroot?
>>
>> Not very much, because they must be reworked over the time and they
>> will continue to increase along with Linux versions. For sure we hope
>> WILC1000/3000 will be totally upstreamed at a certain point. But anyway
>> we will need your repository(or a fork of it) to keep all the #ifdef's
>> for LINUX_VERSION to support it on old Linux versions.
> 
> Unfortunately, while WILC1000 support is upstream, WILC3000 will not be
> upstreamed (according to a conversation with Microchip a few months
> back). This means unless they have a change of heart, someone else takes
> ownership, or we take ownership of the driver, it will likely remain
> locked to Microchip's kernel and this external module will continue
> to exist as needed.

Ok

>>
>>> Would it make sense to instead apply some limits to the package
>>> or external module to only build on already compatible kernel
>>> versions?
>>
>> I'd like to support the driver for any possible Linux version like we
>> do for the other drivers in Buildroot.
>>
>> I understand that there is an effort on your side to test the changes
>> you pull, but this will keep your repository aligned with the latest
>> Linux versions and it will be build-tested a lot with our autobuilders.
>>
>> This is my 2 cents. I leave the last answers to the maintainers, Thomas
>> is one of them.
> 
> We're not opposed to the idea, just hesitant to taking on that kind
> of ownership.
> 
> We're doing some porting work at the moment, to get our LTS platforms
> all up to kernel 5.10. From there, we may start pushing basic support
> for various platforms to upstream kernel. I think once we get there
> we would be more receptive to ownership of the WILC3000 driver to
> keep our platforms running.
Sorry for the late reply.

Ok then, PR is there pending whenever and if you want to merge or ask
for changes.

Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

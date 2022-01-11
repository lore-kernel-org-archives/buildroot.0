Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9B0C433EF
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 09:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D830660DFF;
	Tue, 11 Jan 2022 09:10:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojQxv10oigHG; Tue, 11 Jan 2022 09:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2642860D72;
	Tue, 11 Jan 2022 09:10:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A83FF1BF276
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 09:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95B0283E29
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 09:10:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bjZvhijdTNp9 for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 09:10:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6365F83E28
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 09:10:10 +0000 (UTC)
Received: from [77.244.183.192] (port=63874 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1n7DAN-000AMi-Sd; Tue, 11 Jan 2022 10:10:08 +0100
To: James Hilliard <james.hilliard1@gmail.com>
References: <20211231202620.3521230-1-james.hilliard1@gmail.com>
 <20220110221051.GT1477939@scaer>
 <CADvTj4qnuwUh594-QC-4ySNQX2aSfhfs36tX-cH5vMB52EbgbQ@mail.gmail.com>
 <20220110222808.GU1477939@scaer>
 <CADvTj4ogaTxytpD11-s7EfGOJr=4L8VYGCDr82S4_rsmBEitkw@mail.gmail.com>
 <2846b399-f095-acb3-c086-e44b3b74698e@lucaceresoli.net>
 <CADvTj4otjX+dffwVjypCc-mkyrGWSvzKe-K=-__ou7U+Q=7J8Q@mail.gmail.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <7659ce4e-a509-8ff3-1f98-17b7d2766623@lucaceresoli.net>
Date: Tue, 11 Jan 2022 10:10:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CADvTj4otjX+dffwVjypCc-mkyrGWSvzKe-K=-__ou7U+Q=7J8Q@mail.gmail.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 1/1] package/zynq-boot-bin: port to python3
 and move to support/scripts
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
Cc: Julien Olivain <juju@cotds.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James, Yann,

On 10/01/22 23:55, James Hilliard wrote:
> On Mon, Jan 10, 2022 at 3:46 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>>
>> Hi James, Yann,
>>
>> On 10/01/22 23:31, James Hilliard wrote:
>>> On Mon, Jan 10, 2022 at 3:28 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>>
>>>> James, All,
>>>>
>>>> On 2022-01-10 15:18 -0700, James Hilliard spake thusly:
>>>>> On Mon, Jan 10, 2022 at 3:10 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>>> [--SNIP--]
>>>>>> So I wonder if it even makes sense to keep package/zynq-boot-bin now.
>>>>> Well if someone is using an older uboot that doesn't have the
>>>>> generation capability
>>>>> integrated then it's probably still needed right?
>>>>
>>>> But then, they would have that tool in their uboot tree, and then
>>>> nothing would prevent them from running it as a post-build (or
>>>> post-image) script.
>>>>
>>>> Yes, they would need to have a python2 on their host. But that will be
>>>> the case if they stick to such older tools which may break on more
>>>> recent systems, not just uboot...
>>>
>>> Yeah, the advantage here is that it works with python3 as is with older uboot
>>> versions. I guess the main issue is that vendor uboot trees are often ancient
>>> and rarely updated so this would be mostly useful for those situations.
>>
>> Is upgrading to python 3 just to simplify potential legacy users the
>> only motivation for this patch? Then I would not touch this package at
>> all and avoid keeping our own copy of the script.
> 
> Well the motivation is that we want to drop python 2 from the
> toolchain entirely,
> so leaving this package as is would not be an option(since it depends
> on the host
> python2 interpreter support we want to remove).

I see. I'm currently unable to keep up to date with current Buildroot
development, apologies for the noise.

> We either need to
> remove it or use
> the python3 ported version(which due to the simplicity of the script
> should not cause
> any significant maintenance issues for us IMO).

I agree it would not create much maintenance burden, especially since
the script it is unchanged since ages.

But the question is for how long we want to maintain this tool in
Buildroot. There is no in-tree user, there is an alternative in U-Boot
since many years, even Xilinx removed their script years from their repo
and looking for info about this tool on the Internet leads to almost
nothing after ~2015. Users using this script nowadays with recent
Buildroot are most probably zero or close to zero. And, as Yann pointed
out, such users can still handle it with just a small annoyance.

For the above I'm in favor of removal, with a small paragraph in
Config.in.legacy saying it's been removed but one can still download it
from <URL> and call it in a post-build script after installing python2
on the host.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

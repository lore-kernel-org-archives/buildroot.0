Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912E9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 22:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 33B004099E;
	Mon, 10 Jan 2022 22:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTYaCkrGZyK4; Mon, 10 Jan 2022 22:46:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95CF840992;
	Mon, 10 Jan 2022 22:46:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F2E591BF31C
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:46:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1817818E8
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 22:46:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFn3SuQlJ5xu for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 22:46:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7A0781765
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 22:46:33 +0000 (UTC)
Received: from [77.244.183.192] (port=62290 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1n73Qt-000Edf-Lg; Mon, 10 Jan 2022 23:46:31 +0100
To: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211231202620.3521230-1-james.hilliard1@gmail.com>
 <20220110221051.GT1477939@scaer>
 <CADvTj4qnuwUh594-QC-4ySNQX2aSfhfs36tX-cH5vMB52EbgbQ@mail.gmail.com>
 <20220110222808.GU1477939@scaer>
 <CADvTj4ogaTxytpD11-s7EfGOJr=4L8VYGCDr82S4_rsmBEitkw@mail.gmail.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <2846b399-f095-acb3-c086-e44b3b74698e@lucaceresoli.net>
Date: Mon, 10 Jan 2022 23:46:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CADvTj4ogaTxytpD11-s7EfGOJr=4L8VYGCDr82S4_rsmBEitkw@mail.gmail.com>
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
Cc: Julien Olivain <juju@cotds.org>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi James, Yann,

On 10/01/22 23:31, James Hilliard wrote:
> On Mon, Jan 10, 2022 at 3:28 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>>
>> James, All,
>>
>> On 2022-01-10 15:18 -0700, James Hilliard spake thusly:
>>> On Mon, Jan 10, 2022 at 3:10 PM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> [--SNIP--]
>>>> So I wonder if it even makes sense to keep package/zynq-boot-bin now.
>>> Well if someone is using an older uboot that doesn't have the
>>> generation capability
>>> integrated then it's probably still needed right?
>>
>> But then, they would have that tool in their uboot tree, and then
>> nothing would prevent them from running it as a post-build (or
>> post-image) script.
>>
>> Yes, they would need to have a python2 on their host. But that will be
>> the case if they stick to such older tools which may break on more
>> recent systems, not just uboot...
> 
> Yeah, the advantage here is that it works with python3 as is with older uboot
> versions. I guess the main issue is that vendor uboot trees are often ancient
> and rarely updated so this would be mostly useful for those situations.

Is upgrading to python 3 just to simplify potential legacy users the
only motivation for this patch? Then I would not touch this package at
all and avoid keeping our own copy of the script.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

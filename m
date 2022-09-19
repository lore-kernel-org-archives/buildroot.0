Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B739AECAAA1
	for <buildroot@archiver.kernel.org>; Mon, 19 Sep 2022 22:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10CAA817D3;
	Mon, 19 Sep 2022 22:50:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10CAA817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uv_PLFi9VR-7; Mon, 19 Sep 2022 22:50:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CBBC817AD;
	Mon, 19 Sep 2022 22:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CBBC817AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9111C1BF39C
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 22:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C5B6817AD
 for <buildroot@lists.busybox.net>; Mon, 19 Sep 2022 22:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C5B6817AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcbytEGfpqQ5 for <buildroot@lists.busybox.net>;
 Mon, 19 Sep 2022 22:50:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 204B5817A8
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp1.osuosl.org (Postfix) with ESMTP id 204B5817A8
 for <buildroot@buildroot.org>; Mon, 19 Sep 2022 22:50:07 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.95.233])
 by Aruba Outgoing Smtp  with ESMTPSA
 id aPaXoPVw9lHojaPaXonZDV; Tue, 20 Sep 2022 00:50:06 +0200
Message-ID: <702d4839-6b1f-badd-614b-1fa5da1c3ef0@benettiengineering.com>
Date: Tue, 20 Sep 2022 00:50:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220810215104.107714-1-giulio.benetti@benettiengineering.com>
 <20220810233824.714623-1-giulio.benetti@benettiengineering.com>
 <20220811224752.1a1e53b7@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220811224752.1a1e53b7@windsurf>
X-CMAE-Envelope: MS4xfGLWIJ9ik0+N7Nje4FMciX50+u7pDmB1eymi6cYM6HGf+1xw1FeANWK379J2y5p2JhoToYXAqrcIFRR75KsKibqgWu6eIUZ0RMRjAUFDEszT/HDlihNq
 H7+xNzaSVNTsLU/kIxW7NU9b9GHnIbmHdre1+aQej62ZkWPj2jWkK5p0B9Ex2Obqw2kte+rvNB69NNrbhtuFiDPEQEVMT64BQGYABhGJ8ZHKKU40CRxeTEaC
 ezEBFJr0waZI0DC1Dr7VlNAWvrStyM4qtmcm+tbz5Lo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663627806; bh=ifmnun0aQ96e+MUyirCwZ9DP15WoeVV1gndKTg10cGw=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=nNDGSqOOQ0cZGA2xbn/6ftjSjAuNzywYkbzBj2pNnCl7qyWbwd6eCexngk2hd+isX
 epdtQiBWa5bRWjJYl9QCFoUmJCbRSf8MBj1QFbMmaxgg9U0g6X/2upHEqiPFGmXVs2
 bSR6LV0f88mOkfhcDouCT3pT2/oRGSQho7Ryx8ZsxQujVG0AyvuICeeP+0r7KaTnf8
 /iVyIytTgJ2WKvAadK3ea55DMdRB4dtDb4kS9Adj1PZ+0ANfOM0XjIxAFQb6RZGY3H
 Jo9CyhRb//NJDijNi8iA2Eh4BmjQwZABoa2A7NmVjFUXK9Lvgnxc+PoZVwhQNvHM/f
 OMw+ndRJgWnsQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nNDGSqOO
Subject: Re: [Buildroot] [PATCH v2] package/nfs-utils: improve local patch
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

Hi Thomas,

On 11/08/22 22:47, Thomas Petazzoni via buildroot wrote:
> On Thu, 11 Aug 2022 01:38:24 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> As Thomas Petazzoni made me notice the actual local patch is not a good way
>> at all to deal with pkg-config with Autotools. So let's rework the patch
> 
> It is recommended to avoid first person sentences in commit logs.
> 
>> according to his comment that represents the standard of Autotools
>> pkg-config usage. This impacts host-nfs-utils too that is used to build
>> nfs-utils and so libmount must be present in host. We do this by adding
>> host-util-linux to HOST_NFS_UTILS_DEPENDENCIES since it is the libmount
>> provider.
> 
> So, host-utils-linux is now only needed by host-nfs-utils because of
> the new check in configure.ac, but nfsrahead is in fact not built for the host?
> 
> If it's the case, then the configure.ac change is wrong, and the mount
> library of util-linux should only be checked using PKG_CHECK_MODULES()
> when it is actually needed.

Totally, and I've managed to work this recursive issue with a patch I'm
going to send soon.

> Another nfs-utils thing I noticed:
> 
> ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBBLKID),y)
> NFS_UTILS_CONF_OPTS += --enable-uuid
> else
> NFS_UTILS_CONF_OPTS += --disable-uuid
> endif
> 
> but BR2_PACKAGE_NFS_UTILS selects BR2_PACKAGE_UTIL_LINUX_LIBBLKID so
> this conditional doesn't make much sense.

I've removed those lines in the same since it's a left-over of a
previous patch and libuuid is needed by default now.

Thank you for pointing me the lines above, this was a pretty difficult
patch for me :-) I hope the new patch will be correct!

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

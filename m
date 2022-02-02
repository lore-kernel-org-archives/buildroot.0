Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E977FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  2 Feb 2022 21:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7FBD2409E5;
	Wed,  2 Feb 2022 21:54:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_k73J58t3L5; Wed,  2 Feb 2022 21:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 731B1409CD;
	Wed,  2 Feb 2022 21:54:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 237661BF2A3
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 21:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1146E6058C
 for <buildroot@lists.busybox.net>; Wed,  2 Feb 2022 21:54:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TO3tCQmciTYK for <buildroot@lists.busybox.net>;
 Wed,  2 Feb 2022 21:54:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE32460864
 for <buildroot@buildroot.org>; Wed,  2 Feb 2022 21:54:20 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id FNZznTN1Fkz4hFNZznvHXY; Wed, 02 Feb 2022 22:54:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643838859; bh=N224j5FyhMaldc9M7vlIks8EuBOJwo1zMp6jtVXVHMA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=R/Ti/VF/veyNdfPwML3ND0z1WJAGyqrz/v9gBV0LEs9+vEm1FZUV2QtPtOfPt4plu
 +yQTEFLN7h1GTSZJxZTyQrt8K6ApRxzquJkpgyZbRNQMFi7OQOE0WggWcTYeLKi8X5
 YpWNHRw3vlJbbDrFRn3vyQG8wv18CGRwgHXlKqE3eScGtgXkK91TzjWgz/9zO0p5iO
 3mW35N53G7wEnvD6xGVu3PlPMNiF5FSa8WgYVJIgHpaw6B4y+RQhm4l5R0fa2fm2tT
 XzJ7yyWXG4exedwYq0wFJSD8VhO3u9/bDNxGsPQ0yDWQ3Rq+8gQlmdPW5kxQcROsaX
 W6kOso6txQSEw==
Message-ID: <412baee3-b818-521a-99bf-ee868d3e1be2@benettiengineering.com>
Date: Wed, 2 Feb 2022 22:54:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Seiderer <ps.report@gmx.net>
References: <20220201232203.333403-1-giulio.benetti@benettiengineering.com>
 <20220201232203.333403-2-giulio.benetti@benettiengineering.com>
 <d6ff992c-a84c-d335-3ddb-2122f7c744dd@mind.be>
 <20220202214210.0a2483e6@gmx.net>
 <48ab9669-d467-a394-12a2-fd229f6229f0@benettiengineering.com>
 <20220202224046.1ccef19a@gmx.net>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220202224046.1ccef19a@gmx.net>
X-CMAE-Envelope: MS4wfIDHzFeEEuNKKyccvqkOpPV7KpF/GEgtpcOOIVXOrsmtWEtntx0P6mUfECcmamDZjlbkvQGszqbGrqiOTieyx065hpgCSKcqEevDZRZzSjDHAQw4M4wZ
 6H7TnKIAcs3Z2vzZ4HYHRqsBAeH47Qr2Gp0eiYb13Hst8aPa8hLy+uauVhN+PkVyTY3KsC4fZy0Dafo87fVOHzLx1/0q0HKxkF868ufMtXae2vd4UmeWkeAR
 IWKeKDHE3YPOGYNHr+V39rQM5ee2WLLOGlNgpLrMBWk5IwlEw2RbKdeprD30HW+72ZXpPtFTznlbng5mGMd7Ug==
Subject: Re: [Buildroot] [URGENT 1/1] package/util-linux: fix host build
 failure
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/02/22 22:40, Peter Seiderer wrote:
> Hello Giulio,
> 
> On Wed, 2 Feb 2022 22:09:22 +0100, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> Hi Peter,
>>
>> On 02/02/22 21:42, Peter Seiderer wrote:
>>> Hello Arnout, Giulio,
>>>
>>> On Wed, 2 Feb 2022 08:41:34 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:
>>>
>>>> On 02/02/2022 00:22, Giulio Benetti wrote:
>>>>> The UTIL_LINUX_FIX_DISK_UTILS_COMPILE workaround is needed for host
>>>>> building too. So let's add it to HOST_UTIL_LINUX_POST_PATCH_HOOKS.
>>>>> host-util-linux is used a lot, so this patch fixes a lot of future
>>>>> builds.
>>>>
>>>>     Darn, I tested that, both with and without BR2_PACKAGE_HOST_UTIL_LINUX set. I
>>>> don't understand what went wrong in my test...
>>>
>>> The raw support depends on the available toolchain headers, see e.g.
>>> package/util-linux/Config.in:
>>>
>>> 	config BR2_PACKAGE_UTIL_LINUX_RAW
>>> 	        bool "raw"
>>> 	        depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_14
>>> 	        help
>>> 	          Build a linux raw character device
>>>
>>> Or according to [1] '--disable-raw' for the host build should do
>>> the trick too...
>>
>> I was in hurry to produce the patch last night, so I went for the
>> fastest way. Can you give a try with --disable-raw and eventually submit
> 
> Thanks for taking care!
> 
>> the patch? That would save some time while building. Also because
>> host-util-linux is used a lot
> 
> Sorry, could not reproduce the host-build failure on my system, seems the
> toolchain is too up-to-date (openSUSE Tumbleweed - gcc-11.2.1) ;-)
> 
> But can provide an RFC patch for testing...

I give a go on my pc and if it works I add
Suggested-by: Peter Seiderer <ps.report@gmx.net>

Are you on IRC? If yes my nick is benettig you can ping me there :-)

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

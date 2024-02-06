Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6448C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5660E41585;
	Tue,  6 Feb 2024 15:20:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5660E41585
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uFqOYATgJ7zB; Tue,  6 Feb 2024 15:20:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6FE9F41665;
	Tue,  6 Feb 2024 15:20:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FE9F41665
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 316581BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 098FA41B1B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:20:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 098FA41B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3eswXSBbTnY for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:20:13 +0000 (UTC)
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 228A740293
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:20:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 228A740293
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XNF4rjDOvlzzoXNF4rf82P; Tue, 06 Feb 2024 16:20:10 +0100
Message-ID: <f136603a-2c1c-4e2a-ae55-446a33952b73@benettiengineering.com>
Date: Tue, 6 Feb 2024 16:20:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240116065831.9471-1-fontaine.fabrice@gmail.com>
 <20240116065831.9471-2-fontaine.fabrice@gmail.com>
 <20240206161152.0e178414@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240206161152.0e178414@windsurf>
X-CMAE-Envelope: MS4xfHH7h1UvxHrC5Mfpn3JbKgvYcPhYYjyPC/43JK49UeJ/8cj/Xf6zizN4bhEVBV6Cs8GRmwL1yD+MI3jUi2KAUFRY5pmBqBgWY3rsWj/PyIpZ8v0PClqt
 5hzF8wce57ZwpQkTjFbJjFHiIxq6HtwmmK6CCq8bAdL9T9tc7d11Hb7s4AQ2gRZulvHABlIWF+wn/26b2Ba2YT13mGQraB1P7PqJSe/skChk8HRnCEcUWQDz
 Zms8+IOEQCM30x3Ex4v8z626z7yVlbcXO7iLzglSfeGkIgYvv5zUP4CUypbwEnYQU4SdHAdmUB2a9OC2K6v7ewUiQZWnj6QMH0nrwWNWFBZEgtOlqXpIdgOv
 QdsOssac3cG7CXQSt2B47NDjGbY6peQTgS6oPyJUoJ8dt/hVaVODZnBJrnK1xWtEg1Iaqw77X5BWudvXsCVeGyXY4VUGS3raEtub9G6ALwA34KXyitcYFGEv
 oxh/L7vzJRxMa3TQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1707232810; bh=qoN2W6XW1xd+N2QJvM71OHUhqF9eXxBtXq2Qri/Q0P8=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=i45Ua1ClfxnQj4QGadBMhPXJtaAXIzXgqgCS2k0I/ZmS4mhv/lfQt9OYt+FMGiypz
 BEmpq7b63t2ZPIW36Rfv/RCoVQQs/ztT99aHdAOJOB+TZ5/FkoywuselDg58108uX6
 BmTzZApjURkSJY+dW6gCdwWWRYGNMYLEhV9GTCPLowJBUt1H+bu7WVHBLydkb5tMQp
 tNMcg0Bq3KzjfQHGIfwjc6WlNLjWEOzV7eGOr5ze5Ig7MSRUjb/DzSB9GIztk2KVR1
 Af4byGUj5/IPM3aR9lG3mbVFoVX4D6wtUHwGl35KC4vQP5M9T1GEJfOFV2HVQh2Mjl
 lXdpeqfrQ+gDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=i45Ua1Cl
Subject: Re: [Buildroot] [PATCH v2,
 2/2] package/attr: affected by gcc bug 101766
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>, Norbert Lange <nolange79@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Fabrice,

On 06/02/24 16:11, Thomas Petazzoni via buildroot wrote:
> Hello Fabrice,
> 
> On Tue, 16 Jan 2024 07:58:31 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
>> attr is affected by gcc bug 101766 since version 1.5.2 and
>> https://git.savannah.nongnu.org/cgit/attr.git/commit/?id=11b9069098b4d4c23efb06c9457a085b784354d4
>> resulting in the following build failure on microblaze since commit
>> b31b91296e7f985b909f104f06a098adddef1fea:
>>
>> libattr/syscalls.c:133:10: error: symver is only supported on ELF platforms
>>    133 | # pragma GCC visibility pop
>>        |          ^~~
>>
>> So let's disable package attr and packages depending on it.
>>
>> Fixes:
>>   - http://autobuild.buildroot.org/results/29c76e02becedf922bd7dc0533338c078bf77d2a
>>
>> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> 
> I don't like this very much. It's annoying to propagate this dependency
> to all reverse dependencies of attr, and make it unavailable on
> Microblaze for this silly reason. So I came up with the attached patch
> for attr, which rather detects if __attribute__(__symver__) works or
> not, and fall backs to another mechanism if not (this fallback already
> exists in the attr code).
> 
> Could you have a look at my proposal, and if it suits you, submit it
> upstream and as a patch to Buildroot ? :-)

I deal with attached patch.

-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> (Yeah, I know I'm pushing some of the work for you, my goal is to be
> able to continue review/merge other patches)
> 
> Thanks a lot!
> 
> Thomas
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

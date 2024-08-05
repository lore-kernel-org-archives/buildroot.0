Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF34C3DA7F
	for <buildroot@archiver.kernel.org>; Mon,  5 Aug 2024 15:47:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6F1F80C1D;
	Mon,  5 Aug 2024 15:47:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Psic2ajRry_9; Mon,  5 Aug 2024 15:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E1B2380D28
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1B2380D28;
	Mon,  5 Aug 2024 15:47:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83B271BF3A9
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 15:47:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71E7980CFF
 for <buildroot@lists.busybox.net>; Mon,  5 Aug 2024 15:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8SzK0kFvQ9Zg for <buildroot@lists.busybox.net>;
 Mon,  5 Aug 2024 15:47:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=199.89.1.8;
 helo=005.lax.mailroute.net; envelope-from=wdouglass@carnegierobotics.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 80C5F80C1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80C5F80C1D
Received: from 005.lax.mailroute.net (005.lax.mailroute.net [199.89.1.8])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80C5F80C1D
 for <buildroot@buildroot.org>; Mon,  5 Aug 2024 15:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 005.lax.mailroute.net (Postfix) with ESMTP id 4Wd15n01t0zm84wK;
 Mon,  5 Aug 2024 15:47:09 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 005.lax.mailroute.net ([127.0.0.1])
 by localhost (005.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id gHthEi_Kh9Vm; Mon,  5 Aug 2024 15:47:07 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 005.lax.mailroute.net (Postfix) with ESMTPS id 4Wd15l2bsSzm84wL;
 Mon,  5 Aug 2024 15:47:07 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 5 Aug 2024 11:47:06 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Mon, 5 Aug 2024 11:47:06 -0400
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Max Filippov
 <jcmvbkbc@gmail.com>
Thread-Topic: [Buildroot] [git commit] package/chicken: move literals into
 text section for xtensa architecture
Thread-Index: AQHa5QN4pNZbbSMqv0OjWs6pVPvbG7IUhJ8AgAAjIwCABG63AA==
Date: Mon, 5 Aug 2024 15:47:06 +0000
Message-ID: <e7f60ec9-b902-46f6-b02c-96584803d501@carnegierobotics.com>
References: <20240802170713.2790A83B45@busybox.osuosl.org>
 <CAMo8BfK7FSn8imzqjTW8BLS7mPk6HLTKvCM4aBFaJw93z-ZpmQ@mail.gmail.com>
 <20240802194315.2de20808@windsurf>
 <CAMo8Bf+5XSQyEp1ZP1UbqL7DF=VLfWbUuA-3OFY9M7WENn0GaA@mail.gmail.com>
 <20240802220548.1e6676f9@windsurf>
In-Reply-To: <20240802220548.1e6676f9@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
x-originating-ip: [172.30.0.85]
Content-ID: <FB4E894AE5566447BF6B53A0410D8054@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1722872827; x=1725464828;
 bh=dO4AOh6B68FMsfItghcGeZlJlV/97gNmhMCqqiz7dBc=; b=TKA8nHuGu43k
 hZnT+CBkM5v/Fux6LiSvAMgDjreU+ZSiBekE49VktkFY7YnwlvMe1RiRX68JhAUf
 kFq1RMYLiEx6+IxcZXiT4YTYx7UWZuXMRwLsngcI4z9b8p5yS30AZBXqjSZlNL8e
 hjOGvPpYUgohSdEY8zubOph5KLHLptz56RqXBkNKENc5dn1UP/nJUsOc1MZL8HuU
 4WJ37Gpva8cJdstJ4JoHfmxXc4cvDo9b2BqzRuzbcCytBIyA1J76h7zsL0a/RGYN
 JhkY4soz6vZwAQFyPIew6TcN1dqSdCy/daX/LkI8vz9LTkaiOUQmPfTBn3W/cgUI
 bAy/mRoUSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=carnegierobotics.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=TKA8nHuG
Subject: Re: [Buildroot] [git commit] package/chicken: move literals into
 text section for xtensa architecture
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
From: Woody Douglass via buildroot <buildroot@buildroot.org>
Reply-To: Woody Douglass <wdouglass@carnegierobotics.com>
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/2/24 16:05, Thomas Petazzoni wrote:
> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender.
>
>
> On Fri, 2 Aug 2024 11:00:02 -0700
> Max Filippov <jcmvbkbc@gmail.com> wrote:
>
>>> It causes build failures:
>>>
>>>    http://autobuild.buildroot.net/results/ce36170d67c4702f34bee025d8a46e5269c4573e/
>> I see the following in the build-end.log:
>>
>> /home/autobuild/autobuild/instance-2/output-1/per-package/chicken/host/bin/xtensa-buildroot-linux-uclibc-gcc
>> -fno-strict-aliasing -fwrapv -DHAVE_CHICKEN_CONFIG_H
>> -DC_ENABLE_PTABLES -c -Os -fomit-frame-pointer -fPIC -DPIC
>> -DC_BUILDING_LIBCHICKEN library.c -o library.o -I. -I./
>>
>> There's no TARGET_CFLAGS in this command line.
> Hm, indeed!
>
> So, Woodrow, could you have a look at the chicken build system, and why
> our CFLAGS are not passed down to the build?
>
> Thanks!
>
> Thomas

I'll take a look and submit a patch hopefully later this week -- sorry 
to have caused this. Not sure why this seemed to build on my machine (I 
tested with buildroot's docker-run testing script)

Thanks,
Woodrow Douglass

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

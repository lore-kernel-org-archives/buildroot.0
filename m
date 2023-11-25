Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08140C61D97
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 00:24:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 83A634004A;
	Sat, 25 Nov 2023 00:24:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83A634004A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ACR6Jsy2Ysgg; Sat, 25 Nov 2023 00:24:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 854E6400D1;
	Sat, 25 Nov 2023 00:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 854E6400D1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CB161BF29F
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 00:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9F8661521
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 00:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9F8661521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tUfysmWNHSc2 for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 00:24:49 +0000 (UTC)
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 03E7861520
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 00:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03E7861520
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 6gTVrI6wxsbav6gTVrUtIN; Sat, 25 Nov 2023 01:24:46 +0100
Message-ID: <1c744e50-01e2-4e78-94b1-62b6ebfd992d@benettiengineering.com>
Date: Sat, 25 Nov 2023 01:24:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20231123173957.2385041-1-giulio.benetti@benettiengineering.com>
 <20231124225923.59d08949@windsurf>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20231124225923.59d08949@windsurf>
X-CMAE-Envelope: MS4xfBS+kDhgXKMwzzBWnUfdyzQcnlqgn/aOr1dJsT3nl0EbYK+c4OVCqTiWPYjktYfh/65qogYo6vXR7ZiXPIGX/WoNz2JGLhAl3HbekhcfnMtwFGir767x
 WssQBppCg7hZ3XfXLwbEol/BTEmEfZHDreub/Ygu3B7resk8TmqnU8jlxWI03ydUIgGi/SWVKv/YYh8q4oU7jSDf8NTb0ZNtYgsMYICe3m4P3ib8/q35SaXw
 Go5nDuVBV9VlAh1YkbXcBhUF0z0AYM3dV83/vU79md11+7D30CmveypHQf/hGXt7SRHmtHxlS6Suhj6+li97KYzHbeePILWm5DN2C7GSooN/Z9OoshOZnUwY
 ytgM0mSqilgk7Yceh+N0+Irk+WsEzOuAsx5XW1WXSaNdwQVoeCHfcMNFMMtBCW8X//AvRXtA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1700871886; bh=absuGI79ukkIjZ3CndwGIZPkAbYwRcv6jxEa9M87OY4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=X9sK/FNSnTWCnpJTNn0hUqK8fdomNIae5VrvQplGeClI7x4KSLqxApCfJrmlBVovI
 I8WTzhevWpueuH16AeS2pnu7G/RQepxRzDvNnsuZslkhsGZGo5nTOcGenBNZaK+Ckg
 8MRTe/kPw9kvVdNWiKHd1eFRUv3pnCYMc9rcceiQqepQDUxPAUcaXweWmZ+qH/3c0x
 d7E/I1CjqoQWxTdo3YrVs/t51EJv2yC57o0plPYDB5qOEiVsY38CLhGdV5+88nUu59
 JH8M//FenFlnbRNJmpOgZ1XbD1ZoI7bNg5EczxqbupFHIwNF7DCUGRSH9iTjS5llbz
 kJidKxr2S22vA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=X9sK/FNS
Subject: Re: [Buildroot] [PATCH] package/swupdate: workaround runtime update
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
Cc: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Jim Reinhart <jimr@tekvox.com>,
 Matthew Maron <matthewm@tekvox.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

On 24/11/23 22:59, Thomas Petazzoni wrote:
> On Thu, 23 Nov 2023 18:39:57 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> +SWUPDATE_CFLAGS = $(TARGET_CFLAGS)
>> +
>> +# Workaround update failure showing up with -Os
>> +# Reported here:
>> +# https://groups.google.com/g/swupdate/c/oHMihNw8ZHA
>> +ifeq ($(BR2_OPTIMIZE_S),y)
>> +SWUPDATE_CFLAGS += -O3
>> +endif
> 
> This looks really horrible to me.

You're right,

> Is there a compiler bug? Or a bug in
> the swupdate code base, such as some undefined behavior that causes an
> incorrect behavior when built -Os, but not -O3 ?

An undefined behavior showing up when built with -Os, but I'm currently
trying to work it out and also to give a test case to SWUpdate
Maintainer using qemu-arm.

So I think it's better I get to the root cause, I fix it and later
provide a local patch to fix the problem.

I've already set the patch as Rejected on Patchwork, sorry for the
noise.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas

> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

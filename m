Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E589AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 06:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8874D60E33;
	Mon, 11 Apr 2022 06:31:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Os247cRWrEnR; Mon, 11 Apr 2022 06:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51DCE60B43;
	Mon, 11 Apr 2022 06:31:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 12EFB1BF46A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 06:31:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0F30860B43
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 06:31:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lj-apSE66c_2 for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 06:31:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from hr2.samba.org (hr2.samba.org [IPv6:2a01:4f8:192:486::2:0])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E3EDA60AB2
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 06:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:Cc:To:Date:Message-ID;
 bh=MO0kbtV1VOxsSAojrILkiK/nLM6j2LunM0sSUkjSEYQ=; b=03ARnsxRkGAfGMcGuBFeidGxMM
 o5dz3XK46Jl+E31ZbK0nx2NqIdDzJqtQg+7tdKz7vbklw8qlnbLKdUFc8f0t+YmteVEZAFA012DjD
 TpuPb/mS06+30qem2MAR3jvv4uRKLaii7Id/4DZq7t1gQM+bKS3Y9h3uN/jdq6fctH+UGjKNpnC59
 lJdyB+hMz8xEdZVcOmQFxwxT1CTKrQiQG+gcUNxxbQglEAInlfywXo7f73QJatcieJoc0+MQFaqaH
 dUmBG6bd/M+WQgI79/SgM1KUZv34VwduacTZ3jJDTzsoeEtVh3y7fIXAoT7b0vbcCBw1opQST5oCQ
 D4oJPJvIWtZiEt1Cc85nfOcDY/NhnmmkFIJeqrTNcBRwfJU+ra8hm8LWuoub3A/nHc79I3QFV8IzI
 S6VugZbsxi1GQI9v9rmByNomERiAIFbuFd4gpZp4qXCSOwKmFA2/XCrNSvW0jGaNSTND66Cjrsr/o
 ru5sIUPBRdEbEg8mV/szpYpa;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1ndnaO-006NzO-EA; Mon, 11 Apr 2022 06:31:40 +0000
Message-ID: <296339a6-e188-9549-12c5-c5983eb6a5ef@samba.org>
Date: Mon, 11 Apr 2022 08:31:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: de-DE
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220408070921.1786-1-ambi@samba.org>
 <CADvTj4o=EQwRhbEfOoXLAej4JW2kdnLNOwQ-R0AG9hHytJWtLQ@mail.gmail.com>
In-Reply-To: <CADvTj4o=EQwRhbEfOoXLAej4JW2kdnLNOwQ-R0AG9hHytJWtLQ@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH 1/2] package/openjdk-bin: add support for
 host architecture aarc64
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
From: Christian Ambach via buildroot <buildroot@buildroot.org>
Reply-To: Christian Ambach <ambi@samba.org>
Cc: Tudor Holton <buildroot@tudorholton.com>,
 buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


Am 08.04.2022 um 23:18 schrieb James Hilliard:
>> --- a/package/openjdk-bin/openjdk-bin.mk
>> +++ b/package/openjdk-bin/openjdk-bin.mk
>> @@ -11,8 +11,17 @@ else
>>   HOST_OPENJDK_BIN_VERSION_MAJOR = 11
>>   HOST_OPENJDK_BIN_VERSION_MINOR = 0.13_8
>>   endif
>> +
>> +HOST_OPENJDK_BIN_HOST_ARCH := $(shell uname -m)
> Just use HOSTARCH instead like this:
> https://github.com/buildroot/buildroot/blob/8f3cfe41961d83a9c01630f241bf045e3aa59b40/package/rustc/rustc.mk#L14
> 

Thanks for the hint... I am new to buildroot and tried to use BR2_HOSTARCH, but that didn't work.
I looked in other Makefiles but couldn't find HOSTARCH, so I went with my own solution.

Patch to follow.

Cheers
Christian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

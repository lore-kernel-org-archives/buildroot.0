Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8505FC71153
	for <buildroot@archiver.kernel.org>; Mon, 28 Aug 2023 20:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAFB74086A;
	Mon, 28 Aug 2023 20:45:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAFB74086A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GVtmAijqGTXX; Mon, 28 Aug 2023 20:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB43340865;
	Mon, 28 Aug 2023 20:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB43340865
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED3E21BF2BC
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 20:45:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C402340865
 for <buildroot@lists.busybox.net>; Mon, 28 Aug 2023 20:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C402340865
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gII_6px_glaI for <buildroot@lists.busybox.net>;
 Mon, 28 Aug 2023 20:45:28 +0000 (UTC)
X-Greylist: delayed 2570 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 28 Aug 2023 20:45:27 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E06224085A
Received: from 011.lax.mailroute.net (011.lax.mailroute.net [199.89.1.14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E06224085A
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by 011.lax.mailroute.net (Postfix) with ESMTP id 4RZMyH2W58z5DYN
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 20:45:27 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10026) with LMTP
 id XXTJ5C8IHzl6 for <buildroot@buildroot.org>;
 Mon, 28 Aug 2023 20:45:26 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 011.lax.mailroute.net (Postfix) with ESMTPS id 4RZMyG2x3Fz60S3
 for <buildroot@buildroot.org>; Mon, 28 Aug 2023 20:45:26 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Mon, 28 Aug 2023 16:45:25 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4]) by
 CRL-PGH-EX19-1.crl.local ([fe80::81d6:ea84:15d9:67d4%7]) with mapi id
 15.02.0858.015; Mon, 28 Aug 2023 16:45:25 -0400
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Github download helper possibly not working
Thread-Index: AQHZ2eqWwS2DsE4V80u7BpHSQEYaAbAAcFsA
Date: Mon, 28 Aug 2023 20:45:24 +0000
Message-ID: <64c2a692-7d66-d6ff-522e-a66fb8752eb9@carnegierobotics.com>
References: <ad574a2a-a776-d7e5-8dcb-f3693d222558@carnegierobotics.com>
In-Reply-To: <ad574a2a-a776-d7e5-8dcb-f3693d222558@carnegierobotics.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
x-originating-ip: [172.30.0.81]
Content-ID: <E7D2A25CDA18594C8BB7A98D107DC82C@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1693255526; x=1695847527;
 bh=CmmKGc6Oy/HNiNsQ9UprGyfEEy18vmtTwbnimsJ/s0M=; b=hxs+7XW7E8ph
 uKZn3s3gOvR5zMpTYJmnYKbX9Upe8VT4oHeMe/T8JuqHcRrYuvvHAb7Cqz4Dl7iA
 5C/oXruemabODnYhzCkANJJrYA5yCjQqkLeDOgh8DsaBREqP0m8Pp/DmqTCkiC1f
 1lWXvg6vQBNLZvGC6O1JGShyB2B5spJhJCxQiIyCepotX/Viq06M5AkW2N5OO3hv
 HtRn597kXpr5l4KxJExzD1ZUJICaxMIncG+MZRY15pjqlTQgCturIxn3PGQi73et
 7+3k6qFI/q6Q8LS668YJHBHYqVNHGPfXnkBYBO2B0xGlgqSELh4HVY0vznIhqZQn
 d1UkmOW8yw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=hxs+7XW7
Subject: Re: [Buildroot] Github download helper possibly not working
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To follow up,

It seems if I uninstall wget, and install busybox, and use busybox's 
version of wget, downloads are successful. I'm not sure what, in the 
confluence of wget and github.com, causes this issue, but I have a 
workaround for now. I'm not sure if/how the buildroot project should 
respond to this issue, but that's the information I have.

Thanks again,
Woodrow Douglass

On 8/28/23 16:02, Woodrow Douglass wrote:
> Hello all,
>
> I've noticed that packages that use the `github` download helper are 
> falling over to buildroot mirrors. I've tried with packages 
> `yaml-cpp`, `zlog`, `swupdate`, and `pcm-tools` -- all are redirected 
> before eventually getting a 403 from codeload.github.com and falling 
> back to sources.buildroot.net. Is anyone else seeing this behavior? 
> I'm trying to find a workaround now, but I'd appreciate any help!
>
> Thank you very much,
>
> Woodrow Douglass
>
>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

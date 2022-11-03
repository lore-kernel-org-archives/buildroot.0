Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367C9C4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 23:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B684140BDD;
	Thu,  3 Nov 2022 23:06:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B684140BDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QDwDc3gIXSAQ; Thu,  3 Nov 2022 23:06:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E087E40BD8;
	Thu,  3 Nov 2022 23:06:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E087E40BD8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 971FA1BF322
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 23:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E60D40BD8
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 23:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E60D40BD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xuUaQ5ifQgzD for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 23:06:40 +0000 (UTC)
X-Greylist: delayed 00:36:11 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E03C40BCE
Received: from 001.lax.mailroute.net (001.lax.mailroute.net [199.89.1.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E03C40BCE
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 23:06:40 +0000 (UTC)
Received: from localhost (001.lax.mailroute.net [127.0.0.1])
 by 001.lax.mailroute.net (Postfix) with ESMTP id 4N3KBm0trpz1M8Cv;
 Thu,  3 Nov 2022 23:06:40 +0000 (UTC)
X-Virus-Scanned: by MailRoute
Received: from 001.lax.mailroute.net ([199.89.1.4])
 by localhost (001.lax [127.0.0.1]) (mroute_mailscanner, port 10026)
 with LMTP id d52biMvfYpXS; Thu,  3 Nov 2022 23:06:38 +0000 (UTC)
Received: from mail.carnegierobotics.com (unknown [72.22.26.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by 001.lax.mailroute.net (Postfix) with ESMTPS id 4N3KBk4HSxz1M86Y;
 Thu,  3 Nov 2022 23:06:38 +0000 (UTC)
Received: from CRL-PGH-EX19-1.crl.local (10.1.7.176) by
 CRL-PGH-EX19-1.crl.local (10.1.7.176) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Thu, 3 Nov 2022 19:06:37 -0400
Received: from CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c]) by
 CRL-PGH-EX19-1.crl.local ([fe80::895e:aa1a:c80e:9f5c%7]) with mapi id
 15.02.0858.015; Thu, 3 Nov 2022 19:06:37 -0400
To: "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>
Thread-Topic: [PATCH 1/1] package/opencv4: add support for opencv4_contrib
 repository for extra modules
Thread-Index: AQHY79PchIcNjjfRmUGsVEGv/RpL7q4uELMAgAAEjIA=
Date: Thu, 3 Nov 2022 23:06:37 +0000
Message-ID: <e7c0b899287bbb78b1d871f0ce10767d7b57beab.camel@carnegierobotics.com>
References: <70a53e0eb3fdc514641a9cb83dd42aa5bd0f1be6.camel@carnegierobotics.com>
 <20221103235020.70bb8e8e@windsurf>
In-Reply-To: <20221103235020.70bb8e8e@windsurf>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.30.5-1.1 
x-originating-ip: [10.212.134.122]
Content-ID: <78B989FFC183744C8EBB6801D05CDC3E@crl.local>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 carnegierobotics.com; h=mime-version:content-transfer-encoding
 :content-id:content-type:content-type:user-agent
 :content-language:accept-language:in-reply-to:references
 :message-id:date:date:subject:subject:from:from:received
 :received:received:received; s=mr01; t=1667516798; x=1670108799;
 bh=BIl1I94yjmTYINCtmMLlCrAXvlZG9wOO2uWkWLtLUnc=; b=OMqOIvlw8/dq
 +RsLXyj7h4ziUI8iKsKdZuT2QAe0L4K/O8jce9zUJadLLaG3sEeAZLkRL3DfXB3b
 7DN5TCLTTL/YhJkRXLgL+rSRJzGTYwoeAUPPOe/QiPOfXd3WXZmOg+53JkyNXlcF
 L/pcfuXMTfBm90MDxmBlX3lmI3kZgzRZJAQC6bzCDlNj4k1Q30xy+azTd5ZgxRs/
 3ffjGls78OqLThXuHhkPoW0LWSnumW2JTNz0oYnLEfn0TstvyjnX6T4mGb+zLPmK
 tZLezNqfOos+pl86ZEb1AwUsQB3/b0XJYWzTzNLaNKOaYPCsz1TAsBp8CBzwwQLz
 CMyIAx8aGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=carnegierobotics.com header.i=@carnegierobotics.com
 header.a=rsa-sha256 header.s=mr01 header.b=OMqOIvlw
Subject: Re: [Buildroot] [PATCH 1/1] package/opencv4: add support for
 opencv4_contrib repository for extra modules
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
Cc: "fontaine.fabrice@gmail.com" <fontaine.fabrice@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas
Ok, no worries. My work email is outlook, so I cannot seem to get git
send-email working with it. I will attempt again in the morning, from
my personal (SMTP) email and with a revised commit message (and maybe a
comment in the .mk file)

Thanks for taking a look!
Woody

On Thu, 2022-11-03 at 23:50 +0100, Thomas Petazzoni wrote:
> Hello Woody,
> 
> On Thu, 3 Nov 2022 22:30:21 +0000
> Woody Douglass <wdouglass@carnegierobotics.com> wrote:
> 
> > This adds a separate opencv4_contrib package to manage
> > downloading/unpacking that repository. These extra modules
> > are useful for a lot of applications, but not necessary
> > for minimal installs, so they are all given dedicated Kconfig
> > options
> > 
> > Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
> 
> Thanks a lot for your patch! One issue is that because you did not
> send
> it with "git send-email", it arrived on the mailing list badly
> damaged
> (line-wrapped)  by your e-mail client.
> 
> Also, one thing that really should be explained in the commit log is
> that the opencv4-contrib is only useful to download additional
> source,
> but that it actually gets built as part of the opencv4 package
> itself,
> which is why opencv4-contrib is a dependency of opencv4 and not the
> other way around.
> 
> Even though this is quite unusual, it should be noted that it is not
> the first case we have: nginx modules are handled in the same way
> (see nginx-upload, nginx-dav-ext, nginx-naxsi, nginx-modsecurity).
> 
> Thanks!
> 
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

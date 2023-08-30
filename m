Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E47C83F15
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 11:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E4A58201E;
	Wed, 30 Aug 2023 11:24:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E4A58201E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khHi_60BunCD; Wed, 30 Aug 2023 11:24:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA1FB82015;
	Wed, 30 Aug 2023 11:24:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA1FB82015
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D2D71BF42D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13D5361019
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 11:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13D5361019
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JVVsNrfcQMjJ for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 11:24:43 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C689261199
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 11:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C689261199
Received: from Exchange2013.PRIMES.local ([80.154.17.251]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MPosX-1qNN7b1kqB-00Mvzj for <buildroot@buildroot.org>; Wed, 30 Aug 2023
 13:19:36 +0200
Received: from EXCHANGE2013.PRIMES.local ([fe80::d454:fe18:ff77:97c3]) by
 Exchange2013.PRIMES.local ([fe80::d454:fe18:ff77:97c3%16]) with mapi id
 14.03.0513.000; Wed, 30 Aug 2023 13:19:36 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Camera Driver doesn't provide 60 FPS
Thread-Index: AdnbMOsOrA4VE2PTRJ22mLyPyrI/TQ==
Date: Wed, 30 Aug 2023 11:19:35 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC8DBFD8D6@Exchange2013.PRIMES.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.177]
MIME-Version: 1.0
X-Provags-ID: V03:K1:GgFVThm//FhbTP7NmI0tTKIf8RoACY3+Z5FAXM1+22UEcbu71lA
 nPTGwUoWDBNCuRe/h5LidMVs6S/I7kfnLnuFB/7H7MWvlAN20xp/DshTfL422cH7XkiLBqP
 wtNaVowFiQ/ISexWMXHP/WkWjGxZZWM5Ke+LsWgBUE3sF06mAXRNoQXAYSh+5PgriyKzg4M
 OGbcB7sGxr+a1Gu5DNKxw==
UI-OutboundReport: notjunk:1;M01:P0:FTz7iHg2lgw=;XMd+9g6KXkYISlVqXHx5rPJAK6N
 MxABI+NR0HDpo4K43sLkz0YpahgpXl5Fl0+dIAEhDYuAbV/6qF2GmT9OC4GkX52qVEz20mm0U
 +RWIxZ2C3gSx0pBHwRwxO1z4WFQUgyMvOTQ4fyOhJed4C5qzGSQx4wbWd2gMrRPtPKoYfQd3s
 hqXpOb1JYk3JMXY+vrPhhQWiTeAShcd7P625YAxP1dSMSZ5Kw/ZUJnzT+EQDNjjMxahapu845
 zG+dVO4LJGuxIFVsS8Wv93m4EQiP0AmGP05wmkN+/0qPpvuL2AF9RweFj2R/8f6a77WJumb57
 CCoDM+BPL+o1bIbAgXxYaQSJhSgEWGzX9pBaUNmh6HKDEZwKouXwUx1RDh79tvNNIqgkXCErm
 Bq5YF2VWd9bGJEtRhy5r0k0isRq6tq3yi+7oUjlBe0vng056mEM7tqpZV0QaWDWaMzRaoqznH
 XFNduIkNYUsViaeKTwwwyNnP+T4+jdXpxlAvcC2e/WBdEcbfgKXcuxl7pluzJZe6Zm9WBzItq
 M0d4tbyEcwhSjKollgSBliVZ9UDiVU2ED+rbn/AhVNxpCm1Xt+/qhAdFlod3e+J25TG+3dYlj
 yuz7fXkrOICPljLdpJLas+oqUfS27+EX3BK8kmPs3Ehf4uzOCbXq3PKiYctnfugxo5ZGBBnuD
 XWgj50dk7FnmdswQrW6jST5bkW7AbrLiUZA1OhA3dHQXx7xlE6CBSPfvgexVJi79EACrAgNNR
 GEIMQii22BQ4Zp0vW1a2mv1+Y9PhEWHg4K4znE0USmc1gxgJMQBF0W8VEjrPvkxgoRpfUxGIP
 tD+kq8/PE8kENFnzDVEbq7DoGXulT4JsoEqQrIWdNU2H1XwWUlB6f0PU9ITRNWxpesLIdZ80x
 bLMq8XrK/pFPFUjgtnJ9zDuaimZqcmYdavUs=
Subject: Re: [Buildroot] Camera Driver doesn't provide 60 FPS
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>> Gerd Kautzmann <G.Kautzmann@PRIMES.de> wrote:

>> I finally managed to build an linux image suporting my imx296 camera 
>> on the Raspberry-Pi 4 (32 bit) over loadable kernel modules. 
>> ... 
>> Are there any ideas about settings in the configuration concerning 
>> cameras I might have missed?

> Thomas Petazzoni <thomas.petazzoni@bootlin.com>

> This really isn't a Buildroot-related question, so I'm not sure this mailing list is the most 
> relevant place to get support on this question. It's really a RaspberryPi-specific question.

I did some tests with Yocto and the results where even worse.

But after more checking and testing it might be driver related or related to some DMA settings fort he driver.

Test programs like ' v4l2-ctl --stream-mmap ' are reporting nearly 60fps on Buildroot, Yocto and Raspi-OS.

But when it comes to applications I got differences. 

My test programm is written like:

while(1)
{
   VideoCapture();
   DoSomething();
}

On Raspi-OS  I got 60fps, on Buildroot it does only 30fps with DoSomething() and 60fps without.
It seems the loop has to wait for the end oft he video DMA with Buildroot, where the DMA on Raspi-OS doesn't use CPU time.

So if no one has an idea, this information might be useful for others.


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

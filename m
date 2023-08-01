Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FCB3C04A6A
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 19:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE3F340230;
	Tue,  1 Aug 2023 19:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE3F340230
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7J6iw5KMzkkl; Tue,  1 Aug 2023 19:55:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D936402B1;
	Tue,  1 Aug 2023 19:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D936402B1
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 123D41BF84C
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 19:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6398381EC1
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 19:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6398381EC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o0P3hroruBXi for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 19:55:27 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0376581387
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 19:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0376581387
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.221.49]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJE27-1q7L4i0dZr-00KhTA; Tue, 01
 Aug 2023 21:55:23 +0200
Message-ID: <e7646ced-9191-fa8d-7367-db82de226a0d@gmx.at>
Date: Tue, 1 Aug 2023 21:55:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230731201422.13543-1-dalang@gmx.at>
 <20230731235236.60ddc54a@windsurf>
 <47519c2e-9b64-68b1-79b2-21a2ddea976b@gmx.at>
 <20230801161956.00715a06@windsurf>
 <d2033d92-cb45-ccbf-b3f8-05e0fdbda360@gmx.at>
 <20230801214433.64c77f3a@windsurf>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230801214433.64c77f3a@windsurf>
X-Provags-ID: V03:K1:+8uznLki9cBcoM7tRZeyoxyR+H0veAumimYP33djSG6tV/dDsys
 LxudTcnriSb6DPdgVuFn+M5Mxetu8XQtWKc9/0phmR4Iak2sVRfkK5pLUn2PmZQ/SajGQ2l
 u+ArpfWnsbBabQDlSaNZjIJKLlnitDPhFT70yBMto/1/nSdOWo+j6XBrX8s8ihm0Kmu02Wl
 1FSEcuVuTLIBwt4hfQZrg==
UI-OutboundReport: notjunk:1;M01:P0:ZSMtFeW9JcE=;ec2ADhTcB4b2yRBVLMTlnIhCgwh
 0Tf/EdlPx3mI468qYzXR1W66zdUtAtMefDYFcs5reRi3BpeCZjSIym00qeanJJ0pxSatRZhUa
 I0I8EIxVfX/3pLaumc2Fy+uRhMufe9WM5d6NHGy83B4CDeGdca+2x/s7tNfiVmvu1BcBUe6yL
 IBOX8jHOsKmGKM14lVPHQoVnT4wz+bqxeyvKMxKKYdrq+HiNbdzjHj20R9edVZQI7bnJddCte
 mOchXt1GipD+8STF9sMAo4JmCjGZN2S1+et9v/969595eS5NZt5FoQ77F60pPxlZYvc9SA6IQ
 8HZKlex4YV/6ICOEoh4AMWotGjtDYvE0JW0TwzAX+fRtp8cSwzPYYQpOZFYpaNGsOIhmomJVH
 /5OpetfzLuNB20VJzJUF4xGtu6lqDQX1WpsmuKJ72nPSFDQMp+0rG5BtIY+ygwNytMbks1AwF
 ZN7kxVbcBvLMiBq0WTN3UhQdcYcOFwywU9UiahZT20IYlAvSGO0lzAJItQE5wZepBQ302GXDC
 8/vufvXFvHkaA1pWy8IVuFmUx9OVRB3+bj16l+QiYjsUiK6ukBteNZ07CDXTO2T7OOLRZ2eL2
 bJ5T9KLML0eoPVnGqHyrH6Ji1tKxOCZvUHLe371xwZorbLLY0esIOA7Rak2c9amcWnGo6eyuE
 Sj1NmR+iNDqsTiLoG1oiABBeS6BDIHCSHWq/zYoD8VIFHptR/I+kv3O0sleK6LI9rESHhXEHV
 6faErxu2vDWNQ1bhh6XsAbaLMaQzeEnjamRZVyWpey58Ren7GDPisrYjc1SDkarqpzysZ28nJ
 Wo8teAgB23Ev7hUlOH7hJYiC1lwgPtD9PIEgFvA+/Xm41cZaBT+C/OnWGaxg6Nwp+AmAudU4A
 2rs44+tBHVsYMXTHyl94jtjiulRGxJr4DzCcBCcAljI0Fb5uODk4wgHGB1fgdrLJ11qOMbV12
 eukaHCdHFK4E8PeuUdF3aobnYRw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1690919723; x=1691524523; i=dalang@gmx.at;
 bh=HW2JLx7OfI11s0t4WbBDmY0xvPjCRERb7gZvo19T0qA=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=aZc+f8DC2Vu4MW+HfodHcSF6W+UYyKz0X0PrqykvBZSq04sp9SE/uaTouZiee4MsmHXAqhu
 Pw2sWqzm1UBz8MSWckMjM6rEYZjYdZp+oRoNfybV+XHO3lVXTZyCoj+tAFq91TR0RfneaIpZm
 +V76dqAaHuySqV3ANYu/qO0mrKcOrRcC4wScNt5KzYWP3IUB2vBT2tyNeXCJrtOjR+QQ6zphl
 iQAxAmOtcSlFUkfvwCpRtBMMo0Wxpyf3B72lN7aiKFqTR2OpEjqS/XpEA2OC3cu3EtAlPXqOI
 I2doEt18GQQdYV0bAHzaRSvZC+mCuBEIRqKdXogTp9GmaZgzHgLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=aZc+f8DC
Subject: Re: [Buildroot] [PATCH] support/scripts/cve.py: switch to NVD JSON
 version 2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 01.08.23 21:44, Thomas Petazzoni via buildroot wrote:
> Hello Daniel,
>
> On Tue, 1 Aug 2023 16:44:12 +0200
> Daniel Lang <dalang@gmx.at> wrote:
>
>> I disabled all parts that would request information online during execution
>> to get a more predictable timing information.
>
> Sure.
>
>> To be honest I didn't check if the CPE feed is deprecated as well.
>> But looking at the feed's website (https://nvd.nist.gov/products/cpe) it
>> seems like it will be retired as well in favor of running delta updates
>> via an API (https://nvd.nist.gov/developers/products).
>>
>> The "problem" is that NVD currently tracks 1M CPEs and the API returns
>> 10k at a time.
>
> Gah. I'm not sure this API thing is really a win compared to the good
> old way of providing a database dump (JSON blob or anything similar).

For our use case it would be a lot easier, I guess on their end the API
makes thing a little more scalable.

>
>> Saving them one by one into a file won't make much sense.
>> Another idea is to put them in an array and save it as a big json file.
>> When updating one has to make sure that entries are unique.
>
> How do you know which ones to retrieve? You can request them by
> timestamp or something, to ensure your local copy has all entries,
> without having to redownload them all?

Both APIs (CVE and CPE) are every similar.
NVD allow you to either download everything or query for entries that
have been modified within a time window that you define. This way only
a subset is downloaded on subsequent runs.

>
>> I will send a separate patch once I have that part updated as well.
>
> Awesome, thanks a lot for working on this!

As the core logic/timing is the same for both, I'm thinking of moving
that part into a reusable class and send a v2 for this patch together
with the reworked CVE logic.

Therefore I will mark this patch as superseded even though the new
version is still in the works.

>
> Thomas

Regards,
Daniel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

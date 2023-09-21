Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD80CD494B
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 04:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C095B60BE7;
	Thu, 21 Sep 2023 04:09:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C095B60BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhhl9fV79P1d; Thu, 21 Sep 2023 04:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0D44460BEF;
	Thu, 21 Sep 2023 04:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0D44460BEF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 91FAC1BF34C
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 04:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5731360BEF
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 04:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5731360BEF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AKalHB1GSzhg for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 04:09:43 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B410160A68
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 04:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B410160A68
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([213.147.166.97]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Ue3-1ql81K1URV-006wpM; Thu, 21
 Sep 2023 06:09:39 +0200
Message-ID: <80570176-70c3-4eae-9df6-54242820b8e8@gmx.at>
Date: Thu, 21 Sep 2023 06:09:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230920043113.36674-2-dalang@gmx.at>
 <20230920091208.62a8b2fb@windsurf> <20230920173434.GE512384@scaer>
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <20230920173434.GE512384@scaer>
X-Provags-ID: V03:K1:ukk5hcPDMLM6Pc0YUPJ+FCuA4gvttIAc9QCZ6xTnvMEcpRCgZJM
 AeCT4Kpl2tTON2POmN61ZLyHpUT2wIASVxKfCtmkFlGbEjw5AXtROwJVYBjUNTS3qw/drzh
 Edt4N43orzJ5hDRI/2Z/VSvD1qTzSL9doO8oM7lsihh4FRNkwmeZeNeVmRs34FIgdQe+naN
 b0s5BQg9hsVLYdaKX3btQ==
UI-OutboundReport: notjunk:1;M01:P0:d1hhd3misps=;Vz+qC3H2S9S2/5WPckxIHEEzYvp
 reQA+UIXRlvxvv7L7hdNqMHxtGc1Bn+UnMhKHONpapEqnp5dxEqKGCFJePMvXlN6aFiJWATW/
 27/HQqqZ7RWfftB492g8AilkXffBPrr5uYTRZ4aV7V4rcCC4TAdY34LV5Ndz8CJz9y7ly6FDd
 NDcuXNzl8Es/KPiZHXda3A8l03xoWXgBQW8Fljs/rYZq8kZGsXQ7747K9430TyjR38SJaS/st
 6yOvwP32f0mh9UB3WwHL/23+T4Aauagbtdd8KjwHtgXXsopRTnPLZ0ahjAxFvw3MkJpmGmEQL
 XCml++uHSOk48SlgtA/MGxrd4rojFPv22hGWJFn46P7vXsL3rfhSbuTNnrWJUXustT7Cytxi9
 S9YnAderhdjEmB4DNGKVAMXvJptPsKH4ChwJC1wApN6+EIGpUqNdxj5roM2vHSYL0LxK5KEOz
 LsRYSEaHdSE/vXkQZ4e9kF9N+u05F5Y9cykU9FLIKBHXKhK4EGtnz7phddmfYLYruF5zYI034
 mpoKzKQE16l7QuHMWP9hYr+Q5wTY+HhRaF8Nykr3grDyqB5qcTEMmJqDWI+xCSFAVJHAj3Evj
 wGpDskueyQa6614rk669qop3IvmEtXxL2eWTU+1swvFPaLQNEyIC7upmq9hdiqllsDsBdK5dP
 GkRFiS4SIh29kj6CYWOOFEe9/P6L9s6nGsOuBG+sYuqDaH0oRvQngoYKnY/Ereys3lI3fzgFv
 n+wSHvYvk5C8YAWxwUHD9g0TrM3tiY89gaSifYqQjYF54WMbivXi8WacdnJjzGXGKTuSbOitT
 TOznen3fKXeWMOrWtHkMMu/7m1Qc6pX9QOY289FEUO0Cd2Vpv7KFWeWrpbgCZpw+bi9FGDwFe
 C9d48R3daL3+WGl1l+qdn5RUkiOkNi5bSzuxlMvSy1ZKS3WJzFD5IFBcHA5BFmCWzxzJfRnrl
 nWs6WaaB4BiPHhCDMW4nIAOA9A0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; s=s31663417; 
 t=1695269379; x=1695874179; i=dalang@gmx.at;
 bh=1iSKzqwCKvQB2mWRs3p4VCHRGJLXzw6HfGFKTOx0n+c=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=s+sifJnetR9BHKWc6LGb2g1ZZHB2aC/07Vf+X2ZAUe9I8mHJT9ZAGvYkOtt3KZKG/jnfHlOVGfW
 EiKAK2KI3Sjx6fCQqLAXXDUdHoPGY/XxbPQRgZgxGO8Mw9XDhtEX0bJQ66vXgr/pxMpvJqRFsbOkr
 ahyIGEIdZltJRYRYZVD218sfWWVWUdcdvj70/wIaf6/WxZN/BLmnDT+Y+THAb2tbz77k6a8K/ro5G
 W9WD8MUTLpwWfKBzpsjqnIOQaEvKxwLp185XKFo3vY6/zep4qXTU773iYqirJW1cniiP0wA7TyNMO
 c0pHlTDz7YjQK4iGJjoZxGIE8J0TgA6JVEwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=s+sifJne
Subject: Re: [Buildroot] [PATCH v2] package/bind: drop CVE-2017-3139 from
 IGNORE_CVES
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

Hey Yann, Thomas,

On 20.09.23 19:34, Yann E. MORIN wrote:
> Thomas, Daniel, All,
>
> On 2023-09-20 09:12 +0200, Thomas Petazzoni via buildroot spake thusly:
>> On Wed, 20 Sep 2023 06:31:12 +0200
>> Daniel Lang <dalang@gmx.at> wrote:
>>> As of 2021-05-14 CVE-2017-3139 is no longer listed as affecting bind, only RHEL.
>>> Signed-off-by: Daniel Lang <dalang@gmx.at>
>> This makes me think that the pkg-stats script should detect this: if a
>> package has CVE-2023-12345 in its ignore list, but CVE-2023-12345 is
>> not known to affect the package (in its current version) according to
>> the NVD database, we should flag this.

Not sure pkg-stats would be the right place as, at least in my uses of it,
I simply expect it to collect information and present it to me.
Just like it doesn't flag outdated packages, I wouldn't expect it to flag
mismatched CVEs or outdated CPEs for that matter.

>
> Ideally, we would also like that it be done in check-package, but this
> is going to be a bit more involved...

I haven't looked at check-package closely, but the actual checking should
be doable.
The problem that I see is NVD's new API, because the initial download of
all CVEs now takes ~30 minutes or so. Seeing as check-package is run on
Gitlab CI for every push, the database needs to somehow be kept between
runs to avoid re-downloading everything.

I will see if I can come up with a solution.

>
> Regards,
> Yann E. MORIN.
>

Regards
Daniel
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

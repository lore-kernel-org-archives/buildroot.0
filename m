Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DD3C4167B
	for <buildroot@archiver.kernel.org>; Sat,  9 Dec 2023 15:06:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1592F60E77;
	Sat,  9 Dec 2023 15:06:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1592F60E77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OO_qSk1PhlCf; Sat,  9 Dec 2023 15:06:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C4C60B42;
	Sat,  9 Dec 2023 15:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69C4C60B42
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 325911BF5A0
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 15:06:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 09DE740930
 for <buildroot@lists.busybox.net>; Sat,  9 Dec 2023 15:06:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09DE740930
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LloGjoUvpPWJ for <buildroot@lists.busybox.net>;
 Sat,  9 Dec 2023 15:06:48 +0000 (UTC)
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 021ED40286
 for <buildroot@buildroot.org>; Sat,  9 Dec 2023 15:06:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 021ED40286
Received: from [192.168.50.163] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Byujrt51YAPJ2ByujrtKSL; Sat, 09 Dec 2023 16:06:45 +0100
Message-ID: <801a7ae9-e6cf-40bf-8250-6a9a36b1b67c@benettiengineering.com>
Date: Sat, 9 Dec 2023 16:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
References: <20231207120704.47607-1-giulio.benetti@benettiengineering.com>
 <87lea3pgo7.fsf@48ers.dk>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <87lea3pgo7.fsf@48ers.dk>
X-CMAE-Envelope: MS4xfOZCLFOQ9QJ/WuW5uaN6Ibzo9mPAqV7vdRUaOxetc8y9qgG7Wro/b2zgRHTV6tzDsMqwBjS6H7e6UuWRePknyjHrfw9mxcRDX+ju46Jn278+UPWxJ5xD
 N5L3Rt8NtTp80ZrBcy3OBo+H5J/Ha3mFkvpOjpu1gq8Qv4LospKeQ24WxwX/cKJk0x1l5kobfZOzZT763MkhJuzb3Tbb7+5PbgsUhfZbP5pP36Y/0UA1OrES
 yy/ACjCeKq26b9EtvKhTXQ6JkEeuwjmAZIpj0IbP80bS+g/inE7Ray+m5V9M8NRl2pSoatl1q0XWfrqEkHYlUA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1702134405; bh=cA0Bsbtu3iyO9PSpBPvBeUX+cSBWENPym/9n8wn6kJY=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=WgGguJyOZ9Yq4IBps7j2/mmffO/Bj4TGO9dbvofWfMDNz1Fx9fDHgk3nJ7iiKYmGD
 DbnSB0ea4YK/fwfIgt6DUCeinfmuZzlMkJHcKZkkGguN0H+0IoRlSYkvJU4pQNO7+V
 dIX1hVXZBb2NXGiXPGI5CXyyDp50CSrSaMzdES9SescO36cfZH/BzBVysFfahThZ5i
 4yInTgKqPuzxr1c8mwl9HuZ6ErWMeqNOrOtFqCafg+yYMlRZRK56rigBVJ41NpjCYG
 3AsDWEabZJ9hAWGBLrlB3trPe/HCxZkQp60Ew09vqXrP6tEICfxpXGi16KXZE+P/Ro
 kGxL8+3JWozog==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WgGguJyO
Subject: Re: [Buildroot] [PATCH] configs/imx6ullevk_defconfig: bump Linux to
 6.6.4 and U-Boot to 2023.10
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
Cc: Fabio Estevam <festevam@gmail.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 09/12/23 15:57, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > Let's also enable NXP firmware package to let latest SDMA firmware to be
>   > loaded. To achieve this we also need to enable dynamic eudev to let it
>   > to load the firmware.
> 
> Why is that? I thought request_firmware() nowadays didn't need any help
> from user space to fetch files from /lib/firmware?
> 
> Is it because this is requested very early before the rootfs is mounted?

Exactly, if the driver is built-in Linux it's too early to search rootfs
because it's not mounted.

Of course during drivers' probe()s and all kernel calls using dma will
use ROM SDMA Firmware until SDMA Firmware is loaded from rootfs so those
calls will have worse performances.
Of course NXP Firmware can't be embedded into Linux because it's
proprietary and license doesn't allow us to do that.

Kind regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

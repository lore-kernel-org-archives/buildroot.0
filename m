Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54E3E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 20:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FC5060A99;
	Sat, 30 Sep 2023 20:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FC5060A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKF5w-BTtsX5; Sat, 30 Sep 2023 20:28:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E967360FD1;
	Sat, 30 Sep 2023 20:28:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E967360FD1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E2EE91BF3B0
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C214C415C3
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C214C415C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eRhcUR-fO8Nu for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 20:28:15 +0000 (UTC)
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74AAB4169C
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 20:28:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74AAB4169C
Received: from [192.168.50.162] ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id mgZOqGisvW2JpmgZOqBGXm; Sat, 30 Sep 2023 22:28:10 +0200
Message-ID: <8a91c32b-955d-45b2-9b17-2030a9221b48@benettiengineering.com>
Date: Sat, 30 Sep 2023 22:28:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>
References: <20230927092847.503224-1-giulio.benetti@benettiengineering.com>
 <874jjccduo.fsf@48ers.dk>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <874jjccduo.fsf@48ers.dk>
X-CMAE-Envelope: MS4xfJmro7UACjGr7Ssq1sO4m2vj+V8IR5rwXtK5E+q83rNY1ko3m3L+ttJEgr2ykxNRn4EBHVu2NrazavosAHaVkkXAtSiY8OSQe09tnfzFbYxRbSjE27bJ
 PwBeILwl21ae33H6VXUZ6pcP5eKTs38YsDHyKgcs6PSulZKei95U9yCA7+q3hzCpnIsY584L1VkBJTbk9Ag9vNoccLELnWApNZYtNgZZtDVtPj+Bp2mmMdOu
 uxkTZoDpKh1ffd5ovN0He3iu4ej+utBWTuGQ2Buv39H57WWwnMt+G+ASbg8uMIpW
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1696105690; bh=FquKAhWoLBeCQgb/CpDsuw1ZSS4waD2w9WCOqWLnFM4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=FPNQsjhMcPQDeAqikyXMihK1cXwix5hjayOCwupy6hqDNX5C6eoYxkeiEJcnyKLkW
 LsdvZJA35uyBvclznLuooCiReAc6whbPl1fQCPJDD0xe7Gdfrxz2jEghuIBuECEjPC
 Axj/SiHehKxE7/dmWhKiUPdUsr2nN8Mymt/5ElqWaVAYazqIlY6vQ7n+XPrewBRLt+
 zf3Dmo5Lx33hX3ee9Y2M2mDurKDvGX34fkEurd8g5NknZPPcvtGyNxYxcXj3zndMjS
 ttRSmVVBbWNIZUUBXIHotTRZpmcqKDtVLjNyr1LAaFwq+fm7pydpVaAB/cDARAvkTd
 /2SBjI5FuT7oQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=FPNQsjhM
Subject: Re: [Buildroot] [PATCH] package/wilc-driver: fix build failure with
 Linux 6.3+
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
Cc: Kris Bahnsen <kris@embeddedTS.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 30/09/23 09:35, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@benettiengineering.com> writes:
> 
>   > Add local patches pending upstream to fix build failure on Linux 6.3+
>   > Fixes:
>   > http://autobuild.buildroot.net/results/3b954399aa3ffab9609da1fc381f38f28bd8eb9f
> 
>   > Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>   > ---
>   >  .../wilc-driver/0006-Support-Linux-6.3.patch  | 48 +++++++++++++++++++
>   >  .../wilc-driver/0007-Support-Linux-6.4.patch  | 36 ++++++++++++++
>   >  2 files changed, 84 insertions(+)
>   >  create mode 100644 package/wilc-driver/0006-Support-Linux-6.3.patch
>   >  create mode 100644 package/wilc-driver/0007-Support-Linux-6.4.patch
> 
>   > diff --git a/package/wilc-driver/0006-Support-Linux-6.3.patch b/package/wilc-driver/0006-Support-Linux-6.3.patch
>   > new file mode 100644
>   > index 0000000000..58239b5dc9
>   > --- /dev/null
>   > +++ b/package/wilc-driver/0006-Support-Linux-6.3.patch
>   > @@ -0,0 +1,48 @@
>   > +From 1b6e5e4acfcca58094fb4bb6e2bfc0461c5b411d Mon Sep 17 00:00:00 2001
>   > +From: Giulio Benetti <giulio.benetti@benettiengineering.com>
>   > +Date: Wed, 27 Sep 2023 10:54:18 +0200
>   > +Subject: [PATCH] Support Linux 6.3
>   > +
>   > +With Linux 6.3 commit:
>   > +https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=40fc56ee608cdb20022c225ac6f1e4b7ba63f8f1
>   > +function of_get_named_gpio_flags() has been dropped but it was only a
>   > +wrapper to call of_get_named_gpio() if the flags passed was NULL and this
>   > +is the case. So let's use of_get_named_gpio() in place of
>   > +of_get_named_gpio_flags() if Linux version >= 6.3
> 
> So if of_get_named_gpio() is equivalent to of_get_named_gpio_flags(..,
> NULL), why don't we unconditionally use that instead of the version
> check?

You're right, I'm going to modifying the patch according to your
suggestion.

Thanks for reviewing!

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

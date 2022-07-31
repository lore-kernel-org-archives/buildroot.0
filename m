Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81E4C19F28
	for <buildroot@archiver.kernel.org>; Sun, 31 Jul 2022 00:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32BA7400EF;
	Sun, 31 Jul 2022 00:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32BA7400EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9T8IG3Qa5cdA; Sun, 31 Jul 2022 00:36:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AE5940498;
	Sun, 31 Jul 2022 00:35:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2AE5940498
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB2CB1BF968
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 00:35:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92F2460E52
 for <buildroot@lists.busybox.net>; Sun, 31 Jul 2022 00:35:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F2460E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYsMCiW2WNwr for <buildroot@lists.busybox.net>;
 Sun, 31 Jul 2022 00:35:56 +0000 (UTC)
X-Greylist: delayed 00:07:02 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EBB7D60B18
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp3.osuosl.org (Postfix) with ESMTP id EBB7D60B18
 for <buildroot@buildroot.org>; Sun, 31 Jul 2022 00:35:55 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.73.23])
 by Aruba Outgoing Smtp  with ESMTPSA
 id Hwp7oWVL19RZ3Hwp8oeiMw; Sun, 31 Jul 2022 02:28:50 +0200
Message-ID: <3a838cf0-9121-4069-60d4-2601b16a801c@benettiengineering.com>
Date: Sun, 31 Jul 2022 02:28:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
To: Xuanhao Shi <x-shi@ti.com>, buildroot@buildroot.org
References: <20220728164006.16652-1-x-shi@ti.com>
 <20220728164006.16652-2-x-shi@ti.com>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220728164006.16652-2-x-shi@ti.com>
X-CMAE-Envelope: MS4xfNHeugEKDg4neEI99JsiQiwiiO9gKQX3W9SSzZnBkILmbyW136jG7LEy4jreCMyRZuGsTe7jU4otK+zuSh7G+fMuoB0SKLyaok3JnABTgxsxhKXWQfmF
 QAiijJhV8NJF2LFQOFnIykAJXPMoPtsNpc8HU01wc1bDzQM3cqQsjoVOuWWb3D38gSxZ80LWyJeShl1jn+VDu1TKFrAnhdJzqUlPDA+UgEFOOS8Uwm2fjPDD
 aiwhZI/n1q0Sqpc3746iu7XIgIG9Aje5daAdgyqiGYsdIlBkLWlNMSX8pDXn+kff4lGHoOGM+fgd5akXZDoqsnvhz6tZ/YcnPdbeUC3HGLxrIkUY+OSdclc2
 MYVJDMsO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659227330; bh=0v3hDw7lZH9/7rVJViI7VhNrKYEB4bnjGa7oKZjTnms=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=ikSeN4lcxalqmK1H9zcySMXMNyk07De9l79aRfV3qVlbUJpBk0dXftJK9XC3ntmsg
 nc/9G9pZOouNGNuh1iHzgrdB+yY9JiZdQqRJHkku0lDEfoIqaX+ZPPfqcvzLcDDXhB
 /XMrmbUiYlM1jkX28BbLYb8SjHolk6VA0HnHhSbC8BLNC9Ul/zsPxwXV4mTkZwz8jl
 KXO6qnNXlGyuE9K+LaIG1TSclCsqy6Wly56s+1WAGqXkMt/fFs9xe4qeFygBHiYmoI
 QRqdD+bdsA8EZteT+MD0DWKiOAOsuAxI+k1rsUdcGeAzdFEt+3QwUzQx8fHpCVyyEQ
 5Gg6pau21FAag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=ikSeN4lc
Subject: Re: [Buildroot] [PATCH v2 1/4] package/arm-gnu-toolchain: revert to
 version 10
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Anand Gadiyar <gadiyar@ti.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Xuanhao,

On 28/07/22 18:40, Xuanhao Shi wrote:
> Revert the toolchain to version 10.x because of bug in 11.x:
> when the pre-packaged GCC was built, it could be targeting
> a newer x86_64 architecture than the processor being used.
> Confirmed fix will be implemented in the next release: >
> https://bugs.linaro.org/show_bug.cgi?id=5825#c19

have you tried any possible work-around for this ^^^ bug?
At the moment I don't see any other build failure using
gcc-arm-11.2-2022.02-x86_64-arm-none-eabi, probably because every
package that is built with it doesn't have float type in the code(I
presume).

Does the gcc bug show up while building ti-k3-image-gen or ti-k3-r5-loader?

I'd prefer to find a work-around if possible rather than downgrading
host-arm-gnu-toolchain, also because this would impact another package
that depends on it:
arm-trusted-firmware

Please let me know, maybe I can help finding a work-around for that
float ICE.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas

> Signed-off-by: Xuanhao Shi <x-shi@ti.com>
> ---
>   package/arm-gnu-toolchain/arm-gnu-toolchain.hash | 2 +-
>   package/arm-gnu-toolchain/arm-gnu-toolchain.mk   | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
> index 48b1b55c73..168d99cd45 100644
> --- a/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
> +++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.hash
> @@ -1,2 +1,2 @@
>   # Locally calculated
> -sha256 8c5acd5ae567c0100245b0556941c237369f210bceb196edfe5a2e7532c60326  gcc-arm-11.2-2022.02-x86_64-arm-none-eabi.tar.xz
> +sha256 97dbb4f019ad1650b732faffcc881689cedc14e2b7ee863d390e0a41ef16c9a3  gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2
> diff --git a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
> index 3bfd516751..87e12874ea 100644
> --- a/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
> +++ b/package/arm-gnu-toolchain/arm-gnu-toolchain.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -ARM_GNU_TOOLCHAIN_VERSION = 11.2-2022.02
> -ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(ARM_GNU_TOOLCHAIN_VERSION)/binrel/
> -ARM_GNU_TOOLCHAIN_SOURCE = gcc-arm-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-arm-none-eabi.tar.xz
> +ARM_GNU_TOOLCHAIN_VERSION = 10.3-2021.10
> +ARM_GNU_TOOLCHAIN_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-rm/$(ARM_GNU_TOOLCHAIN_VERSION)
> +ARM_GNU_TOOLCHAIN_SOURCE = gcc-arm-none-eabi-$(ARM_GNU_TOOLCHAIN_VERSION)-x86_64-linux.tar.bz2
>   ARM_GNU_TOOLCHAIN_LICENSE = GPL-3.0+
>   
>   HOST_ARM_GNU_TOOLCHAIN_INSTALL_DIR = $(HOST_DIR)/opt/gcc-arm-none-eabi

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

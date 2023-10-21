Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B727C0032E
	for <buildroot@archiver.kernel.org>; Sat, 21 Oct 2023 21:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBC73708BC;
	Sat, 21 Oct 2023 21:38:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBC73708BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okS6g3SLAAOu; Sat, 21 Oct 2023 21:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C590460BA4;
	Sat, 21 Oct 2023 21:38:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C590460BA4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AC3C11BF47F
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 21:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D92985157
 for <buildroot@lists.busybox.net>; Sat, 21 Oct 2023 21:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D92985157
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BprUl37_HWgl for <buildroot@lists.busybox.net>;
 Sat, 21 Oct 2023 21:38:06 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7343685158
 for <buildroot@buildroot.org>; Sat, 21 Oct 2023 21:38:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7343685158
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:fb1e:781c:6f9a:fbfd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4C91D5FFAF;
 Sat, 21 Oct 2023 23:38:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Oct 2023 23:38:00 +0200
Date: Sat, 21 Oct 2023 23:38:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Carlos Alberto Lopez Perez <clopez@igalia.com>
Message-ID: <20231021213800.GG2607@scaer>
References: <20231020142041.25503-1-clopez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231020142041.25503-1-clopez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1697924284;
 bh=SugOiQXUGihltz7YKxlg4ZIaHjnnWMac0E9EksBAnw8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qSfofqEN4WlpZbqBAGMnLEFhqyN0+UpdKFgxNrdfNt7LmpDFFLOX8C2oN9HQJNY0X
 hH+f321S/+N5wVU1FOdU424NF5j3qsBjc5PdVyXxnOOX/fEDCe084YX54ssCywBWmP
 WqGzYW4PcMcA4EfOb99ogT84Fpx42rgoV/cssw+EotdlKZrlV66kcc5khFzqUsxFKd
 JUcf82n1cPL1wABd9ICpxw8mRF5LMZ4WaahHWl5+kifYFnFOG1ndFUpYWl61PVqxz0
 XBGS8iCf2+2FhZBRRFikju233XEjAaHb5gbUU0CbJRc3JNKPcNgEH7SKkLRYUy1nn0
 d422kdyZzuOvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qSfofqEN
Subject: Re: [Buildroot] [PATCH 1/1] configs/raspberrypi*: stop setting
 powersave as the default CPU governor
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Carlos, All,

On 2023-10-20 15:20 +0100, Carlos Alberto Lopez Perez spake thusly:
> * The defconfigs from the RPi Kernel set `powersave` as the default
>   CPU governor, which is a bad idea as that reduces performance by
>   setting the CPU frequency to the minimum one.
> 
> * In case of a buildroot build user-space is not configured by default
>   to change the CPU governor, so `powersave` will remain the CPU
>   governor and it will slow down everything.
> 
> * I submitted a fix for those defconfigs to upstream here:
>   https://github.com/raspberrypi/linux/pull/5666
>   However, we shouldn't wait until that is accepted and backported
>   to all the stable branches (if ever is).

Unfortunately, the rpi folks have rejected this change:

    https://github.com/raspberrypi/linux/pull/5666#issuecomment-1772531097

    We're not changing it.

So, as much as I understand the situation, we're are not going to go
counter the upstream decision.

Besides, it is not proper kconfig syntax, see below.

[--SNIP--]
> diff --git a/board/raspberrypi/default-cpu-governor.fragment b/board/raspberrypi/default-cpu-governor.fragment
> new file mode 100644
> index 0000000000..e2e201d71d
> --- /dev/null
> +++ b/board/raspberrypi/default-cpu-governor.fragment
> @@ -0,0 +1,9 @@
> +# The defconfigs from the RPi Kernel set "powersave" as the default CPU governor.
> +# That is a bad idea as it reduces performance, so we unset that default option here.
> +# The option to build the powersave governor (but not as the default) is also enabled.
> +# A fix for this was sent to upstream: https://github.com/raspberrypi/linux/pull/5666
> +# However, we need to carry this option override until those defconfigs are fixed on
> +# *all* the kernel branches that we support. So that can be a long time depending
> +# on wheter the above PR gets accepted and/or backported to the stable branches.
> +CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE=n

In kconfig, a symbol is never set to 'n'; rather it is not set as a
comment, e.g."

    # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

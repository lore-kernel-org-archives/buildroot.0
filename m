Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4158AC54E68
	for <buildroot@archiver.kernel.org>; Tue, 19 Mar 2024 22:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C4C8560616;
	Tue, 19 Mar 2024 22:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id joZtah-EhAnr; Tue, 19 Mar 2024 22:27:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF20760908
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF20760908;
	Tue, 19 Mar 2024 22:27:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 591451BF28F
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 22:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 531F781F60
 for <buildroot@lists.busybox.net>; Tue, 19 Mar 2024 22:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tujOxjQ3Myq4 for <buildroot@lists.busybox.net>;
 Tue, 19 Mar 2024 22:27:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D2F2781F59
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F2781F59
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2F2781F59
 for <buildroot@buildroot.org>; Tue, 19 Mar 2024 22:27:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost ([212.114.183.115]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzBp-1rVS1d1bNZ-00Hxmr; Tue, 19
 Mar 2024 23:27:24 +0100
Date: Tue, 19 Mar 2024 23:27:23 +0100
To: Shafqat Abbas <shafqat.abbas@skyelectric.com>
Message-ID: <20240319232723.70ebf43c@gmx.net>
In-Reply-To: <CAL5xJopYY+47g9XAwr=9WDBrYBTPB4ycnh0ODy45+jNsP8WfFg@mail.gmail.com>
References: <CAL5xJopYY+47g9XAwr=9WDBrYBTPB4ycnh0ODy45+jNsP8WfFg@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:Qyn8VYxIpHGoP9Si/JxWiGc0EF92TD7ynT+s7DnbAvUETHADlKV
 +OD6OR1dHVtJ7B/mnjo8ejLcWkNBslQQhtyHG6RCy2l2dWRObJ1K1C/gyuGBxXkoWEYuZ3l
 6LeE9QJf3sdpVrcH9UIyBrtVP7f5RMAg3LlUbsXgyx1adCO7+rMpwYyDGjhJG+xj/QPRRmp
 AyN2ixsicwWYFyV5d+9uw==
UI-OutboundReport: notjunk:1;M01:P0:4DUyg7XR3mY=;ipNpGpEqyhYiV/cLtzhJvVVI+pE
 WQLxtV1O64SP2qGkzQ+9W+N0GEfSl6Hk7lly6xRPKNPZhEyaN7fCKCvmKW+AIFP811JaJRjnx
 f410yEmXxa3Sz64Wu2IQGF54J6+2atzm+/FsX+kwGuGbhK77rzmc4vLu7KmS2IMmpmyDDzigD
 KmAgd5hTsGOY8lRKncgXn8hXJhhljfI34F+AG8FD8Y15EzYbqQmzHRir0Ij7rBVm2Eq1BzkTu
 g2H/oQSYXFkAwd3oscLONLzBHF33CzH3L3OJeSvv5+P7KrlAxJQXPPbmRly9WzUplDHdXcoJH
 IwzegqxkYT7Ubgg1cXyq6lCvmUGMt4Tqqd4KCd9/1DPUjjh54H8+cw1+AhfF3cZ5j4gktLCRL
 5OUo6GGuOX0/e+KIjvRJlyxXa3Mz6fFdLgEnVEeNCb0LZQaVE00Pu7oEGkPF2JafjbNTRvJK5
 n7NYt7Gv1iSiHfR/cwa7W5uyXfvOL2MMNTRiViwoFI+5P4Uq/yqkVMowc5s6N0UzSvMGmjueP
 GgN+WbITVdFaiIZSaoxuZ2EMuRn8tWNY3qBw1nJ+1CQ0xo/oaMID0RjzxsRXzCTEVM493k4Ai
 ZmGxZ5VcMaj/TNktRkOUKe+X+SZxw0qOOng94hIBTr9/y4fOzktsAofBqx9xK9G9aTKc/MSmI
 Ft8WSrEA7CTK6rTpmmwfwqxa6rdQjI8I2H9FAae4vr33A/GyvtIdvIy2h6xAcGtrr4/9/kN5C
 mZCII1aUQhyATAbGxw/8w+YuDNTM8F1D6UbrT5YLz3OW/KZbHACR1+NXg0UwxOUUEYxNmQDmr
 VZkXq96nYDXkpy0h+blcSYdaLDjMVdtr6djUxxgEo869o=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1710887244; x=1711492044; i=ps.report@gmx.net;
 bh=pFXtRzR+cPW+GQHS0/woqGY1prrGxGWqcDzHF6GDqhs=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:
 References;
 b=VzIsyXiRudAqoZtLx1MD0igVurvUEJzhKOD9eWhSci+OqHjsxFU7+FSQk0/txvwH
 9x88t0yeu7WrMIfszKWaFOT35Ze+476It7KiEseUTaWySnnsn0E521INpOeNt5Z7C
 kfEpl7GBrcDVsBXaTamO7HuRCo1cJ9+1HNa9eM6nPbfr2EiU4mhMCIEcjgz5hrmqA
 ux+MvMD4bp+uhbjGI+WxdxSqO7vUiJ2KfqMYsRuT7cfjcgmYEC+oauhSmGb7oyRg1
 HeqptasP94nndbo7has/mT4y3zHzz09aSh37a69kASJoH4muZKACwZD4GS+uLuXfO
 4HYep5FZbY2MRJS6gg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=VzIsyXiR
Subject: Re: [Buildroot] Information Required for Buildroot Image Issue
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 19 Mar 2024 14:18:23 +0500, Shafqat Abbas <shafqat.abbas@skyelectric.com> wrote:

> Hi,
>
> I hope you are doing well. I have been trying to compile the Linux OS for
> Raspberry Pi 4 (Compute Module / CM4) using buildroot. I have tried all the
> default configurations available for raspberry pi systems. After writing
> the image to the pi, the system boots up properly, however, it does not
> read input from the keyboard. I am facing this issue on all builds. I have
> also tried changing the board but that also resulted in the same issue.
>
> I am using the following steps to generate builds:
>
> 1. ```make raspberrypi_defconfig```
> 2. ```make```
>
> I have used this method for compiling builds for all defconfigs, including
> the following:
> 1. Build for *Raspberry Pi*
> 2. Build for *Raspberry Pi 4*
> 3. Build for *Raspberry* *Pi 4 (64 bit)*
> 4. Build for *Raspberry Pi CM4 IO*
> 5. Build for *Raspberry Pi CM4 IO (64 bit)*
>
> The keyboard does not work at all. Even the lights do not work, which shows
> that the keyboard is not connected, however the same keyboard works fine on
> other systems.
>
> So, the assumption is that the keyboard is fine, the board is fine, the RPi
> is fine, and the issue lies in the build compiled by buildroot.
>
> I kindly request the community to help me sort out this issue. Thanks a lot

See 'Bug 15910 - USB keyboard is not working by default "raspberrypicm4io_64_defconfig"'
([1]) for the same problem and different solutions...

Regards,
Peter

[1] https://bugs.busybox.net/show_bug.cgi?id=15910
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

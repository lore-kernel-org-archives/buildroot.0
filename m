Return-Path: <SRS0=aU6e=NK=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 863DCC4338F
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 13:24:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35D86113D
	for <buildroot@archiver.kernel.org>; Thu, 19 Aug 2021 13:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D35D86113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A03AF40397;
	Thu, 19 Aug 2021 13:24:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3T4Pqx1QqjLY; Thu, 19 Aug 2021 13:24:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28839407A7;
	Thu, 19 Aug 2021 13:24:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A51E21BF3CB
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 13:24:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 946DC6070E
 for <buildroot@lists.busybox.net>; Thu, 19 Aug 2021 13:24:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id juF1Saygq8pv for <buildroot@lists.busybox.net>;
 Thu, 19 Aug 2021 13:24:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00F0F60708
 for <buildroot@buildroot.org>; Thu, 19 Aug 2021 13:24:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 1896B200006;
 Thu, 19 Aug 2021 13:24:05 +0000 (UTC)
Date: Thu, 19 Aug 2021 15:24:04 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210819152404.5cf5b53e@windsurf>
In-Reply-To: <4660a41d-6111-05aa-4b82-274391cd7bd9@mind.be>
References: <20210818065730.330904074D@smtp4.osuosl.org>
 <20210818234453.03d2237a@windsurf>
 <4660a41d-6111-05aa-4b82-274391cd7bd9@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] Analysis of build results for 2021-08-17
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Herve Codina <herve.codina@bootlin.com>,
 Matthew Weber <matthew.weber@rockwellcollins.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello Arnout,

On Thu, 19 Aug 2021 11:27:27 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

>  Fixed by 93351fa0b3b8b6dd10faa9a15a7a173b92cb40a0. It's not obvious since the
> fix is actually in fontconfig, not cairo.

Ah good.

> >>    mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/2f96654c2238c115060aafc3cf10f71457c585f7 | ORPH  
> > 
> > checking alignment of Fortran type(test_mpi_handle)... configure: error: Can not determine alignment of type(test_mpi_handle) when cross-compiling
> > 
> > Gwenhael, Arnout, you are the folks who looked at Fortran stuff :-)  
> 
>  Hehe. It's not really fortran stuff, it's just cross-compilation. Probably
> needs an ac_cv setting, possibly a patch to enable it.

This stuff is built with CMake, so it's probably not an ac_cv_ variable.

> >>   riscv32    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/568f7fceebb06deb0755e8d3757c761608faeec7 |       
> > 
> > thread/qfutex_p.h:116:30: error: '__NR_futex' was not declared in this scope; did you mean '_q_futex'?
> >   116 |         int result = syscall(__NR_futex, addr, op | FUTEX_PRIVATE_FLAG, val, val2, addr2, val3);
> >       |                              ^~~~~~~~~~
> >       |                              _q_futex
> > 
> > Need to explore why __NR_futex is not available on RISC-V 32-bit and
> > what we're supposed to use instead.  
> 
>  __NR_futex64, but it's not as simple as that because you also need to make sure
> 64-bit time_t is used as an argument.

Should we disable Qt5 on RISC-V 32-bit ?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

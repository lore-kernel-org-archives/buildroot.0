Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447B9C77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 19:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEDBE41D47;
	Wed,  3 May 2023 19:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AEDBE41D47
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S2wcRyZwfGNk; Wed,  3 May 2023 19:28:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 776A5405D3;
	Wed,  3 May 2023 19:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 776A5405D3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06FF61BF31F
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 19:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1CB040577
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 19:28:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1CB040577
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KN-ay5qMASX9 for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 19:28:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6BCBB400FD
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6BCBB400FD
 for <buildroot@buildroot.org>; Wed,  3 May 2023 19:28:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7044:c88:9a1c:351c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id EEF176012C;
 Wed,  3 May 2023 21:27:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 May 2023 21:27:54 +0200
Date: Wed, 3 May 2023 21:27:54 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230503192754.GG2696@scaer>
References: <SJ0P221MB06893C8381DEF3CD9E251020A06C9@SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SJ0P221MB06893C8381DEF3CD9E251020A06C9@SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683142079;
 bh=d7q1gRjADxNAn1hsAyBofwMtiHwrD/ffirCRTYl9MKA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FKhvod4pbDoswhy4+AcZ6J98cKFLgz51aRx0V06mRrIm81tNpJ7jJQocX3vEo8lnK
 +A0/5K7FE1grosnrx3SL6vkkbXLtbf2Z3dp7OcicnMS9PqxSGZCaoKIJIoNoSvYSX1
 B7iFhXpGov8d6HgkQLb9TFoXqgCRPZU7XudycUy6ofOim5uPB5ANcqoeDBmLDjz7sg
 sEm32su0ILVC9a4x+ejMTxrciJ9pDCfBm2UVzApUdOdsnrxs/DzLKN7zCJtbH5DEu3
 32G7j8dPLo2ZBh0EIdNUl5GGsUE4JXIkr/MHiYFxsCeCVoZ+/uNJ3HZMb2TWztfClm
 2aoCqGT+S20hQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FKhvod4p
Subject: Re: [Buildroot] [PATCH] package/systemd: do not enable
 networking/time components by default
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
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@phobosdpl.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-05-03 10:52 -0400, James Knight spake thusly:
> Tweaking the configuration of systemd to not enable networking and time
> related service capabilities. The use of the system services are not
> required, especially if other packages provide a respective capability
> to a target (e.g. a target configured for chronyd will most likely not
> want to use systemd's timedate/timesync services).

Those are only default settings, they can be disabled; people using
alternate solutions can still easily disable them.

However, systemd is a critical package: we want it to work "correctly"
by default, and we anyway expect people that want to configure it to
know what they are doing.

So, yes, basically, that's why those options default to 'y': unless the
user takes explicit action to use an alternative, they provide a
sane-by-default system: network is functional, hostname is set and there
is a proper resolver, and (for machines lacking an RTC) time and date
are set on boot (with NTP is available, otherwise the systemd release
date used as a sane default).

Also, if one were to argue that those features should be disabled by
default, then all such optional features should be disabled. But then,
that means vcosole would have to default to 'n', and this would by
default generate a system where everything started on a virtual console
(e.g. tty1 on HDMI...) be killed; see fc0787e76ea2 (package/systemd: set
vconsole support option to default y).

Finally, removing the defaults means that existing defconfig files will
suddenly fail to work as previously. We want to avoid that unless there
is a very compelling reason that a breakage is acceptable, and there is
no such reason IMHO.

Regards,
Yann E. MORIN.

> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  package/systemd/Config.in | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/systemd/Config.in b/package/systemd/Config.in
> index bea717a4560f573fafbde53efb846f8be0b663c0..be1c29c2ec3772923a1164f25ce2d3fad78fd195 100644
> --- a/package/systemd/Config.in
> +++ b/package/systemd/Config.in
> @@ -256,7 +256,6 @@ comment "homed support needs a toolchain w/ threads, dynamic library, kernel hea
>  
>  config BR2_PACKAGE_SYSTEMD_HOSTNAMED
>  	bool "enable hostname daemon"
> -	default y
>  	help
>  	  systemd-hostnamed is a system service that may be used as a
>  	  mechanism to change the system's hostname.
> @@ -329,7 +328,6 @@ config BR2_PACKAGE_SYSTEMD_MACHINED
>  
>  config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
>  	bool "enable myhostname NSS plugin"
> -	default y
>  	help
>  	  nss-myhostname is a plug-in module for the GNU Name Service
>  	  Switch (NSS) functionality of the GNU C Library (glibc),
> @@ -340,7 +338,6 @@ config BR2_PACKAGE_SYSTEMD_MYHOSTNAME
>  
>  config BR2_PACKAGE_SYSTEMD_NETWORKD
>  	bool "enable network manager"
> -	default y
>  	help
>  	  systemd-networkd is a system service that manages networks.
>  	  It detects and configures network devices as they appear, as
> @@ -433,7 +430,6 @@ config BR2_PACKAGE_SYSTEMD_REPART
>  
>  config BR2_PACKAGE_SYSTEMD_RESOLVED
>  	bool "enable resolve daemon"
> -	default y
>  	help
>  	  systemd-resolved is a system service that provides network
>  	  name resolution to local applications. It implements a
> @@ -507,7 +503,6 @@ config BR2_PACKAGE_SYSTEMD_SYSUSERS
>  
>  config BR2_PACKAGE_SYSTEMD_TIMEDATED
>  	bool "enable timedate daemon"
> -	default y
>  	help
>  	  systemd-timedated is a system service that may be used as a
>  	  mechanism to change the system clock and timezone, as well
> @@ -517,7 +512,6 @@ config BR2_PACKAGE_SYSTEMD_TIMEDATED
>  
>  config BR2_PACKAGE_SYSTEMD_TIMESYNCD
>  	bool "enable timesync daemon"
> -	default y
>  	help
>  	  systemd-timesyncd is a service that may be used to
>  	  synchronize the local system clock with a Network Time
> -- 
> 2.40.1.windows.1
> 

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

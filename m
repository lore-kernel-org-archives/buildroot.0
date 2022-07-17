Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 682A3C43334
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 14:03:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0833941795;
	Sun, 17 Jul 2022 14:03:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0833941795
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YyFqFE7rsSNI; Sun, 17 Jul 2022 14:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 997134170D;
	Sun, 17 Jul 2022 14:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 997134170D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3A781BF97A
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 14:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D53760ACC
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 14:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D53760ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MBA3yumMnKZv for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 14:03:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87D9F60A6B
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87D9F60A6B
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 14:03:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9AA45780507;
 Sun, 17 Jul 2022 16:03:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 16:03:25 +0200
Date: Sun, 17 Jul 2022 16:03:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220717140325.GS2249625@scaer>
References: <20220712162816.1583040-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220712162816.1583040-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658066608;
 bh=VDzM0TLqhDNK6bYCzdUqTSwUAyzHAq6BvG2XsT+PsNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mv/pNQ+ENiUhGC1bjmfkteyaPqvflMEJhIHx0H0ESbus2SA4C9p10dltcX8bDt3Zq
 A9PeYahEEvWN9cMx44GvfeFlPuzkFe6VXCNw0bddt1+Mmzl3acIosY0ueqZW7d5Qlq
 EzWgRK+IWKc0q4kZ22itRAcv+1C1R9GJkcJgoWURe+cOkeAAkmdhcCf+1SKjDynEFX
 mxS4BNAOiu2dseUqzjoeccEQ887UXyYHejSFKD53VCoK6SMc0sHk8nHP5e9XYNQmOm
 WWeW9VfIQsMG5V1dx/wSrFzQSkCVH/AVMA+65Q/NXA6E1yY/LoSSqMT1V6Bv8uwFKB
 kiHxhJtB6qX2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mv/pNQ+E
Subject: Re: [Buildroot] [PATCH 1/1] package/unixodbc: fix build without
 threads
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-07-12 18:28 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure without threads raised since bump to
> version 2.3.11 in commit 9b4914cc4ccdc30e239cd3e2e0e61b8ca5d24bab and
> https://github.com/lurcher/unixODBC/commit/6df155fb213896b9507b421c58856e4376647ae1:
> 
> /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_timedwait'
> /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_signal'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/131eafaddfc956c7d54c81ed72a31baf28ab1ab6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...ivermanager.h-fix-build-without-thre.patch | 34 +++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100644 package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
> 
> diff --git a/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch b/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
> new file mode 100644
> index 0000000000..9d54bbf5ef
> --- /dev/null
> +++ b/package/unixodbc/0001-DriverManager-drivermanager.h-fix-build-without-thre.patch
> @@ -0,0 +1,34 @@
> +From 119cab666646cd9210439d4696a4bfa18343a2c6 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 12 Jul 2022 00:29:28 +0200
> +Subject: [PATCH] DriverManager/drivermanager.h: fix build without threads
> +
> +Fix the following build failure without threads raised since version
> +2.3.10 and commit 6df155fb213896b9507b421c58856e4376647ae1:
> +
> +/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_timedwait'
> +/home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabihf/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabihf/bin/ld: ../DriverManager/.libs/libodbc.so: undefined reference to `pool_signal'
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/131eafaddfc956c7d54c81ed72a31baf28ab1ab6
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Retrieved from:
> +https://github.com/lurcher/unixODBC/commit/119cab666646cd9210439d4696a4bfa18343a2c6]
> +---
> + DriverManager/drivermanager.h | 2 ++
> + 1 file changed, 2 insertions(+)
> +
> +diff --git a/DriverManager/drivermanager.h b/DriverManager/drivermanager.h
> +index 9528fae..abd324b 100644
> +--- a/DriverManager/drivermanager.h
> ++++ b/DriverManager/drivermanager.h
> +@@ -808,6 +808,8 @@ void pool_signal();
> + 
> + #define thread_protect(a,b)
> + #define thread_release(a,b)
> ++#define pool_timedwait(a)
> ++#define pool_signal()
> + 
> + #endif
> + 
> -- 
> 2.35.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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

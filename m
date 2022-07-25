Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DCFC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 08:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69A73610CC;
	Mon, 25 Jul 2022 08:39:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69A73610CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id X3KYysv1Q7x7; Mon, 25 Jul 2022 08:39:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AC6A60B7D;
	Mon, 25 Jul 2022 08:39:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3AC6A60B7D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D2711BF2F6
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83DE8415B3
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 08:39:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83DE8415B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vx1j15BfYYLZ for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 08:39:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C422F415A9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C422F415A9
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 08:39:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9102:8e95:18fd:a25a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6209719F734;
 Mon, 25 Jul 2022 10:38:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 25 Jul 2022 10:38:55 +0200
Date: Mon, 25 Jul 2022 10:38:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@paral.in>
Message-ID: <20220725083855.GA3168@scaer>
References: <20220725002414.704892-1-christian@paral.in>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220725002414.704892-1-christian@paral.in>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658738339;
 bh=sUDW2S4VYNGeirsj0MAJboW5P5NUWwwDz9zJrE25TIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YKC/JTAfNwFljSwudYCq+Fqp6iYgnLPKXk0jdv3E9Vrxp92XJ10r5DYhX71qcMbbC
 oJIbt4Qzu0TShCJpES4YCQDe0D2JHkqccXgV8QP+13EmBKHSwM+dVSTGuFihYuZTHc
 A1WiNiZprzXuc/gbaZ1GRrBKPTC4htHtIrgZEW1KKdh2E3xeVMRxgjKHoD4Ego5Wcu
 iFTSm/P5WiuejgGXYRMnWB3ja7yz88leIs79Yi6Q3MquR5OyYqq14J0jLHDWZDSbwG
 CCdQAWA8eLuzNz8sDqGcvZCpVdNME+JhGkdrcaEHrp+bwW5X8dVJsEyIOsgsG2SbQD
 2YRnIa/LDcydw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YKC/JTAf
Subject: Re: [Buildroot] [PATCH v4 1/1] package/runc: add host package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Christian, All,

On 2022-07-24 17:24 -0700, Christian Stewart spake thusly:
> Adds support for building runc as a host package.
> 
> The bin name and gomod have to be specified as the pkg-golang infrastructure
> assumes the bin name will be "host-runc" on default.

Is that still true, even after 8539378771f (package/pkg-golang: default
to rawname to install binaries) ?

Regards,
Yann E. MORIN.

> Signed-off-by: Christian Stewart <christian@paral.in>
> 
> ---
> 
> changes v3 -> v4:
> 
>  - drop unnecessary GOMOD line
>  - remove seccomp and apparmor tags for host package
>  - thanks Thomas for the review.
> 
> Signed-off-by: Christian Stewart <christian@paral.in>
> ---
>  package/Config.in.host      | 1 +
>  package/runc/Config.in.host | 8 ++++++++
>  package/runc/runc.mk        | 6 ++++++
>  3 files changed, 15 insertions(+)
>  create mode 100644 package/runc/Config.in.host
> 
> diff --git a/package/Config.in.host b/package/Config.in.host
> index 71f2a9311c..8078a8304d 100644
> --- a/package/Config.in.host
> +++ b/package/Config.in.host
> @@ -82,6 +82,7 @@ menu "Host utilities"
>  	source "package/raspberrypi-usbboot/Config.in.host"
>  	source "package/rauc/Config.in.host"
>  	source "package/riscv-isa-sim/Config.in.host"
> +	source "package/runc/Config.in.host"
>  	source "package/rustc/Config.in.host"
>  	source "package/s6-rc/Config.in.host"
>  	source "package/sam-ba/Config.in.host"
> diff --git a/package/runc/Config.in.host b/package/runc/Config.in.host
> new file mode 100644
> index 0000000000..ce0dd518a6
> --- /dev/null
> +++ b/package/runc/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_RUNC
> +	bool "host runc"
> +	depends on BR2_PACKAGE_HOST_GO_HOST_ARCH_SUPPORTS
> +	help
> +	  runC is a CLI tool for spawning and running containers
> +	  according to the OCP specification.
> +
> +	  https://github.com/opencontainers/runc
> diff --git a/package/runc/runc.mk b/package/runc/runc.mk
> index 5faa8b683d..8ccff13a3e 100644
> --- a/package/runc/runc.mk
> +++ b/package/runc/runc.mk
> @@ -23,4 +23,10 @@ RUNC_TAGS += seccomp
>  RUNC_DEPENDENCIES += libseccomp host-pkgconf
>  endif
>  
> +HOST_RUNC_BIN_NAME = runc
> +HOST_RUNC_LDFLAGS = $(RUNC_LDFLAGS)
> +HOST_RUNC_TAGS = cgo static_build
> +HOST_RUNC_INSTALL_BINS = $(HOST_RUNC_BIN_NAME)
> +
>  $(eval $(golang-package))
> +$(eval $(host-golang-package))
> -- 
> 2.35.1
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

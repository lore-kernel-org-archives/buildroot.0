Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54A4C77B71
	for <buildroot@archiver.kernel.org>; Fri, 14 Apr 2023 20:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DBF6408EA;
	Fri, 14 Apr 2023 20:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DBF6408EA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x2wn7kMD9q8U; Fri, 14 Apr 2023 20:32:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87518408B8;
	Fri, 14 Apr 2023 20:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87518408B8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03A481BF3C6
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 20:32:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D873160E17
 for <buildroot@lists.busybox.net>; Fri, 14 Apr 2023 20:32:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D873160E17
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y09HTkFukXl3 for <buildroot@lists.busybox.net>;
 Fri, 14 Apr 2023 20:32:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D4C9F60D4C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D4C9F60D4C
 for <buildroot@buildroot.org>; Fri, 14 Apr 2023 20:32:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 180C35FF9A;
 Fri, 14 Apr 2023 22:32:09 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Apr 2023 22:32:09 +0200
Date: Fri, 14 Apr 2023 22:32:09 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Witold Lipieta <witold.lipieta@thaumatec.com>
Message-ID: <20230414203209.GA2819@scaer>
References: <20230413092055.3438333-1-witold.lipieta@thaumatec.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230413092055.3438333-1-witold.lipieta@thaumatec.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681504334;
 bh=cto3espI65oY2klhCc5UkaN2vm1EsbI7kwRb5HMR7oE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YifIURx76+uMckDbDpCPW0QJep5gY3DSNpwFzjbcSFUPRbrdHL5qiewyhbMujy5ot
 NoRXTv+rVMgnffQ0Jnh7lBtkRDrK19BLIs171o4odElBE/fiFDVdUfiBx7CIQSxVi8
 Tk5NAYt+TEgRLAuqukM9TCAWQF3VXuHcCsnUQEVa2BclVjxnDmQIYpzdIGlxCvxaTO
 UsgvrRUMIikYcYKLAXT9JpLP1UYao8ibVHHQfYGCZpFD5h6ZAHfiaZr37iMXvsGoub
 R+qv+1jKKouomFuHKt7O+tWFbtRPm+sL2bcRDDuVxz4hukVm4r8GhyoYtaPRiJ0j4C
 MQ81LLxSRwJ5g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YifIURx7
Subject: Re: [Buildroot] [PATCH 1/1] package/python-evdev: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Witold, All,

On 2023-04-13 11:20 +0200, Witold Lipieta spake thusly:
> evdev 1.6.1 https://pypi.org/project/evdev/
> 
> Signed-off-by: Witold Lipieta <witold.lipieta@thaumatec.com>
> ---
[--SNIP--]
> diff --git a/package/python-evdev/Config.in b/package/python-evdev/Config.in
> new file mode 100644
> index 0000000000..f6c021e694
> --- /dev/null
> +++ b/package/python-evdev/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_EVDEV
> +	bool "python-evdev"
> +	select BR2_PACKAGE_LIBEVDEV # runtime

I could not find where that dependency is used in the code. Can you
double check, please?

However, it uses input-event-codes.h, which was only included in linux
4.4, so it should depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4.

[--SNIP--]
> diff --git a/package/python-evdev/python-evdev.mk b/package/python-evdev/python-evdev.mk
> new file mode 100644
> index 0000000000..33fe071916
> --- /dev/null
> +++ b/package/python-evdev/python-evdev.mk
> @@ -0,0 +1,18 @@
> +################################################################################
> +#
> +# python-evdev
> +#
> +################################################################################
> +
> +PYTHON_EVDEV_VERSION = 1.6.1
> +PYTHON_EVDEV_SOURCE = evdev-$(PYTHON_EVDEV_VERSION).tar.gz
> +PYTHON_EVDEV_SITE = https://files.pythonhosted.org/packages/05/50/629b011a7f61cb2fca754ea8631575784bf8605a1ec4d6970a010bc54e2b
> +PYTHON_EVDEV_SETUP_TYPE = setuptools
> +PYTHON_EVDEV_LICENSE = Revised BSD License
> +PYTHON_EVDEV_LICENSE_FILES = LICENSE
> +
> +PYTHON_EVDEV_BUILD_OPTS = \
> +	build_ecodes \
> +	--evdev-headers $(STAGING_DIR)/usr/include/linux/input.h:$(STAGING_DIR)/usr/include/linux/input-event-codes.h

setup.py also lists /usr/include/linux/uinput.h, so maybe we want to
also include that?

Regards,
Yann E. MORIN.

> +$(eval $(python-package))
> -- 
> 2.34.1
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

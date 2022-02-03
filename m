Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A74EEC433EF
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23A348144A;
	Thu,  3 Feb 2022 20:23:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S_mZx_MHopH0; Thu,  3 Feb 2022 20:23:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6793F8142A;
	Thu,  3 Feb 2022 20:23:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C64E51BF38D
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B03C56061B
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 40qhUl7on5ls for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:23:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 126EA605EA
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1643919809;
 bh=zkoQk+XC2e7RgTWfmmA0o0C8x/i9eMcbDe2TTR5HA9U=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ZXNOlLvt7JzIjPMEhm2E44KXznHFGf59Q6twBQ9/jrxMSSdPHQUBghjMNj/Eg5Syj
 OiwcbXqhq4OcwCbAFGPHEiUd6MoCDzks7woC61CHdEvhPOfssREFAC1N2QyrpGA20D
 S9snqnk3TITr8l0hWJDNNz1BzNwExAo5yuGETLgg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.201]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1McH9Y-1mdM1F12hY-00cfQX; Thu, 03
 Feb 2022 21:23:29 +0100
Date: Thu, 3 Feb 2022 21:23:27 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220203212328.264bc948@gmx.net>
In-Reply-To: <20220202220538.2858380-1-giulio.benetti@benettiengineering.com>
References: <412baee3-b818-521a-99bf-ee868d3e1be2@benettiengineering.com>
 <20220202220538.2858380-1-giulio.benetti@benettiengineering.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:4WOQHUGP0baNbZ0a87c7lMSCh/JWO2HBhNzuKKdppQrPX99MQ5M
 jcU0l05p1lcgHSWgtc7MQIwapd1YoCwD1UlGJISzpAdp94Tf1cwepOXJjsvi1rnhaJhQEv0
 3QAZAgNkbUmpV3u+AbUCsA6H9OwmOswgS36tV8P4mXSwx3Uc0hHwOvczFXDLQb6Y65sO5yc
 jUJbcZ/SIWSOvQt9+p+og==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CxDwtvkUfY0=:NPBaqq8VcGKYPFwHaUDhDx
 BqcqmGXQVr+lhKOuqFRj6l9vhEv3m1n9Cab7hQoA/sRdO7tIwjfIPeL227y3O1wXeep4kQCLa
 thkAfxrSojKhF5calgQBx8UT+S8HP8qLDIrQBtO4oibW9G/oQwTG5P3uQEeIMTOlXpYMttWUl
 TuXaSYXSaJI3HP5f2vY6DxMFWHS9bTFtDzBDWlqJOh2L2kHNrE9QsB7MuExg0TpG26eZUW5UH
 B3sevYV7dJHKSr1Z1KKADU00QMJFCobXMeMqxSkQniXZ/ZUTy8V/e/OyXYEKO1DHqn7SSuH1L
 IfjYYVOrlBp7pT3cO4jSkCucu5P38bIlURYXUFR+9F1Nvh0uFToS7aZhVpSrTx+XZYrQKrHoQ
 d1LQJ4fM4bYyLkSP0IX7sLQvxZsdwzqW3Z0zIb+WBtpH8xRNtrckLlyPYxn5cxU/5vnpO91wL
 txWaaClmCs42D3/KFuOe8vVdBwQSwGmgUP2IYWn5UuOY6dl0UC4tNmkjGJYS9YAFavZsnp+07
 styMqU7r1M6IFIrf7xgDsMw6pWbpPzP09n5vIC9wWJ1/xFyjuFCI5svuFjl0k4uZ8XbYgyqcT
 c8Qux4jxdsig8l3JST0Sodh2VicO2y98EXLunioqQb7FR6EkPj+PUL/Td+Y2hyfgJdahC3+ph
 0oWsA7p2tZLh2uVCsDFP68PJ8Ymsna/uZZfMTTHSgIlu5Jadhuv/N0FcIpEYAC/nyP40cX0Es
 h2ayo+hws61SbvphnaxasxCbjkakeeOf9E/iP9sjUC42SoRtnAwHxNwNJoNxNArxuwGb9gQXj
 wduuwbswhiSSIVjJaxo2d9h3kaPTjK/R15/D21O0g/3Aau2H6w2JlKDBmsqb3otlBDwfinNSD
 oK8+7L0l6ZMgAjgLAyKJ+jkd51B8ADspkurCiqcmgGOusyFlCQDD2WuhtLXzUKQ2KvuaVOlZ0
 e1IvHdW2Wb8smUk6+NQwm2+h2g/0PGN2uMXlSd3CbJqXnEoEl4vFzE2qqsksYhWkP3l6u5KHK
 VnSHHoZt0/A0Yd0ZKW7sTnrI16t4kPNDHMAYBSRf1DFyxaXmjVxGkjpK6DJxKJDakGrH4uREH
 nzfFIS2atfD9AA=
Subject: Re: [Buildroot] [PATCH] package/util-linux: improve host build
 failure fix
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Giulio,

On Wed,  2 Feb 2022 23:05:38 +0100, Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> As suggested by Peter Seiderer package util-linux doesn't need raw support
> when built for host, so let's remove:
> HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> in favor of:
> HOST_UTIL_LINUX_CONF_OPTS += --disable-raw
> This is a better approach than my commit:
> https://git.buildroot.net/buildroot/commit/?id=d895bd973b35fde10d3dd7db530d9e4782926497
>
> Suggested-by: Peter Seiderer <ps.report@gmx.net>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Tested with registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314:

- reverted 'package/util-linux: fix host build failure' (d895bd973b35fde10d3dd7db530d9e4782926497)
  --> build fails with: No rule to make target 'disk-utils/raw.8'

- build with 'package/util-linux: fix host build failure' (d895bd973b35fde10d3dd7db530d9e4782926497)
  --> build o.k.

- build with this additional patch
  --> build o.k.

Tested-by: Peter Seiderer <ps.report@gmx.net>


> ---
>  package/util-linux/util-linux.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 5a4ff64d01..f3297257cf 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -41,7 +41,6 @@ define UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>  	touch $(@D)/disk-utils/raw.8
>  endef
>  UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
> -HOST_UTIL_LINUX_POST_PATCH_HOOKS += UTIL_LINUX_FIX_DISK_UTILS_COMPILE
>
>  HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>

The line above reads:

	# We also don't want the host-python dependency

> @@ -49,7 +48,8 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
>  HOST_UTIL_LINUX_CONF_OPTS = \
>  	--without-systemd \
>  	--with-systemdsystemunitdir=no \
> -	--without-python
> +	--without-python \
> +	--disable-raw

So I would move the 'disable-raw' down to line 196ff (or below to an
extra 'HOST_UTIL_LINUX_CONF_OPTS +=' section with comment why...

With this change you can add my:

Reviewed-by: Peter Seiderer <ps.report@gmx.net>

Regards,
Peter

>
>  ifneq ($(BR2_PACKAGE_UTIL_LINUX_BINARIES)$(BR2_PACKAGE_UTIL_LINUX_CRAMFS)$(BR2_PACKAGE_UTIL_LINUX_FSCK)$(BR2_PACKAGE_UTIL_LINUX_LOSETUP),)
>  UTIL_LINUX_SELINUX_MODULES = fstools

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB0B0C7EE2E
	for <buildroot@archiver.kernel.org>; Mon, 12 Jun 2023 15:43:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59ACB81779;
	Mon, 12 Jun 2023 15:43:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59ACB81779
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SK1uAAkg0ELE; Mon, 12 Jun 2023 15:43:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B39A881746;
	Mon, 12 Jun 2023 15:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B39A881746
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F157E1BF398
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:43:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D821060F16
 for <buildroot@lists.busybox.net>; Mon, 12 Jun 2023 15:43:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D821060F16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3V7L17tPp-Eu for <buildroot@lists.busybox.net>;
 Mon, 12 Jun 2023 15:43:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D7160742
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1D7160742
 for <buildroot@uclibc.org>; Mon, 12 Jun 2023 15:43:41 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1q8jhi-0005zT-UG
 for buildroot@uclibc.org; Mon, 12 Jun 2023 17:43:38 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 12 Jun 2023 17:43:09 +0200
Message-ID: <pan$38e8e$d0dad476$6582559c$78bfa8d4@ID-313208.user.individual.net>
References: <20230319181100.23180-1-fontaine.fabrice__21025.5940839247$1679249495$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/2] package/xlib_libXpresent: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sun, 19 Mar 2023 19:10:59 +0100 schrieb Fabrice Fontaine:

> +++ b/package/x11r7/xlib_libXpresent/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_XLIB_LIBXPRESENT
> +	bool "libXpresent"
> +	select BR2_PACKAGE_XLIB_LIBXEXT
> +	select BR2_PACKAGE_XLIB_LIBXFIXES
> +	select BR2_PACKAGE_XLIB_XTRANS
> +	select BR2_PACKAGE_XORGPROTO

Hi Fabrice,

this package also depends on xlib_libXrandr:

configure: error: Package requirements (xproto presentproto >= 1.0 
xextproto x11 xext xfixes xrandr) were not met:

Package 'xrandr', required by 'virtual:world', not found

https://gitlab.freedesktop.org/xorg/lib/libxpresent/-/blob/master/
configure.ac#L61

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

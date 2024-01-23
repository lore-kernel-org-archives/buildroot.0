Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA739C47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 20:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B3F8405D8;
	Tue, 23 Jan 2024 20:36:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B3F8405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RxUYRaFomMUF; Tue, 23 Jan 2024 20:36:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8737240642;
	Tue, 23 Jan 2024 20:36:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8737240642
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 49FF31BF852
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 20:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 214AB405D8
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 20:36:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 214AB405D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKycQR-Fs7z0 for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 20:36:45 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3FDC40445
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 20:36:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3FDC40445
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6B3B613F8C8;
 Tue, 23 Jan 2024 21:36:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Jan 2024 21:36:40 +0100
Date: Tue, 23 Jan 2024 21:36:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZbAjWL734XjjiKi1@landeda>
References: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
 <20240123190035.904936-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123190035.904936-2-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706042202;
 bh=mibW3R1gAJP+6SYz38HXm4KP0INy7WvllU00La9bEBM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h0R8rHYXzQo9SC/5XJNFGnjGjgbStqEKqvhagHIHYq4KWl1D69EX/s0uxHlOQLCm4
 DIUZYIjfVjvJOFdogZK7d19Vmn9WMNmNs8QT5VlR70qzSTaqfa0qSpg0L3afSs89LA
 7VJTyJ9QGmlSj4QrWXa+chFbK8hvRnim/uVe20bPmMLxN40HT+waiI9oeXmR83uzhz
 nP/xepyPDilxP/r2UCsxXK6EMWAUmsHVVg2g+Lhm4e2tUgKTjm2pprl+ue9P70BfLP
 RT72P7BnIYFRDz7V3sNQzCj+Mq9fmxaZY/oMUvkPNmujsZ6haRGMV0+Bs48jnCVFY9
 scbXg0tQk0zUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h0R8rHYX
Subject: Re: [Buildroot] [PATCH 1/3] package/flutter-pi: remove libgles
 requirement for gstreamer audio plugin
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2024-01-23 12:00 -0700, Adam Duskett spake thusly:
> package/flutter-pi: remove libgles requirement for gstreamer audio plugin

Duplicate commit title.

> I erroneously added the dependency BR2_PACKAGE_HAS_LIBGLES for the gstreamer

No 'I' in commit logs; instead, we use third-person passive tense. I
reworded the commit log.

> audio player plugin, and the CMakeLists.txt file does not check for gles2 when
> the plugin is selected. This error was likely due to a copy/paste mistake.
> Remove the requirement.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flutter-pi/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
> index bb0e3702c1..95b5525806 100644
> --- a/package/flutter-pi/Config.in
> +++ b/package/flutter-pi/Config.in
> @@ -47,7 +47,6 @@ config BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN
>  
>  config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
>  	bool "gstreamer audio player"
> -	depends on BR2_PACKAGE_HAS_LIBGLES
>  	select BR2_PACKAGE_GSTREAMER1
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
> -- 
> 2.43.0
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

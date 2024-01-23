Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1659C47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 20:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57DD5400C5;
	Tue, 23 Jan 2024 20:47:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57DD5400C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WfzQHvOXAoVJ; Tue, 23 Jan 2024 20:47:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3914240445;
	Tue, 23 Jan 2024 20:47:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3914240445
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B17D1BF852
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 20:47:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E936F821C5
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 20:47:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E936F821C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5q5gdSEOAQme for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 20:47:23 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9837C821B9
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 20:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9837C821B9
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8C91C13F86A;
 Tue, 23 Jan 2024 21:47:18 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Jan 2024 21:47:18 +0100
Date: Tue, 23 Jan 2024 21:47:18 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZbAl1rLBq6tEC2b5@landeda>
References: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
 <20240123190035.904936-4-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123190035.904936-4-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706042840;
 bh=4KBGkv0yQicj5lJfDSk3DQ1MQwcdY+NF4OFdn8IdkcI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fjeeGXcXU4wtxMStoyxoq5FYfmcn7AoQDjBycVRLzk7b6AznTC3yJIQv9aVZ55X+p
 VvR2DJ2zTO98J2SOan5l13Dh2/vs3mSXAfSVmmj4x/XrOC5DoUGF4qJvNVW6U2H0HK
 JRbboUnZE+grxn1hcHSo6Kecf2nmc1XlMPxIBmEUrsG/xU6HG6aQ6YSKY6N+o6Xpef
 5pjJ+MKaCH36JMG0zRd4ijHTzIu4dovKjacQ2EmygWJbdYnVuq4/UPKNbuiJdjBKYP
 kA4UtvlHOxZcvDRaVd/RqidN0DgqvvNW16q5UQQ28xNn4ULC7Czlm00Bsz4EKCEiZ8
 8guHANTwPiKmA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fjeeGXcX
Subject: Re: [Buildroot] [PATCH 3/3] package/flutter-pi: audio player plugin
 is not compatible with pulseaudio
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

Adam, All,

On 2024-01-23 12:00 -0700, Adam Duskett spake thusly:
> According to the README.md file:
> ```
> [The] plugin was tested to work with ALSA and `pulseaudio` might prevent the
>       plugin from playing audio correctly:
>     - Hence please make sure you delete `pulseaudio` package from your system.
> ```
> 
> And from plugins/audioplayers/README.md:
> ```
> ...
> - Make sure `pulseaudio` is deleted
> 
> Please note that plugin was not tested with `pulseaudio` and it is up to you
> to make gstreamer work via it. As `pulseaudio` takes full control over audio
> devices, `ALSA` will no longer function correctly with `pulseaudio` installed
> ```
> 
> As such, it is best to ensure the pulseaudio package is not selected to
> ensure the audio player plugin works out of the box.

I am not sure about this.

First, it is possible, albeit a bit kludgy, to make an ALSA application
work with P.A:

    https://www.freedesktop.org/wiki/Software/PulseAudio/FAQ/#canigetossandalsaapplicationstoworkwithpulseaudio

    Yes, you can! OSS applications are handled using the padsp utility
    shipped with PulseAudio:

        padsp myapp <arguments to myapp>

It is a LD_PRELOAD-based wrapper, hence it might be a bit kludgy, but it
is worth a try.

Second, it is possible for PA to not be used as a systemd daemon; that's
even the default, and Buildroot has an option for that:
    BR2_PACKAGE_PULSEAUDIO_DAEMON

In such a case, it is possible that a system is configured to run an
application or another, and thus it is a rruntime configuration that
ensures that the ALSA-based app and the PA-based one are nt running at
the same time.

Also, as you quoted, the plugin is "not tested with `pulseaudio` and it
is up to you to make gstreamer work via it". Untested does not mean
non-functional.

So, I don't see a reason to do that exclusion.

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-pi/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
> index 223e29749c..379b1da45b 100644
> --- a/package/flutter-pi/Config.in
> +++ b/package/flutter-pi/Config.in
> @@ -47,6 +47,7 @@ config BR2_PACKAGE_FLUTTER_PI_CHARSET_CONVERTER_PLUGIN
>  
>  config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
>  	bool "gstreamer audio player"
> +	depends on !BR2_PACKAGE_PULSEAUDIO
>  	select BR2_PACKAGE_GSTREAMER1
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA
> @@ -57,6 +58,9 @@ config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
>  	  Include the gstreamer based audio plugins in the finished
>  	  binary.
>  
> +comment "gstreamer audio player plugin is not compatible with pulseaudio"
> +	depends on BR2_PACKAGE_PULSEAUDIO
> +
>  config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_VIDEO_PLAYER_PLUGIN
>  	bool "gstreamer video player"
>  	depends on BR2_PACKAGE_HAS_LIBGLES
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

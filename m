Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C28DC47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 20:37:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D927540445;
	Tue, 23 Jan 2024 20:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D927540445
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ujLGBzSusDAu; Tue, 23 Jan 2024 20:37:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1B06405D8;
	Tue, 23 Jan 2024 20:37:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1B06405D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0BA8B1BF852
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 20:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D80BE81E7B
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 20:37:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D80BE81E7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kJQBNVqQmLoL for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 20:37:17 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00CB681E57
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 20:37:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00CB681E57
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0BEAB13F81D;
 Tue, 23 Jan 2024 21:37:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 23 Jan 2024 21:37:12 +0100
Date: Tue, 23 Jan 2024 21:37:12 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZbAjeAgNMGIp03ea@landeda>
References: <20240123190035.904936-1-adam.duskett@amarulasolutions.com>
 <20240123190035.904936-3-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240123190035.904936-3-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1706042235;
 bh=nhccGWWWF78K/amCLpepqU4JiYNHtKjMdb5q3jWrvgQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u/RLUwF4CFcYf+Id8iDVQZTA5DrfE0mXR0l+vOqTeUbnTxOlxvRDNzB2Wg40gvCvh
 HMhSOF+gHdaLG5sHHkbXA8S0LiuEZLU6ylWNaLe90rrI3IzQCQqaNCkFSj0judQL7O
 lIQbQvqgXJW4rfF1qOoPHZ80EMbBdwNDRIPJzhkasuAK1/1tTfS4rJLwPTrmsbt+b5
 sA12ZzX7CLnsl1iaZCFOM0nHWRYHfwHpXOqxJAyvv5Mr9Nc3eu2+mgEjgG5c6a6l8v
 gTd+BnLe8OvW8G9GtASIEAmy4uTWaFPklRxvifc2I2hhmZLCaTTx9eQbyuzIHsrzBk
 OLV/DwgPGy4MQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=u/RLUwF4
Subject: Re: [Buildroot] [PATCH 2/3] package/flutter-pi: Fix help text for
 gstreamer audio player
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
> The help text is currently copy and pasted from the gstreamer video
> player plugin help text. Change it to reflect the text from the
> CMakeLists.txt file.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flutter-pi/Config.in | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/package/flutter-pi/Config.in b/package/flutter-pi/Config.in
> index 95b5525806..223e29749c 100644
> --- a/package/flutter-pi/Config.in
> +++ b/package/flutter-pi/Config.in
> @@ -54,9 +54,8 @@ config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_AUDIO_PLAYER_PLUGIN
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIORESAMPLE
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
>  	help
> -	  Include the gstreamer based video plugins in the finished
> -	  binary. Allows for more stable, hardware accelerated
> -	  video playback in flutter using gstreamer.
> +	  Include the gstreamer based audio plugins in the finished
> +	  binary.
>  
>  config BR2_PACKAGE_FLUTTER_PI_GSTREAMER_VIDEO_PLAYER_PLUGIN
>  	bool "gstreamer video player"
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32131C001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 19:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AED784018A;
	Sun,  6 Aug 2023 19:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AED784018A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1isgjQ2DAp2; Sun,  6 Aug 2023 19:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69F0141484;
	Sun,  6 Aug 2023 19:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F0141484
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 50D3B1BF5A9
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:46:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF78360E8D
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 19:45:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF78360E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zfaQ5n0PslZ for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 19:45:37 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5F78360E85
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 19:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F78360E85
Received: by mail.gandi.net (Postfix) with ESMTPSA id 49C4BC0002;
 Sun,  6 Aug 2023 19:45:34 +0000 (UTC)
Date: Sun, 6 Aug 2023 21:45:33 +0200
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20230806214533.512bac85@windsurf>
In-Reply-To: <20221005091032.3014-3-br015@umbiko.net>
References: <20220409160921.GA3547512@scaer>
 <20221005091032.3014-3-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691351134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=em1bw0JhbrAXTOxIWQI92xcIQXcJcmcZNoMHVoK3cKY=;
 b=m3X85X2FBZw6Y7EDkUo+oD562ssiXZf5rqgE+BY8ayjpA0Eqg1MpsGaYzY/P+1gV+UwMnR
 9I4Y90s4iWiK3YBSeTPLTpfVtmPTxbO6++nn1oQSCO22BBBWHmKxAmZp9sEzkTYFaNrQ8M
 nauh26Rt2tD+UqBLlKd2ZzYLfqXh/wxIAwy9lngBjUKRa0ziWQTl/xrNkH248gjfLErb/z
 3Ljzg9svoAb+jUuFvNs8QdX1/pRG/rJmxDC7rVEc/zyCQaTZfXOh0VR1FkhmzjY77KarxY
 upk5yE43bf/VeozRCkDgO+cgnxuX0rlUuHRciyxYqGtoiYukl3yshuW/GjbDSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m3X85X2F
Subject: Re: [Buildroot] [PATCH v2 2/4] package/mpd: add/enhance (kconfig +
 code) comments
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: YANN E MORIN <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Andreas,

On Wed,  5 Oct 2022 11:10:30 +0200
Andreas Ziegler <br015@umbiko.net> wrote:

> Align kconfig comments with descriptions in the mpd manual.
> Add a kconfig comment to highlight the impact of ogg/vorbis selection.
> Add comments to makefile to explain remaining multiple dependency creation.
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
> Changes v1 -> v2:
>  - make this a separate patch 
> 
>  package/mpd/Config.in | 9 ++++++---
>  package/mpd/mpd.mk    | 2 ++
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/package/mpd/Config.in b/package/mpd/Config.in
> index 8f0af7b2d3..2606008e90 100644
> --- a/package/mpd/Config.in
> +++ b/package/mpd/Config.in
> @@ -33,7 +33,7 @@ config BR2_PACKAGE_MPD_SQLITE
>  	select BR2_PACKAGE_SQLITE
>  	help
>  	  Enable sqlite database support.
> -	  If you don't use sqlite it will use an ASCII database.

Why is this removed?

> +	  This is mandatory for the sticker database.

Not sure what the sticker database is :-)

>  
>  config BR2_PACKAGE_MPD_ZZIP
>  	bool "zzip"
> @@ -81,8 +81,8 @@ comment "Decoder plugins"
>  config BR2_PACKAGE_MPD_DSD
>  	bool "dsd"
>  	help
> -	  Enable Digital Speech Decoder (DSD) support to play audio
> -	  files encoded in a digital speech format.
> +	  Direct Stream Digital (DSD) support to play audio
> +	  files encoded in single bit format.

Is this change really relevant ?

>  
>  config BR2_PACKAGE_MPD_FAAD2
>  	bool "faad2"
> @@ -210,6 +210,9 @@ config BR2_PACKAGE_MPD_TWOLAME
>  	help
>  	  Enable TwoLAME mp2 encoding.
>  
> +comment "for ogg/vorbis encoding enable vorbis decoder"
> +	depends on !BR2_PACKAGE_MPD_VORBIS

I don't understand why this comment is needed. We usually don't put
comments about all dependencies on other packages. Why for this one?

If you want to play Ogg/Vorbis files, it's quite obvious that the
"vorbis" option needs to be enabled.

> +# opus needs to be encapsulated in a container format, here ogg

Yes, and?

>  ifeq ($(BR2_PACKAGE_MPD_OPUS),y)
>  MPD_DEPENDENCIES += opus libogg
>  MPD_CONF_OPTS += -Dopus=enabled
> @@ -317,6 +318,7 @@ else ifeq ($(BR2_PACKAGE_MPD_UPNP_DISABLED),y)
>  MPD_CONF_OPTS += -Dupnp=disabled
>  endif
>  
> +# handle decoder and encoder simultaneously

Yes, and?

Sorry, but I don't really understand the value of the changes proposed
in this commit. I'll mark it as Changes Requested for the time being.
Feel free to resubmit with more details if needed. Also, look at other
Buildroot packages, we try to do things consistently, so doing
something "special" in MPD is unlikely to be accepted.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

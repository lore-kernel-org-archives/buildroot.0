Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B38C77B76
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5337410DC;
	Sun, 23 Apr 2023 09:36:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5337410DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nMGf-4frBPmn; Sun, 23 Apr 2023 09:35:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2766416B1;
	Sun, 23 Apr 2023 09:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2766416B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 171701BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:35:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF6EE416B1
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:35:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF6EE416B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p9lmPIkR8VML for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:35:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3A9E410DC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3A9E410DC
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:35:47 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f69d:4ee8:8d2a:132a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 90C87B0059B;
 Sun, 23 Apr 2023 11:35:39 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Apr 2023 11:35:39 +0200
Date: Sun, 23 Apr 2023 11:35:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230423093539.GA2696@scaer>
References: <SN4P221MB0682F7E2B63C0ED16210383AA0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SN4P221MB0682F7E2B63C0ED16210383AA0609@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1682242543;
 bh=88bs2eZjlQKQb486OfwYjnmqL3RVuF3YuqfMfbzQpJc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JCIe4m1Qf8wU8aFtJ3XnXtqJbNHQ3bQFQh1fMhhhNZWzDSXkdc1fJqLscKLwNpLQh
 TjolpNzIAz14Su/n8fdAyBNUWUpsoKkaBIOoPEycfetY6Z0PNWy8zHBfpAZUbAQIQS
 8OAExbM1faLdAw+pejPjAmPj7FLUhhoDP7Ac1Sp6y5d9P0sSYbIVtLw9gD4sEh6rJJ
 VD1xWt1eInKaeZu7cru9Z7dkpXKups277z9oH6INyLaghkdGjn+fq03AEsHjdahOCs
 HwjukbeAUY46YYvRB9jrX1xnTvVMPO6275csb5vwoyZNIjnZqhVJrVy82Cn2IWTHxP
 76sJlJKBvLnMQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JCIe4m1Q
Subject: Re: [Buildroot] [PATCH] package/gpsd: support selection of all
 protocols
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 "Yann E . MORIN" <yann.morin@orange.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2023-04-21 19:40 -0400, James Knight spake thusly:
> When using the gpsd package, the menu options provide a way to select
> each individual protocol that is desired in the final process. However,
> there is no graceful way to say "select all protocols".
> 
> This commit tweaks the menu selection to have all protocols selected by
> default. For builds that want to opt out of specific protocols, they can
> do so by unchecking the individual protocols as desired.

Having everything disabled by default is the policy in Buildroot,
whereby the user only needs to enable what they actually need. There are
exceptions, but they are either historical baggage, or dully justified.
For example, when NMEA0183 was configurable in gpsd, the option in
Buildroot defaulted to 'y', because that makes sense that NMEA0183 be
enabled, as virtually all GNSS devices speak NMEA0183 when they boot
(and only switch to their custom protocol when instructed to); NMEA0183
became non-optional in gpsd 3.24, so we dropped the option when we
bumped in 05595cbeace3 (package/gpsd: bump to 3.24).

Usually, a given device will have only one GNSS device attached, seldom
two [0], and almost never more; only a generic "distro" would need to
enable all protocols, but that is by far not the main use-case for
Buildroot.

There are currently 26 protocols, and I could select all in about 5
seconds (by repeatedly hittng space and arrow-down in menuconfig);
that's easy and fast enough I think.

Now, when we update gpsd, there might be new protocols, and they might
be activated by default, indeed. But that's no different from any other
package that adds enabled-by-default new options; we just need to notice
(maybe after the fact) and add the necessary Kconfig options.

[0] we do at $work, but they both happen to even use the same protocol!

Regards,
Yann E. MORIN.

> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
> The reason for this change is a combination of two things. First, when
> building gpsd out-of-box, typically each protocol is enabled unless the
> configuration stage requests to opt out of using certain protocols.
> Buildroot's configuration takes the opposite approach by having each
> protocol disabled until selected. Second, in most cases (at least in my
> own experience), I typically flag each protocol manually to build. It
> would be nice when managing the use of gpsd to just use all protocols
> by default.
> 
> However, this approach will change a board's experience if new protocols
> are added into gpsd (where new protocols would be enabled by default).
> ---
>  Config.in.legacy       | 210 +++++++++++++++++++++++++++++++++++++++++
>  package/gpsd/Config.in | 101 ++++++++++++++------
>  package/gpsd/gpsd.mk   |  52 +++++-----
>  3 files changed, 308 insertions(+), 55 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 366b9d69494e96baacac8b83fe1d315f58fb8606..bf40419321c195802177b4ee682c355ba31088ca 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,216 @@ endif
>  
>  comment "Legacy options removed in 2023.05"
>  
> +config BR2_PACKAGE_GPSD_AIVDM
> +	bool "gpsd Aivdm protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_AIVDM
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_AIVDM.
> +
> +config BR2_PACKAGE_GPSD_ASHTECH
> +	bool "gpsd Ashtech protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_ASHTECH
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_ASHTECH.
> +
> +config BR2_PACKAGE_GPSD_EARTHMATE
> +	bool "gpsd Earthmate protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_EARTHMATE
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_EARTHMATE.
> +
> +config BR2_PACKAGE_GPSD_EVERMORE
> +	bool "gpsd EverMore protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_EVERMORE
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_EVERMORE.
> +
> +config BR2_PACKAGE_GPSD_FURY
> +	bool "gpsd Fury protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_FURY
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_FURY.
> +
> +config BR2_PACKAGE_GPSD_FV18
> +	bool "gpsd FV-18 protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_FV18
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_FV18.
> +
> +config BR2_PACKAGE_GPSD_GARMIN
> +	bool "gpsd Garmin (kernel) protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_GARMIN
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_GARMIN.
> +
> +config BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT
> +	bool "gpsd Garmin (simple text) protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_GARMIN_SIMPLE_TXT
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_GARMIN_SIMPLE_TXT.
> +
> +config BR2_PACKAGE_GPSD_GEOSTAR
> +	bool "gpsd Geostar protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_GEOSTAR
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_GEOSTAR.
> +
> +config BR2_PACKAGE_GPSD_GPSCLOCK
> +	bool "gpsd GPSClock protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_GPSCLOCK
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_GPSCLOCK.
> +
> +config BR2_PACKAGE_GPSD_GREIS
> +	bool "gpsd Greis protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_GREIS
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_GREIS.
> +
> +config BR2_PACKAGE_GPSD_ISYNC
> +	bool "gpsd iSync protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_ISYNC
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_ISYNC.
> +
> +config BR2_PACKAGE_GPSD_ITRAX
> +	bool "gpsd iTrax protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_ITRAX
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_ITRAX.
> +
> +config BR2_PACKAGE_GPSD_NAVCOM
> +	bool "gpsd Navcom protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_NAVCOM
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_NAVCOM.
> +
> +config BR2_PACKAGE_GPSD_NMEA2000
> +	bool "gpsd NMEA2000 protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_NAVCOM
> +	select BR2_PACKAGE_GPSD_AIVDM
> +	select BR2_PACKAGE_GPSD_PROTOCOL_NMEA2000
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_NMEA2000.
> +
> +config BR2_PACKAGE_GPSD_OCEANSERVER
> +	bool "gpsd OceanServer protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_OCEANSERVER
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_OCEANSERVER.
> +
> +config BR2_PACKAGE_GPSD_ONCORE
> +	bool "gpsd OnCore protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_ONCORE
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_ONCORE.
> +
> +config BR2_PACKAGE_GPSD_RTCM104V2
> +	bool "gpsd RTCM104 v2 protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V2
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V2.
> +
> +config BR2_PACKAGE_GPSD_RTCM104V3
> +	bool "gpsd RTCM104 v3 protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V3
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V3.
> +
> +config BR2_PACKAGE_GPSD_SIRF
> +	bool "gpsd SiRF protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_SIRF
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_SIRF.
> +
> +config BR2_PACKAGE_GPSD_SKYTRAQ
> +	bool "gpsd Skytraq protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_SKYTRAQ
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_SKYTRAQ.
> +
> +config BR2_PACKAGE_GPSD_SUPERSTAR2
> +	bool "gpsd SuperStarII protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_SUPERSTAR2
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_SUPERSTAR2.
> +
> +config BR2_PACKAGE_GPSD_TRIMBLE_TSIP
> +	bool "gpsd Trimble TSIP protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_TRIMBLE_TSIP
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_TRIMBLE_TSIP.
> +
> +config BR2_PACKAGE_GPSD_TRIPMATE
> +	bool "gpsd TripMate protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_TRIPMATE
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_TRIPMATE.
> +
> +config BR2_PACKAGE_GPSD_TRUE_NORTH
> +	bool "gpsd True North Technologies protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_TRUE_NORTH
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_TRUE_NORTH.
> +
> +config BR2_PACKAGE_GPSD_UBX
> +	bool "gpsd UBX protocol renamed"
> +	select BR2_LEGACY
> +	select BR2_LEGACY_GPSD_PROTOCOLS
> +	select BR2_PACKAGE_GPSD_PROTOCOL_UBX
> +	help
> +	  Renamed to BR2_PACKAGE_GPSD_PROTOCOL_UBX.
> +
>  config BR2_PACAKGE_OPENFPGALOADER_CMSIS
>  	bool "openfpgaloader cmsis option name fixed"
>  	select BR2_LEGACY
> diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
> index 8c28c05efd61e902ff760e034da3e1a6edafd758..60329783542e5712aa98b18cf9fd32c280abe949 100644
> --- a/package/gpsd/Config.in
> +++ b/package/gpsd/Config.in
> @@ -87,138 +87,181 @@ config BR2_PACKAGE_GPSD_PYTHON
>  comment "GPSD python support not available with toolchain w/o wide characters support"
>  	depends on !BR2_USE_WCHAR
>  
> -comment "Protocols"
> +menuconfig BR2_PACKAGE_GPSD_PROTOCOLS
> +	bool "Protocols"
> +	default y
> +	help
> +	  Select specific protocols to be supported by gpsd.
> +
> +# legacy protocol selection
> +#
> +# Flag to help detect a legacy protocol selection. When legacy implementation
> +# can be removed, this flag can be removed and each protocol selection below
> +# should default to `y` without the use of this flag.
> +config BR2_LEGACY_GPSD_PROTOCOLS
> +	bool
> +	select BR2_PACKAGE_GPSD_PROTOCOLS
> +
> +if BR2_PACKAGE_GPSD_PROTOCOLS
>  
> -config BR2_PACKAGE_GPSD_AIVDM
> +config BR2_PACKAGE_GPSD_PROTOCOL_AIVDM
>  	bool "Aivdm"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Aivdm support
>  
> -config BR2_PACKAGE_GPSD_ASHTECH
> +config BR2_PACKAGE_GPSD_PROTOCOL_ASHTECH
>  	bool "Ashtech"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Ashtech support
>  
> -config BR2_PACKAGE_GPSD_EARTHMATE
> +config BR2_PACKAGE_GPSD_PROTOCOL_EARTHMATE
>  	bool "Earthmate"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  DeLorme EarthMate Zodiac support
>  
> -config BR2_PACKAGE_GPSD_EVERMORE
> +config BR2_PACKAGE_GPSD_PROTOCOL_EVERMORE
>  	bool "EverMore"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  EverMore binary support
>  
> -config BR2_PACKAGE_GPSD_FURY
> +config BR2_PACKAGE_GPSD_PROTOCOL_FURY
>  	bool "Fury"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Jackson Labs Fury and Firefly support
>  
> -config BR2_PACKAGE_GPSD_FV18
> +config BR2_PACKAGE_GPSD_PROTOCOL_FV18
>  	bool "FV-18"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  San Jose Navigation FV-18 support
>  
> -config BR2_PACKAGE_GPSD_GARMIN
> +config BR2_PACKAGE_GPSD_PROTOCOL_GARMIN
>  	bool "Garmin (kernel)"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Garmin kernel driver support
>  
> -config BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT
> +config BR2_PACKAGE_GPSD_PROTOCOL_GARMIN_SIMPLE_TXT
>  	bool "Garmin (simple text)"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Garmin Simple Text support
>  
> -config BR2_PACKAGE_GPSD_GEOSTAR
> +config BR2_PACKAGE_GPSD_PROTOCOL_GEOSTAR
>  	bool "Geostar"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Geostar Protocol support
>  
> -config BR2_PACKAGE_GPSD_GPSCLOCK
> +config BR2_PACKAGE_GPSD_PROTOCOL_GPSCLOCK
>  	bool "GPSClock"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  GPSClock support
>  
> -config BR2_PACKAGE_GPSD_GREIS
> +config BR2_PACKAGE_GPSD_PROTOCOL_GREIS
>  	bool "Greis"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Greis support
>  
> -config BR2_PACKAGE_GPSD_ISYNC
> +config BR2_PACKAGE_GPSD_PROTOCOL_ISYNC
>  	bool "iSync"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Spectratime iSync LNRClok/GRCLOK support
>  
> -config BR2_PACKAGE_GPSD_ITRAX
> +config BR2_PACKAGE_GPSD_PROTOCOL_ITRAX
>  	bool "iTrax"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  iTrax support
>  
> -config BR2_PACKAGE_GPSD_NAVCOM
> +config BR2_PACKAGE_GPSD_PROTOCOL_NAVCOM
>  	bool "Navcom"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Navcom binary support
>  
> -config BR2_PACKAGE_GPSD_NMEA2000
> +config BR2_PACKAGE_GPSD_PROTOCOL_NMEA2000
>  	bool "NMEA2000"
> -	select BR2_PACKAGE_GPSD_NAVCOM
> -	select BR2_PACKAGE_GPSD_AIVDM
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
> +	select BR2_PACKAGE_GPSD_PROTOCOL_NAVCOM
> +	select BR2_PACKAGE_GPSD_PROTOCOL_AIVDM
>  	help
>  	  NMEA2000/CAN support
>  
> -config BR2_PACKAGE_GPSD_OCEANSERVER
> +config BR2_PACKAGE_GPSD_PROTOCOL_OCEANSERVER
>  	bool "OceanServer"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  OceanServer Digital Compass support
>  
> -config BR2_PACKAGE_GPSD_ONCORE
> +config BR2_PACKAGE_GPSD_PROTOCOL_ONCORE
>  	bool "OnCore"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  OnCore support
>  
> -config BR2_PACKAGE_GPSD_RTCM104V2
> +config BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V2
>  	bool "RTCM104 v2"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  RTCM104 v2 support
>  
> -config BR2_PACKAGE_GPSD_RTCM104V3
> +config BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V3
>  	bool "RTCM104 v3"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  RTCM104 v3 support
>  
> -config BR2_PACKAGE_GPSD_SIRF
> +config BR2_PACKAGE_GPSD_PROTOCOL_SIRF
>  	bool "SiRF"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  SiRF binary support
>  
> -config BR2_PACKAGE_GPSD_SKYTRAQ
> +config BR2_PACKAGE_GPSD_PROTOCOL_SKYTRAQ
>  	bool "Skytraq"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Skytraq support
>  
> -config BR2_PACKAGE_GPSD_SUPERSTAR2
> +config BR2_PACKAGE_GPSD_PROTOCOL_SUPERSTAR2
>  	bool "SuperStarII"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Novatel SuperStarII binary support
>  
> -config BR2_PACKAGE_GPSD_TRIMBLE_TSIP
> +config BR2_PACKAGE_GPSD_PROTOCOL_TRIMBLE_TSIP
>  	bool "Trimble TSIP"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Trimble TSIP support
>  
> -config BR2_PACKAGE_GPSD_TRIPMATE
> +config BR2_PACKAGE_GPSD_PROTOCOL_TRIPMATE
>  	bool "TripMate"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  Delorme TripMate support
>  
> -config BR2_PACKAGE_GPSD_TRUE_NORTH
> +config BR2_PACKAGE_GPSD_PROTOCOL_TRUE_NORTH
>  	bool "True North Technologies"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  True North Technologies support
>  
> -config BR2_PACKAGE_GPSD_UBX
> +config BR2_PACKAGE_GPSD_PROTOCOL_UBX
>  	bool "UBX"
> +	default y if !BR2_LEGACY_GPSD_PROTOCOLS # legacy
>  	help
>  	  uBlox UBX binary support
>  
>  endif
> +
> +endif
> diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
> index d7425513fd180188e59492042ea0517df38dea1e..35e5caee4404666b02f997cd46751d7c4840ffbd 100644
> --- a/package/gpsd/gpsd.mk
> +++ b/package/gpsd/gpsd.mk
> @@ -76,82 +76,82 @@ GPSD_DEPENDENCIES += dbus-glib
>  endif
>  
>  # Protocol support
> -ifneq ($(BR2_PACKAGE_GPSD_ASHTECH),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_ASHTECH),y)
>  GPSD_SCONS_OPTS += ashtech=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_AIVDM),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_AIVDM),y)
>  GPSD_SCONS_OPTS += aivdm=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_EARTHMATE),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_EARTHMATE),y)
>  GPSD_SCONS_OPTS += earthmate=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_EVERMORE),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_EVERMORE),y)
>  GPSD_SCONS_OPTS += evermore=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_FURY),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_FURY),y)
>  GPSD_SCONS_OPTS += fury=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_FV18),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_FV18),y)
>  GPSD_SCONS_OPTS += fv18=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_GARMIN),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_GARMIN),y)
>  GPSD_SCONS_OPTS += garmin=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_GARMIN_SIMPLE_TXT),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_GARMIN_SIMPLE_TXT),y)
>  GPSD_SCONS_OPTS += garmintxt=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_GEOSTAR),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_GEOSTAR),y)
>  GPSD_SCONS_OPTS += geostar=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_GPSCLOCK),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_GPSCLOCK),y)
>  GPSD_SCONS_OPTS += gpsclock=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_GREIS),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_GREIS),y)
>  GPSD_SCONS_OPTS += greis=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_ISYNC),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_ISYNC),y)
>  GPSD_SCONS_OPTS += isync=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_ITRAX),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_ITRAX),y)
>  GPSD_SCONS_OPTS += itrax=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_NAVCOM),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_NAVCOM),y)
>  GPSD_SCONS_OPTS += navcom=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_NMEA2000),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_NMEA2000),y)
>  GPSD_SCONS_OPTS += nmea2000=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_OCEANSERVER),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_OCEANSERVER),y)
>  GPSD_SCONS_OPTS += oceanserver=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_ONCORE),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_ONCORE),y)
>  GPSD_SCONS_OPTS += oncore=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_RTCM104V2),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V2),y)
>  GPSD_SCONS_OPTS += rtcm104v2=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_RTCM104V3),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_RTCM104V3),y)
>  GPSD_SCONS_OPTS += rtcm104v3=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_SIRF),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_SIRF),y)
>  GPSD_SCONS_OPTS += sirf=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_SKYTRAQ),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_SKYTRAQ),y)
>  GPSD_SCONS_OPTS += skytraq=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_SUPERSTAR2),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_SUPERSTAR2),y)
>  GPSD_SCONS_OPTS += superstar2=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_TRIMBLE_TSIP),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_TRIMBLE_TSIP),y)
>  GPSD_SCONS_OPTS += tsip=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_TRIPMATE),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_TRIPMATE),y)
>  GPSD_SCONS_OPTS += tripmate=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_TRUE_NORTH),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_TRUE_NORTH),y)
>  GPSD_SCONS_OPTS += tnt=no
>  endif
> -ifneq ($(BR2_PACKAGE_GPSD_UBX),y)
> +ifneq ($(BR2_PACKAGE_GPSD_PROTOCOL_UBX),y)
>  GPSD_SCONS_OPTS += ublox=no
>  endif
>  
> -- 
> 2.39.1.windows.1
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

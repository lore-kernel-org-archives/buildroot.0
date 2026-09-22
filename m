Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874D7C982FA
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 20:00:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16319605EF;
	Tue, 22 Sep 2026 20:00:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L25wbnILSBkN; Tue, 22 Sep 2026 20:00:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E431D60664
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790107205;
	b=TVKxX6/+awFR5svxHQJigAoA2XFnMvZ8Axo8g/GtZJ8ZdCcV+1KJXmAC8gQlh/MyfKg6
	 MwWUjU/hVm1+XqLWWD5nRwqEediIT1UyO5LqE5w2YU1/x4ZaB2Dle9GaJBPa9V194zbui
	 cFuDvueJdwdQSdoABjDeTlpPR1R73vKOupPvol07qyl1k98+/AQjQRgkP0JT4S+9Tcf8y
	 RjnatSjeRYZiw3SH0F3+4cg13YdeR1RlS0okSfSHjzQMIPPMSQbhplAtzzWitAl5htDoo
	 wlRAVH3lgAJ2t26prZub6zyJDOeXlaXXEprF7OrAz9+/WPSuIOoRodXGVe8tAWDjEdQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790107205;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=N6q0ZvjoZrvRcoHTEIEio+xTQ+BxxW9XjQjAm7xpwYQ=;
	b=bQKwy1S6qVqY1Ht71g1lJgT9eFWL/H93D2xzZxFUiOnYJPSKLx1Trzt6Kqg0Po9cPrCJ
	 UGGU4BmS0ltCqVz+iTwKsfNBLlSKbGBZ87TWq2o9tQQgKnvmJiajWahw8ivatrNwlXf3M
	 TEdCa+jPu1UTv5zCYedFxg4HCoZ9PGO8vBBrcSAIctNLAIp9JXgviT5Vbhd+SaAP6Dwt5
	 muA9dTruUjNh1gpEIBYwFvP5IiHAjFdzaklvm5JzGn7f43WLJSqIhATe4/dricIFDhHQE
	 sejTL+l1vi4rcvqxDZa03usb5JVygFpF8AVOLxuPgHze3f4A6sNDTJNn9dB3j35G8mQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790107205;
	bh=N6q0ZvjoZrvRcoHTEIEio+xTQ+BxxW9XjQjAm7xpwYQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HpXSWaacR+6Id8pa4MYExA71HLjn9iUoZOUebgFYcYE06MA5ozBWeS5M4F54Bp1uK
	 rIdrEhSPUB94DpwNjnFZlnNVeZpxHt09dBwhTtz5cXf3M+uec1s8eyZAlmOM01bIya
	 TXKb9V0EUcZoUPPdVJjloYDahw9n33QeOEjUHet+/mnmsZ7zSkQ1imKg2LVZ+LPJpB
	 qLgLyySaP+8Hbr4CDp3FwoVJqwNK5rKrFrxKVhyX+Yi5nIh+z86aQ+RBU1rDCyb0VL
	 40S4cHDhWQ4mqX91MrIRtJIQb12d2eXPinRPVn/rGVja+zHTqF4DBRgLYnXXoBkTKN
	 PgeQHleCDnOfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E431D60664;
	Tue, 22 Sep 2026 20:00:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CB35224E
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:00:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B0E52401ED
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:00:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VDod6BC2lms9 for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 20:00:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 6686F401E3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790107201;
 b=Ars9K0HvjBmn9e/qzdJDI0pYMPyQ8nBJPfNFvQoHKlIO+xRhJco3TArWWZNS8jgPzurx
 DWL1K6VORdhcgMnMxYvIt327aFnnILdlu3FvZj/5G/rZVnFKN5GMxMCwfoBDHyD/SLjM4
 sGBUlDjYGX8ztdIF9ZwXw/V7rXnG85rmcHm6Ii6dlleFgOUKGexFJv7F/n04GGxmFCQfs
 rgN8qqlCnhJQ4xpMk3lJp3/SVGzeSOjytY4NsEyXhrGp8NzMbc1nLj1P2ea36ehyZKVnw
 auYz8bKLvHIlEG8YeR89wiUGMia1jcqhdVFcpQ69VB/StzAHBIF/CqVnUTG2zbrNQwA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790107201;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=YxltxFFU0rxo4/8VJ2M3lIS73idm7EZTVYrql3s5eiw=;
 b=Nd2vNvvR6OoNIKOReVmWFFR0I/kXwGMLSgoXcgArKkuG7ywc/EhDr40Q/giu/2/cQ2oD
 euP4CKySBh4jSk341zuMhZ1jBDU7OkIeCXm7uXQ5upIRN6oF3d45Sn7ZO004mKqILwz+c
 tvlrMNAHMSGnQsEMrpc/eNBsHbZLUsjEiM+6CmGpLUo6f115U3OgrhKzt/VAWoRUtFfer
 fwD2Hj9j0p65Ho4NJG0O0euE4bqfMZr25BezQl2l9vYBoGXJ8pp6fdC/FsQqdvnf0sHK1
 /GC4kVSH8YMfDQHHdMeb4MHS4Bozp6q7+9X68jFn+SBkSpIrE8Y8SNIUP8b65Rr7SNg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iBPhOWGN; 
 arc=none smtp.remote-ip=212.27.42.3
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6686F401E3
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 20:00:00 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B9E2713F86A;
 Tue, 22 Sep 2026 21:59:55 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 21:59:55 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 21:59:55 +0200
To: Alsey Coleman Miller <alseycmiller@gmail.com>
Cc: buildroot@buildroot.org, Michael Fischer <mf@go-sys.de>
In-Reply-To: <20260816191830.533747-8-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
 <20260816191830.533747-8-alseycmiller@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <6152a5813ec8b59c67e339e2914058ad@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 7/8] package/sdl3_mixer: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alsey,

Thanks for the patch. I have few comments, see below.

On 16/08/2026 21:18, Alsey Coleman Miller wrote:
> SDL3_mixer is the multi-channel audio mixer library for SDL3. It plays
> AIFF, AU, VOC and WAVE, MIDI through the built-in timidity, and MP3,
> Ogg Vorbis and FLAC through the bundled dr_mp3, stb_vorbis and dr_flac
> decoders, none of which need a dependency.
> 
> The better decoders are built when their libraries are already in the
> configuration: flac, mpg123, opusfile, wavpack, fluidsynth, libxmp for
> modules and game-music-emu for console chiptunes. Ogg Vorbis comes from
> vorbisfile or tremor and never both, since upstream errors out when the
> two are enabled together, so tremor is used only when libvorbis is
> absent.
> 
> VENDORED is off so the copies of those libraries in the tarball are not
> used, DEPS_SHARED off so they are linked rather than dlopen()ed, and
> STRICT on so a decoder that cannot find its library fails the build
> instead of being dropped silently.
> 
> Built with CMake, like sdl3 itself, rather than with the autotools 
> setup
> the SDL2 counterpart uses.
> 
> Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
> ---
>  DEVELOPERS                         |   1 +
>  package/Config.in                  |   1 +
>  package/sdl3_mixer/Config.in       |  17 +++++
>  package/sdl3_mixer/sdl3_mixer.hash |   3 +
>  package/sdl3_mixer/sdl3_mixer.mk   | 103 +++++++++++++++++++++++++++++
>  5 files changed, 125 insertions(+)
>  create mode 100644 package/sdl3_mixer/Config.in
>  create mode 100644 package/sdl3_mixer/sdl3_mixer.hash
>  create mode 100644 package/sdl3_mixer/sdl3_mixer.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 56b01fa5cc..964fe9a597 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -172,6 +172,7 @@ N:	Alsey Coleman Miller <alseycmiller@gmail.com>
>  F:	package/liblc3/
>  F:	package/plutosvg/
>  F:	package/plutovg/
> +F:	package/sdl3_mixer/
> 
>  N:	Alvaro G. M <alvaro.gamez@hazent.com>
>  F:	package/dcron/
> diff --git a/package/Config.in b/package/Config.in
> index 5e1601036c..853d3bd07d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -369,6 +369,7 @@ comment "Graphic libraries"
>  	source "package/sdl3/Config.in"
>  	source "package/sdl3_gfx/Config.in"
>  	source "package/sdl3_image/Config.in"
> +	source "package/sdl3_mixer/Config.in"
>  	source "package/sdl3_ttf/Config.in"
>  	source "package/spirv-headers/Config.in"
>  	source "package/tk/Config.in"
> diff --git a/package/sdl3_mixer/Config.in 
> b/package/sdl3_mixer/Config.in
> new file mode 100644
> index 0000000000..cfefb4719b
> --- /dev/null
> +++ b/package/sdl3_mixer/Config.in
> @@ -0,0 +1,17 @@
> +config BR2_PACKAGE_SDL3_MIXER
> +	bool "sdl3_mixer"
> +	depends on BR2_PACKAGE_SDL3
> +	help
> +	  SDL3_mixer is a multi-channel audio mixer library for
> +	  SDL3. It plays AIFF, AU, VOC and WAVE samples, MIDI
> +	  through the built-in timidity, and MP3, Ogg Vorbis and
> +	  FLAC through the bundled dr_mp3, stb_vorbis and dr_flac
> +	  decoders.
> +
> +	  The higher quality decoders are used instead when their
> +	  libraries are enabled in the configuration (flac, mpg123,
> +	  libvorbis or tremor, opusfile, wavpack, fluidsynth), and
> +	  module and console chiptune playback is added by libxmp
> +	  and game-music-emu.
> +
> +	  https://github.com/libsdl-org/SDL_mixer
> diff --git a/package/sdl3_mixer/sdl3_mixer.hash 
> b/package/sdl3_mixer/sdl3_mixer.hash
> new file mode 100644
> index 0000000000..44602037e1
> --- /dev/null
> +++ b/package/sdl3_mixer/sdl3_mixer.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated
> +sha256  
> 182a07c745375e113dc740d43964ff21b0be29f29f59876c4dbc4db3d32f6901  
> SDL3_mixer-3.2.4.tar.gz
> +sha256  
> e36997fe492c48e7ed873065cc3a694f38e8189a328d3709099ffdc9a8843f4c  
> LICENSE.txt
> diff --git a/package/sdl3_mixer/sdl3_mixer.mk 
> b/package/sdl3_mixer/sdl3_mixer.mk
> new file mode 100644
> index 0000000000..beff679466
> --- /dev/null
> +++ b/package/sdl3_mixer/sdl3_mixer.mk
> @@ -0,0 +1,103 @@
> +################################################################################
> +#
> +# sdl3_mixer
> +#
> +################################################################################
> +
> +SDL3_MIXER_VERSION = 3.2.4
> +SDL3_MIXER_SOURCE = SDL3_mixer-$(SDL3_MIXER_VERSION).tar.gz
> +SDL3_MIXER_SITE = https://www.libsdl.org/projects/SDL_mixer/release
> +SDL3_MIXER_LICENSE = Zlib
> +SDL3_MIXER_LICENSE_FILES = LICENSE.txt
> +SDL3_MIXER_CPE_ID_VENDOR = libsdl
> +SDL3_MIXER_CPE_ID_PRODUCT = sdl_mixer
> +SDL3_MIXER_INSTALL_STAGING = YES
> +SDL3_MIXER_DEPENDENCIES = sdl3 host-pkgconf
> +
> +# AIFF, AU, VOC and WAVE, plus the bundled dr_flac, dr_mp3, stb_vorbis 
> and
> +# timidity decoders, need no dependency and are left enabled by 
> default.
> +# STRICT makes the build fail when a decoder we asked for cannot find 
> its
> +# library, instead of silently dropping it. DEPS_SHARED=OFF links the
> +# decoder libraries directly rather than dlopen()ing them at runtime.
> +SDL3_MIXER_CONF_OPTS = \
> +	-DSDLMIXER_VENDORED=OFF \
> +	-DSDLMIXER_DEPS_SHARED=OFF \
> +	-DSDLMIXER_STRICT=ON \
> +	-DSDLMIXER_TESTS=OFF \
> +	-DSDLMIXER_EXAMPLES=OFF \
> +	-DSDLMIXER_INSTALL_MAN=OFF
> +
> +ifeq ($(BR2_PACKAGE_GAME_MUSIC_EMU),y)

Here, the script "utils/check-symbols" reports an error:

package/sdl3_mixer/sdl3_mixer.mk:30: BR2_PACKAGE_GAME_MUSIC_EMU 
referenced but not defined

This symbol does not exist. This package is missing in
your patch series, or this block should be removed.

> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_GME=ON
> +SDL3_MIXER_DEPENDENCIES += game-music-emu
> +else
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_GME=OFF
> +endif
> +
> +# MOD playback goes through libxmp; libxmp-lite is not packaged.
> +ifeq ($(BR2_PACKAGE_LIBXMP),y)

Same comment here:
The script "utils/check-symbols" reports an error:

package/sdl3_mixer/sdl3_mixer.mk:38: BR2_PACKAGE_LIBXMP referenced but 
not defined

> +SDL3_MIXER_CONF_OPTS += \
> +	-DSDLMIXER_MOD=ON \
> +	-DSDLMIXER_MOD_XMP=ON \
> +	-DSDLMIXER_MOD_XMP_LITE=OFF
> +SDL3_MIXER_DEPENDENCIES += libxmp
> +else
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_MOD=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FLAC),y)
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_FLAC_LIBFLAC=ON
> +SDL3_MIXER_DEPENDENCIES += flac
> +else
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_FLAC_LIBFLAC=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MPG123),y)
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_MP3_MPG123=ON
> +SDL3_MIXER_DEPENDENCIES += mpg123
> +else
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_MP3_MPG123=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FLUIDSYNTH),y)
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_MIDI_FLUIDSYNTH=ON
> +SDL3_MIXER_DEPENDENCIES += fluidsynth
> +else
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_MIDI_FLUIDSYNTH=OFF
> +endif
> +
> +# Opus is decoded through opusfile, which pulls in opus and libogg.
> +ifeq ($(BR2_PACKAGE_OPUSFILE),y)
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_OPUS=ON
> +SDL3_MIXER_DEPENDENCIES += opusfile
> +else
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_OPUS=OFF
> +endif
> +
> +ifeq ($(BR2_PACKAGE_WAVPACK),y)
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_WAVPACK=ON
> +SDL3_MIXER_DEPENDENCIES += wavpack
> +else
> +SDL3_MIXER_CONF_OPTS += -DSDLMIXER_WAVPACK=OFF
> +endif
> +
> +# Ogg Vorbis comes from either vorbisfile or tremor, never both; 
> upstream
> +# errors out when the two are enabled together. tremor is the 
> integer-only
> +# decoder, so it is only used when libvorbis is absent.
> +ifeq ($(BR2_PACKAGE_LIBVORBIS),y)
> +SDL3_MIXER_CONF_OPTS += \
> +	-DSDLMIXER_VORBIS_VORBISFILE=ON \
> +	-DSDLMIXER_VORBIS_TREMOR=OFF
> +SDL3_MIXER_DEPENDENCIES += libvorbis
> +else ifeq ($(BR2_PACKAGE_TREMOR),y)
> +SDL3_MIXER_CONF_OPTS += \
> +	-DSDLMIXER_VORBIS_VORBISFILE=OFF \
> +	-DSDLMIXER_VORBIS_TREMOR=ON
> +SDL3_MIXER_DEPENDENCIES += tremor
> +else
> +SDL3_MIXER_CONF_OPTS += \
> +	-DSDLMIXER_VORBIS_VORBISFILE=OFF \
> +	-DSDLMIXER_VORBIS_TREMOR=OFF
> +endif
> +
> +$(eval $(cmake-package))
> --
> 2.47.3

Could you send an updated patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

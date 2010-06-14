From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Jun 2010 10:50:30 +0200
Subject: [Buildroot]
	=?utf-8?q?=5BPATCH_3/4=5D_ffmpeg=3A_allow_customizati?=
	=?utf-8?q?on_of_codecs=2C_=28de=29muxers_and_other_components?=
Message-ID: <L3ZXW6$DC1420A5D64F3A5EE742F2128E2CC026@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> >>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
> 
>  Luca> Add the option to customize the list of decoders, encoders,
>  Luca> muxers, demuxers, parsers, protocols, bsfs and filters to be
>  Luca> built into ffmpeg, and to compile or exclude input and output
>  Luca> devices.
> 
>  Luca> +++ b/package/multimedia/ffmpeg/ffmpeg.mk
>  Luca> @@ -49,6 +49,58 @@ else
>  Luca>  FFMPEG_CONF_OPT += --disable-ffserver
>  Luca>  endif
>  
>  Luca> +ifneq ($(BR2_PACKAGE_FFMPEG_ENCODERS),"all")
>  Luca> +FFMPEG_CONF_OPT += --disable-encoders \
>  Luca> +	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_ENCODERS)),--enable-encoder=$(x))
>  Luca> +endif
>  Luca> +
>  Luca> +ifneq ($(BR2_PACKAGE_FFMPEG_DECODERS),"all")
> 
> I would suggest you use qstrip + strip here as well, so it doesn't break if the
> user accidently added extra spaces or so.

How can foreach break with extra spaces? I've been trying things as:
> BR2_PACKAGE_FFMPEG_ENCODERS="   vorbis    flac  "
and they work ok.

BTW, that was with GNU make. Relevant?

> 
> -- 
> Bye, Peter Korsgaard
> 

Luca

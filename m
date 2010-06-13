From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jun 2010 14:01:48 +0200
Subject: [Buildroot] [PATCH 3/4] ffmpeg: allow customization of codecs,
	(de)muxers and other components
In-Reply-To: <1276359761-13721-4-git-send-email-luca@lucaceresoli.net> (Luca
	Ceresoli's message of "Sat, 12 Jun 2010 18:22:40 +0200")
References: <1276359761-13721-1-git-send-email-luca@lucaceresoli.net>
	<1276359761-13721-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <87k4q3f8er.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:

 Luca> Add the option to customize the list of decoders, encoders,
 Luca> muxers, demuxers, parsers, protocols, bsfs and filters to be
 Luca> built into ffmpeg, and to compile or exclude input and output
 Luca> devices.

 Luca> +++ b/package/multimedia/ffmpeg/ffmpeg.mk
 Luca> @@ -49,6 +49,58 @@ else
 Luca>  FFMPEG_CONF_OPT += --disable-ffserver
 Luca>  endif
 
 Luca> +ifneq ($(BR2_PACKAGE_FFMPEG_ENCODERS),"all")
 Luca> +FFMPEG_CONF_OPT += --disable-encoders \
 Luca> +	$(foreach x,$(call qstrip,$(BR2_PACKAGE_FFMPEG_ENCODERS)),--enable-encoder=$(x))
 Luca> +endif
 Luca> +
 Luca> +ifneq ($(BR2_PACKAGE_FFMPEG_DECODERS),"all")

I would suggest you use qstrip + strip here as well, so it doesn't break if the
user accidently added extra spaces or so.

-- 
Bye, Peter Korsgaard

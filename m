From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 14 Jun 2010 12:00:39 +0200
Subject: [Buildroot]
	=?utf-8?q?=5BPATCH_3/4=5D_ffmpeg=3A_allow_customizati?=
	=?utf-8?q?on_of_codecs=2C_=28de=29muxers_and_other_components?=
Message-ID: <L40153$4B4F2698302B94CA4D89952637FD93F6@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard wrote:
> >>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
> 
> Hi,
> 
>  Luca> +ifneq ($(BR2_PACKAGE_FFMPEG_DECODERS),"all")
>  >> 
>  >> I would suggest you use qstrip + strip here as well, so it doesn't break if the
>  >> user accidently added extra spaces or so.
> 
>  Luca> How can foreach break with extra spaces? I've been trying things as:
>  >> BR2_PACKAGE_FFMPEG_ENCODERS="   vorbis    flac  "
>  Luca> and they work ok.
> 
> Not the foreach, but the ifneq (....,"all") would break if the user
> ended up setting it to "all " or " all" or similar.

Sorry, now I got what you mean.

Why do you say qstrip+strip anyway? qstrip does strip itself:

> # Strip quotes and then whitespaces                                                                    
> qstrip=$(strip $(subst ",,$(1)))                                                                       
> #"))

So I would do:
-ifneq ($(BR2_PACKAGE_FFMPEG_ENCODERS),"all")
+ifneq ($(call qstrip,$(BR2_PACKAGE_FFMPEG_ENCODERS)),all)

If that's ok, it will be in the re-submitted patches.

> 
> -- 
> Bye, Peter Korsgaard
> 

Luca

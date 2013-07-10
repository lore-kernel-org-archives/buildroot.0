From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 9 Jul 2013 22:51:32 -0700
Subject: [Buildroot] [PATCH] fdk-aac: new package
In-Reply-To: <87k3kzgeuz.fsf@dell.be.48ers.dk>
References: <1367282387-8011-1-git-send-email-gilles.talis@gmail.com>
 <87k3kzgeuz.fsf@dell.be.48ers.dk>
Message-ID: <CAKcgs2yfEZJfPy3=zRcEaaf5_Jjcqs4NemCSv-BqZXTcE2Ukig@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter and all,


2013/7/9 Peter Korsgaard <jacmet@uclibc.org>
>
> >>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:
>
> Hi, and sorry for the slow response.
No worries. Things have been busy around here :-)

>  Gilles> +      # These architectures are not supported by FDK AAC
>  Gilles> +      depends on !(BR2_bfin || BR2_avr32 || BR2_sparc || BR2_xtensa \
>  Gilles> +                      || BR2_microblaze)
>
> Are you sure about these? What about arc and aarch64? Normally we prefer
> positive logic so these things don't need to be updated when a new
> architecture is added.
If I remember well, at the time I tested this, I was getting a
compilation error due to architecture not supported.
I will have to retest. I agree that positive logic is less dangerous.

> With that said, from a 1 minute look at the source code, it looks like
> there's specific code for arm/mips/x86, but generic sw fallbacks for
> other archs - So perhaps it does work on all archs?
Let me retest and see what happens.

> It is written in C++, so you need to depend on BR2_INSTALL_LIBSTDCPP and
> show a comment if not available.
Correct. Well spotted.


>  Gilles> +#############################################################
>  Gilles> +#
>  Gilles> +# fdk-aac
>  Gilles> +#
>  Gilles> +#############################################################
>
> We make the '#' headers 80 chars wide noadays.
OK.


>  Gilles> +
>  Gilles> +FDK_AAC_VERSION = 0.1.1
>  Gilles> +FDK_AAC_SITE = http://downloads.sourceforge.net/project/opencore-amr/fdk-aac
>  Gilles> +FDK_AAC_LICENSE = fdk-aac license
>  Gilles> +FDK_AAC_LICENSE_FILES = NOTICE
>  Gilles> +
>  Gilles> +FDK_AAC_INSTALL_STAGING = YES
>  Gilles> +
>  Gilles> +$(eval $(autotools-package))
>
>
> Are there no programs in buildroot that can use this library?
I think ffmpeg does, but it requires to update ffmpeg version
buildroot is currently using. I first wanted this package to go in
before looking at ffmpeg version bumping.

> Other that these minor issues it looks good, care to send an updated
> version fixing them? Thanks.
Will do. Thanks for the review.

Gilles.

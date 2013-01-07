From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 07 Jan 2013 18:11:18 +0100
Subject: [Buildroot] tokyocabinet: new package
In-Reply-To: <CALvuzg5L=Hjzm3p0p1gYUE7GNeiFxwLiApO92YOt_fGAk7n95Q@mail.gmail.com>
References: <CALvuzg5L=Hjzm3p0p1gYUE7GNeiFxwLiApO92YOt_fGAk7n95Q@mail.gmail.com>
Message-ID: <50EB01B6.6000106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  Hi Jon,

On 21/12/12 15:45, Jon Diekema wrote:
> tokyocabinet: new package
>
> Signed-off-by: Jon Diekema<jon.diekema@gmail.com>

  Your patch is still line-wrapped. Also, it has to be modified manually 
in order to be processed with git-am, otherwise all the text below will 
be included in the commit message. Please send your patch with
git send-email.

  Also, it is useful for the review if you include in the message a 
changelog of what you modified compared to your previous submission.

[snip]
> diff --git a/package/tokyocabinet/Config.in b/package/tokyocabinet/Config.in
> new file mode 100644
> index 0000000..66ff02e
> --- /dev/null
> +++ b/package/tokyocabinet/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_TOKYOCABINET
> +        bool "Tokyo Cabinet"
> +        help

  The config attributes should be indented with 1 TAB.

> +  A modern reimplementation of QDBM, also released under the LGPL
> +  by Mikio Hirabayashi in 2007.
> +
> +  http://www.igvita.com/2009/02/13/tokyo-cabinet-beyond-key-value-store/

  The help text should be indented with 1 TAB + 2 spaces.

[snip]
> diff --git a/package/tokyocabinet/tokyocabinet.mk
> b/package/tokyocabinet/tokyocabinet.mk
> new file mode 100644
> index 0000000..a5fa21d
> --- /dev/null
> +++ b/package/tokyocabinet/tokyocabinet.mk
> @@ -0,0 +1,42 @@
> +#############################################################
> +#
> +# Tokyo Cabinet
> +#
> +#############################################################
> +
> +TOKYOCABINET_VERSION = 1.4.47
> +TOKYOCABINET_SOURCE = tokyocabinet-$(TOKYOCABINET_VERSION).tar.gz
> +TOKYOCABINET_SITE = http://httpsqs.googlecode.com/files
> +TOKYOCABINET_INSTALL_STAGING = YES
> +TOKYOCABINET_LICENSE = LGPLv2.1

  LGPLv2.1+, actually.

> +TOKYOCABINET_LICENSE_FILES = COPYING
[snip]

  I tried this with an internal toolchain with all features disabled, and 
it barfed in tcucodec.c, which tries to print out the size and range of 
wchar_t. Simplest solution is to make tokyocabinet depend on 
BR2_USE_WCHAR, but perhaps better is a patch that removes the useless 
wchar stuff from tcucodec.c...


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 26 Nov 2019 22:51:02 +0100
Subject: [Buildroot] [PATCH 1/1] package/perl-gdtextutil: add license
In-Reply-To: <20191125180957.1024314-1-fontaine.fabrice@gmail.com>
References: <20191125180957.1024314-1-fontaine.fabrice@gmail.com>
Message-ID: <20191126225102.7304a715@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Mon, 25 Nov 2019 19:09:57 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Dustismo.LICENSE states that license is GPL-2.0+
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/perl-gdtextutil/perl-gdtextutil.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/perl-gdtextutil/perl-gdtextutil.mk b/package/perl-gdtextutil/perl-gdtextutil.mk
> index cd1617fbbd..d40ad5fd1c 100644
> --- a/package/perl-gdtextutil/perl-gdtextutil.mk
> +++ b/package/perl-gdtextutil/perl-gdtextutil.mk
> @@ -7,6 +7,7 @@
>  PERL_GDTEXTUTIL_VERSION = 0.86
>  PERL_GDTEXTUTIL_SOURCE = GDTextUtil-$(PERL_GDTEXTUTIL_VERSION).tar.gz
>  PERL_GDTEXTUTIL_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MV/MVERB
> +PERL_GDTEXTUTIL_LICENSE = GPL-2.0+

This is not correct. Dustismo.LICENSE contains the license for the
Dustismo_Sans.ttf font file. The rest is licensed under the same terms
as Perl. See the README file:

COPYRIGHT

    Copyright (c) 1999 Martien Verbruggen
    mgjv at comdyn.com.au

    This package is free software; you can redistribute it and/or
    modify it under the same terms as Perl itself.

Enclosed fonts: 

    Dustismo Sans and Dustismo Roman
    http://www.cheapskatefonts.com/
    see Dustismo,LICENSE for original (GPL) license

So I guess the right thing to do would be:

 - Include README in the license files

 - Set the license to:

   Artistic or GPL-1.0+ (perl module), GPL-2.0+ (font)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

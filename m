From: =?UTF-8?B?U3RlZmFuIEZyw7ZiZXJn?= <stefan.froberg@petroprogram.com>
Date: Thu, 27 Dec 2012 20:25:46 +0200
Subject: [Buildroot] [PATCH] rxvt-unicode: new package
In-Reply-To: <87y5gosd57.fsf@dell.be.48ers.dk>
References: <1356221169-32572-1-git-send-email-stefan.froberg@petroprogram.com>
 <87y5gosd57.fsf@dell.be.48ers.dk>
Message-ID: <50DC92AA.4030001@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

23.12.2012 22:54, Peter Korsgaard kirjoitti:
>>>>>> "Stefan" == Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:
>  Stefan> Signed-off-by: Stefan Fr?berg <stefan.froberg@petroprogram.com>
>  Stefan> ---
>  Stefan>  package/Config.in                                  |    1 +
>  Stefan>  package/rxvt-unicode/Config.in                     |    9 +++++++++
>  Stefan>  .../rxvt-unicode/rxvt-unicode-9.15-terminfo.patch  |   12 ++++++++++++
>  Stefan>  package/rxvt-unicode/rxvt-unicode.mk               |   12 ++++++++++++
>  Stefan>  4 files changed, 34 insertions(+), 0 deletions(-)
>  Stefan>  create mode 100644 package/rxvt-unicode/Config.in
>  Stefan>  create mode 100644 package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
>  Stefan>  create mode 100644 package/rxvt-unicode/rxvt-unicode.mk
>
>  Stefan> diff --git a/package/Config.in b/package/Config.in
>  Stefan> index d5e94db..562bfda 100644
>  Stefan> --- a/package/Config.in
>  Stefan> +++ b/package/Config.in
>  Stefan> @@ -169,6 +169,7 @@ source "package/leafpad/Config.in"
>  Stefan>  source "package/midori/Config.in"
>  Stefan>  source "package/pcmanfm/Config.in"
>  Stefan>  source "package/rdesktop/Config.in"
>  Stefan> +source "package/rxvt-unicode/Config.in"
>  Stefan>  source "package/sylpheed/Config.in"
>  Stefan>  source "package/synergy/Config.in"
>  Stefan>  source "package/torsmo/Config.in"
>  Stefan> diff --git a/package/rxvt-unicode/Config.in b/package/rxvt-unicode/Config.in
>  Stefan> new file mode 100644
>  Stefan> index 0000000..3eab31d
>  Stefan> --- /dev/null
>  Stefan> +++ b/package/rxvt-unicode/Config.in
>  Stefan> @@ -0,0 +1,9 @@
>  Stefan> +config BR2_PACKAGE_RXVT_UNICODE
>  Stefan> +	bool "rxvt-unicode"
>
> We normally use 'depends on BR2_PACKAGE_XORG7' to ensure the package is
> only visible if the user wants X11.
>
>  Stefan> +	select BR2_PACKAGE_FONTCONFIG
>  Stefan> +	select BR2_PACKAGE_XLIB_LIBX11
>  Stefan> +	select BR2_PACKAGE_XLIB_LIBXRENDER
>  Stefan> +	help
>  Stefan> +	  rxvt clone with xft and unicode support
>  Stefan> +
>  Stefan> +	  http://software.schmorp.de/pkg/rxvt-unicode
>  Stefan> diff --git a/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch b/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
>  Stefan> new file mode 100644
>  Stefan> index 0000000..910ce76
>  Stefan> --- /dev/null
>  Stefan> +++ b/package/rxvt-unicode/rxvt-unicode-9.15-terminfo.patch
>  Stefan> @@ -0,0 +1,12 @@
>
> Please add a git-style patch header describing the (simple) patch, your
> signed-off-by and its upstream status.
>
>  Stefan> +diff -Naur rxvt-unicode-9.15.org/doc/Makefile.in rxvt-unicode-9.15/doc/Makefile.in
>  Stefan> +--- rxvt-unicode-9.15.org/doc/Makefile.in	2012-04-11 23:57:47.105465883 +0300
>  Stefan> ++++ rxvt-unicode-9.15/doc/Makefile.in	2012-04-12 00:02:13.848367530 +0300
>  Stefan> +@@ -102,7 +102,7 @@
>  Stefan> + 	$(INSTALL_DATA) rxvt.7.man  $(DESTDIR)$(man7dir)/$(RXVTNAME).$(man7ext)
>  Stefan> + @IF_PERL@	$(INSTALL) -d $(DESTDIR)$(man3dir)
>  Stefan> + @IF_PERL@	$(INSTALL_DATA) rxvtperl.3.man $(DESTDIR)$(man3dir)/$(RXVTNAME)perl.$(man3ext)
>  Stefan> +-	@TIC@ $(srcdir)/etc/rxvt-unicode.terminfo
>  Stefan> ++	@TIC@ $(srcdir)/etc/rxvt-unicode.terminfo -o $(DESTDIR)/usr/share/terminfo
>  Stefan> + 
>  Stefan> + distdepend: alldoc
>  Stefan> + 
>
>  Stefan> diff --git a/package/rxvt-unicode/rxvt-unicode.mk b/package/rxvt-unicode/rxvt-unicode.mk
>  Stefan> new file mode 100644
>  Stefan> index 0000000..009b40e
>  Stefan> --- /dev/null
>  Stefan> +++ b/package/rxvt-unicode/rxvt-unicode.mk
>  Stefan> @@ -0,0 +1,12 @@
>  Stefan> +#############################################################
>  Stefan> +#
>  Stefan> +# rxvt-unicode
>  Stefan> +#
>  Stefan> +#############################################################
>  Stefan> +RXVT_UNICODE_VERSION = 9.15
>  Stefan> +RXVT_UNICODE_SOURCE = rxvt-unicode-$(RXVT_UNICODE_VERSION).tar.bz2
>  Stefan> +RXVT_UNICODE_SITE = http://dist.schmorp.de/rxvt-unicode
>  Stefan> +RXVT_UNICODE_DEPENDENCIES = fontconfig ncurses xlib_libX11 xlib_libXrender
>
> You forgot to 'select BR2_PACKAGE_NCURSES'.
>
Ok. I fix these and resubmit v2.

Thanks!

Regards
Stefan

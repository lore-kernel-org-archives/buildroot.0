From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Jul 2016 00:36:08 +0200
Subject: [Buildroot] [PATCH 1/1] Added shellinabox v2.19
In-Reply-To: <CACcFhEUPPTzt8GcEwGV3yNJLKBEubZHbE3z=9_Ei_DbymapYvA@mail.gmail.com>
References: <CACcFhEUPPTzt8GcEwGV3yNJLKBEubZHbE3z=9_Ei_DbymapYvA@mail.gmail.com>
Message-ID: <f07527e0-b411-512b-e83b-e8bd97ba5d4e@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Olivier,

Thanks for this contribution, some comments below:

Le 04/07/2016 ? 21:15, Olivier Singla a ?crit :
> From 5af5aa8d3e6d20d6611611a9782bc47b5f49a8d8 Mon Sep 17 00:00:00 2001
> From: Olivier <olivier.singla at gmail.com <mailto:olivier.singla@gmail.com>>
> Date: Mon, 4 Jul 2016 14:53:21 -0400
> Subject: [PATCH 1/1] Added shellinabox v2.19

Please send a patch using git send-email command:
http://nightly.buildroot.org/manual.html#submitting-patches

Your patch is corrupted by your mail client.

> 
> Signed-off-by: Olivier <olivier.singla at gmail.com <mailto:olivier.singla@gmail.com>>
> ---
>  package/Config.in                                  |  1 +
>  .../shellinabox/0001-Makefile.am-fix-static.patch  | 11 +++++++++++
>  package/shellinabox/Config.in                      | 10 ++++++++++
>  package/shellinabox/shellinabox.hash               |  3 +++
>  package/shellinabox/shellinabox.mk <http://shellinabox.mk>                 | 23
> ++++++++++++++++++++++
>  5 files changed, 48 insertions(+)
>  create mode 100644 package/shellinabox/0001-Makefile.am-fix-static.patch
>  create mode 100644 package/shellinabox/Config.in
>  create mode 100644 package/shellinabox/shellinabox.hash
>  create mode 100644 package/shellinabox/shellinabox.mk <http://shellinabox.mk>
> 
> diff --git a/package/Config.in b/package/Config.in
> index 2c4c196..91fcf37 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1525,6 +1525,7 @@ menu "Networking applications"
>  source "package/sconeserver/Config.in"
>  source "package/ser2net/Config.in"
>  source "package/shairport-sync/Config.in"
> +source "package/shellinabox/Config.in"
>  source "package/smcroute/Config.in"
>  source "package/socat/Config.in"
>  source "package/socketcand/Config.in"
> diff --git a/package/shellinabox/0001-Makefile.am-fix-static.patch
> b/package/shellinabox/0001-Makefile.am-fix-static.patch
> new file mode 100644
> index 0000000..e1ad67d
> --- /dev/null
> +++ b/package/shellinabox/0001-Makefile.am-fix-static.patch
> @@ -0,0 +1,11 @@
> +--- shellinabox-2.19/Makefile.am.orig2016-07-03 20:46:42.655784211 -0400
> ++++ shellinabox-2.19/Makefile.am2016-07-03 20:46:50.582801842 -0400

Please, add a comment about what the patch is doing and don't forget to add your
Sob line.

http://nightly.buildroot.org/manual.html#_format_and_licensing_of_the_package_patches

> +@@ -126,7 +126,7 @@
> + 
> + shellinaboxd_LDADD   = liblogging.la <http://liblogging.la>                  
>                        \
> +                        libhttp.la <http://libhttp.la>
> +-shellinaboxd_LDFLAGS = -static
> ++shellinaboxd_LDFLAGS =
> + ## Added this for compatibility with older versions of autoconf/automake
> + docdir               = ${datadir}/doc/${PACKAGE}
> + 
> diff --git a/package/shellinabox/Config.in b/package/shellinabox/Config.in
> new file mode 100644
> index 0000000..75cdfd8
> --- /dev/null
> +++ b/package/shellinabox/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_SHELLINABOX
> +bool "shellinabox"
Indent with one tab
> +select BR2_PACKAGE_ZLIB
> +help
> + Shell In A Box implements a web server that can export arbitrary command
> + line tools to a web based terminal emulator. This emulator is accessible
> + to any JavaScript and CSS enabled web browser and does not require any
> + additional browser plugins.
> +
> + https://github.com/shellinabox/shellinabox
Indent the help text with one tab + 2 spaces (72 characters max per line)
> diff --git a/package/shellinabox/shellinabox.hash
> b/package/shellinabox/shellinabox.hash
> new file mode 100644
> index 0000000..16bf12c
> --- /dev/null
> +++ b/package/shellinabox/shellinabox.hash
> @@ -0,0 +1,3 @@
> +# Locally calculated after checking pgp signature
> +
> +sha256d25ba9f72f04471fc1a8a564c65ef466c4553280ff3eeb365ed9c897d05ed2da
>  v2.19.tar.gz
Your patch is wrapped here by you mail client.

> diff --git a/package/shellinabox/shellinabox.mk <http://shellinabox.mk>
> b/package/shellinabox/shellinabox.mk <http://shellinabox.mk>
> new file mode 100644
> index 0000000..03adc21
> --- /dev/null
> +++ b/package/shellinabox/shellinabox.mk <http://shellinabox.mk>
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# shellinabox
> +#
> +################################################################################
> +
> +SHELLINABOX_VERSION = 2.19
> +SHELLINABOX_SOURCE = v$(SHELLINABOX_VERSION).tar.gz
> +SHELLINABOX_SITE = https://github.com/shellinabox/shellinabox/archive
Use the gitbub helper here
http://nightly.buildroot.org/manual.html#github-download-url

> +SHELLINABOX_INSTALL_STAGING = YES
Why shellinabox is installed on staging ?

> +SHELLINABOX_LICENSE = GNU GPL v2
should be GPLv2
Also check if a license file is available.
> +#SHELLINABOX_CONF_OPTS = --enable-shared --disable-static
Remove this commented line.

> +SHELLINABOX_AUTORECONF = YES
Why we need to autoreconf the package ?
is a configure script available ?
> +
> +SHELLINABOX_DEPENDENCIES = zlib 
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +SHELLINABOX_CONF_OPTS += --enable-ssl
missing build dependency on openssl package

I'll mark this package change requested in patchwork, please send an updated
version.

Best regards,
Romain Naour


> +else
> +SHELLINABOX_CONF_OPTS += --disable-ssl
> +endif
> +SHELLINABOX_CONF_OPTS += --disable-runtime-loading
> +
> +$(eval $(autotools-package))
> -- 
> 2.5.5
> 
> 
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 

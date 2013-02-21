From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Feb 2013 17:39:06 +0100
Subject: [Buildroot] [PATCH 11/13] libshairport: new package
In-Reply-To: <b0b591df9513c8714c641b591d64591e38dc554f.1361458625.git.maxime.hadjinlian@gmail.com>
References: <cover.1361458625.git.maxime.hadjinlian@gmail.com>
 <b0b591df9513c8714c641b591d64591e38dc554f.1361458625.git.maxime.hadjinlian@gmail.com>
Message-ID: <CAHXCMMJ+gu3e0hemH2JCn-_xoJbR_Fh7LML1yYriWZzgmdYtzQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime,

2013/2/21 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>:
> libshairport is a client library that emulates an airplay server
> This package was originally found at : https://github.com/huceke/buildroot-rbp
> By gimli <ebsi4711@gmail.com>
>
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  package/Config.in                                  |    1 +
>  package/libshairport/Config.in                     |   12 +
>  .../libshairport-1.2.0.20310_lib-001_add_ao.patch  |  270 +++++++
>  ...rt-1.2.0.20310_lib-002_fix_install_header.patch |   12 +
>  ...hairport-1.2.0.20310_lib-003_fix_deadlock.patch |   10 +
>  ...irport-1.2.0.20310_lib-004_fix_bad_access.patch |   22 +
>  ...hairport-1.2.0.20310_lib-005_fix_shutdown.patch |   10 +
>  ...ibshairport-1.2.0.20310_lib-006_no_printf.patch |  843 ++++++++++++++++++++
>  ...rt-1.2.0.20310_lib-007_fix_syslog_defines.patch |   24 +
>  ...port-1.2.0.20310_lib-008-add-missing-libs.patch |   21 +
>  ...libshairport-1.2.0.20310_lib-009_fix_ipv6.patch |   22 +
>  package/libshairport/libshairport.mk               |   13 +
[...]
> diff --git a/package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch b/package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch
> new file mode 100644
> index 0000000..b2debed
> --- /dev/null
> +++ b/package/libshairport/libshairport-1.2.0.20310_lib-001_add_ao.patch
> @@ -0,0 +1,270 @@
> +diff -uP libshairport-1.2.0.20310_lib/src/ao.h ../../../../../libshairport-1.2.0.20310_lib/src/ao.h
> +--- libshairport-1.2.0.20310_lib-org/src/ao.h  1970-01-01 01:00:00.000000000 +0100
> ++++ libshairport-1.2.0.20310_lib-mod/src/ao.h  2011-09-25 20:36:36.000000000 +0200

I guess you get the patches from the web?

Could you reformat the patches' header according to:
http://buildroot.org/downloads/manual/manual.html#_format_and_licensing_of_the_package_patches
and/or:
http://buildroot.org/downloads/manual/manual.html#_integrating_patches_found_on_the_web

[...]
> +LIBSHAIRPORT_VERSION = 1.2.0.20310_lib
> +LIBSHAIRPORT_SITE = http://mirrors.xbmc.org/build-deps/darwin-libs
> +LIBSHAIRPORT_INSTALL_STAGING = YES
> +LIBSHAIRPORT_AUTORECONF = YES
A short comment why autoreconf is necessary would be appreciated.

> +LIBSHAIRPORT_DEPENDENCIES = openssl
> +
> +$(eval $(autotools-package))


Regards,

-- 
Samuel

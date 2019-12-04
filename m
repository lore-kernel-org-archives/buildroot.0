From: Heiko Thiery <Heiko.Thiery@kontron.com>
Date: Wed, 4 Dec 2019 12:53:26 +0000
Subject: [Buildroot] [PATCH 6/7] libnetconf2: adjust dependencies
In-Reply-To: <8c74f9fdebe7eef326420f5354f3ec8163930074.1575456104.git.jan.kundrat@cesnet.cz>
References: <cover.1575456104.git.jan.kundrat@cesnet.cz>
 <8c74f9fdebe7eef326420f5354f3ec8163930074.1575456104.git.jan.kundrat@cesnet.cz>
Message-ID: <9d41e44617fd43d6be09f8b9da673643@kontron.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Jan,

> -----Urspr?ngliche Nachricht-----
> Von: Jan Kundr?t [mailto:jan.kundrat at cesnet.cz]
> Gesendet: Freitag, 17. M?rz 2017 19:30
> An: buildroot at buildroot.org
> Cc: Heiko Thiery; Fabrice Fontaine
> Betreff: [PATCH 6/7] libnetconf2: adjust dependencies
> 
> This package needs at least one of these two options, or both:
> 
> - openssl
> - libssh + the server option
> 
> Without these, it is not possible to produce a usable library, so let's reflect this
> in the dependencies.
> 
> I'm not sure that there is so much value in this; I would actually prefer to have
> both of these unconditionally enabled, but the package is already done in this
> way, so be it.

The intention was to be able to select the SSH/TLS support by providing/selecting the
dependent package.

Do you think that is not reasonable?

> Signed-off-by: Jan Kundr?t <jan.kundrat@cesnet.cz>
> ---
>  package/libnetconf2/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libnetconf2/Config.in b/package/libnetconf2/Config.in
> index 0a735b5ed6..6d4c9c71d1 100644
> --- a/package/libnetconf2/Config.in
> +++ b/package/libnetconf2/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_LIBNETCONF2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_USE_MMU
> +	depends on BR2_PACKAGE_LIBSSH_SERVER || BR2_PACKAGE_OPENSSL
>  	select BR2_PACKAGE_LIBYANG
>  	help
>  	  libnetconf2 is a NETCONF library in C intended for building @@ -13,3
> +14,6 @@ config BR2_PACKAGE_LIBNETCONF2  comment "libnetconf2 needs a
> toolchain w/ threads, dynamic libraray"
>  	depends on BR2_USE_MMU
>  	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> +
> +comment "libnetconf2 requires libssh w/ server support and/or openssl"
> +	depends on !BR2_PACKAGE_LIBSSH_SERVER &&
> !BR2_PACKAGE_OPENSSL
> --
> 2.21.0
> 

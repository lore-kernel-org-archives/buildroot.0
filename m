From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 24 Jun 2017 13:31:27 -0400
Subject: [Buildroot] [PATCH v2 3/4] libressl: add libssl virtual package
	support.
In-Reply-To: <20170624172900.3610-3-Adamduskett@outlook.com>
References: <20170624172900.3610-1-Adamduskett@outlook.com>
 <20170624172900.3610-3-Adamduskett@outlook.com>
Message-ID: <CAFSsvmqBBsf5AFmi4YiQ8NWKupsk9hWLo5t-2=SzgfsaxBCchw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry about the final period.  Hard habit to break!

On Sat, Jun 24, 2017 at 1:28 PM, Adam Duskett <aduskett@gmail.com> wrote:
> libressl can provide libssl.
>
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 -> v2:
>   - None.
>
>  package/libressl/Config.in   | 4 ++++
>  package/libressl/libressl.mk | 1 +
>  2 files changed, 5 insertions(+)
>
> diff --git a/package/libressl/Config.in b/package/libressl/Config.in
> index 035176a..2cc87d0 100644
> --- a/package/libressl/Config.in
> +++ b/package/libressl/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBRESSL
>         bool "libressl"
> +       select BR2_PACKAGE_HAS_LIBSSL
>         help
>           LibreSSL is a version of the TLS/crypto stack forked from
>           OpenSSL in 2014, with goals of modernizing the codebase,
> @@ -10,6 +11,9 @@ config BR2_PACKAGE_LIBRESSL
>
>  if BR2_PACKAGE_LIBRESSL
>
> +config BR2_PACKAGE_PROVIDES_LIBSSL
> +       default "libressl"
> +
>  config BR2_PACKAGE_LIBRESSL_BIN
>         bool "openssl binary"
>         help
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> index f315165..e8145c0 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -10,6 +10,7 @@ LIBRESSL_SOURCE = libressl-$(LIBRESSL_VERSION).tar.gz
>  LIBRESSL_LICENSE = ISC (New additions), OpenSSL or SSLeay (Original OpenSSL code)
>  LIBRESSL_LICENSE_FILES = COPYING
>  LIBRESSL_INSTALL_STAGING = YES
> +LIBRESSL_PROVIDES = libssl
>
>  ifeq ($(BR2_PACKAGE_LIBRESSL_BIN),)
>  define LIBRESSL_REMOVE_BIN
> --
> 2.9.4
>

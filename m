From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 25 Jun 2017 12:46:28 +0200
Subject: [Buildroot] [PATCH v2 4/4] openssl: add libssl virtual package
 support
In-Reply-To: <20170624172900.3610-4-Adamduskett@outlook.com>
References: <20170624172900.3610-1-Adamduskett@outlook.com>
 <20170624172900.3610-4-Adamduskett@outlook.com>
Message-ID: <7f759c6e-dcac-c21c-bae3-c27e386283e4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-06-17 19:29, Adam Duskett wrote:
> openssl can provide libssl.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

 For me, this can be squashed with the patch adding libssl, and the one adding
libressl support can be squashed with the patch adding libressl.

 Regards,
 Arnout

> ---
> Changes v1 -> v2:
>   - None.
> 
>  package/openssl/Config.in  | 4 ++++
>  package/openssl/openssl.mk | 1 +
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index e08b648..d024cb4 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_OPENSSL
>  	bool "openssl"
>  	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_HAS_LIBSSL
>  	help
>  	  A collaborative effort to develop a robust, commercial-grade, fully
>  	  featured, and Open Source toolkit implementing the Secure Sockets
> @@ -13,6 +14,9 @@ config BR2_PACKAGE_OPENSSL
>  
>  if BR2_PACKAGE_OPENSSL
>  
> +config BR2_PACKAGE_PROVIDES_LIBSSL
> +	default "openssl"
> +
>  config BR2_PACKAGE_OPENSSL_BIN
>  	bool "openssl binary"
>  	help
> diff --git a/package/openssl/openssl.mk b/package/openssl/openssl.mk
> index 5f56b44..c028290 100644
> --- a/package/openssl/openssl.mk
> +++ b/package/openssl/openssl.mk
> @@ -10,6 +10,7 @@ OPENSSL_LICENSE = OpenSSL or SSLeay
>  OPENSSL_LICENSE_FILES = LICENSE
>  OPENSSL_INSTALL_STAGING = YES
>  OPENSSL_DEPENDENCIES = zlib
> +OPENSSL_PROVIDES = libssl
>  HOST_OPENSSL_DEPENDENCIES = host-zlib
>  OPENSSL_TARGET_ARCH = generic32
>  OPENSSL_CFLAGS = $(TARGET_CFLAGS)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Jun 2017 00:41:33 +0200
Subject: [Buildroot] [PATCH 3/5] libressl: add libssl virtual package
 support.
In-Reply-To: <20170615142928.31927-3-aduskett@codeblue.com>
References: <20170615142928.31927-1-aduskett@codeblue.com>
 <20170615142928.31927-3-aduskett@codeblue.com>
Message-ID: <9d976ead-b1a6-3225-a452-a51ae55b0465@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 15-06-17 16:29, Adam Duskett wrote:
> libressl can provide libssl.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
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
>  	bool "libressl"
> +	select BR2_PACKAGE_HAS_LIBSSL
>  	help
>  	  LibreSSL is a version of the TLS/crypto stack forked from
>  	  OpenSSL in 2014, with goals of modernizing the codebase,
> @@ -10,6 +11,9 @@ config BR2_PACKAGE_LIBRESSL
>  
>  if BR2_PACKAGE_LIBRESSL
>  
> +config BR2_PACKAGE_PROVIDES_LIBSSL
> +	default "libressl"
> +
>  config BR2_PACKAGE_LIBRESSL_BIN
>  	bool "openssl binary"
>  	help
> diff --git a/package/libressl/libressl.mk b/package/libressl/libressl.mk
> index 940ca22..e057662 100644
> --- a/package/libressl/libressl.mk
> +++ b/package/libressl/libressl.mk
> @@ -10,6 +10,7 @@ LIBRESSL_SITE_METHOD = git
>  LIBRESSL_LICENSE = ISC, BSD-3-Clause, OpenSSL or SSLeay
>  LIBRESSL_LICENSE_FILES = COPYING
>  LIBRESSL_INSTALL_STAGING = YES
> +LIBRESSL_PROVIDES = libssl
>  
>  # autogen.sh needs to be ran manually as it pulls from the upstream
>  # OpenBSD source which adds several directories to the source.
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

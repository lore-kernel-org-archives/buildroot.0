From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 10 Jul 2015 18:47:35 +0200
Subject: [Buildroot] [PATCH v3 1/2] libsodium: new package
In-Reply-To: <1432036871-3244-1-git-send-email-fhunleth@troodon-software.com>
References: <1432036871-3244-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <559FF727.3070608@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

Le 19/05/2015 14:01, Frank Hunleth a ?crit :
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
> Changes v1 -> v2:
>   - fix curly braces on variables (thanks to Thomas for noticing)
>   - added patch for zeromq (in separate patch) to address libsodium
>     dependency in that library (thanks to Romain for this). I didn't
>     find any other packages with a similar dependency, but it's not
>     that easy to do that search.
> Changes v2 -> v3:
>   - removed host build (thanks to Baruch and Thomas)
> 
>  package/Config.in                |  1 +
>  package/libsodium/Config.in      |  6 ++++++
>  package/libsodium/libsodium.hash |  2 ++
>  package/libsodium/libsodium.mk   | 13 +++++++++++++
>  4 files changed, 22 insertions(+)
>  create mode 100644 package/libsodium/Config.in
>  create mode 100644 package/libsodium/libsodium.hash
>  create mode 100644 package/libsodium/libsodium.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index e0c2e2a..5b99639 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -723,6 +723,7 @@ menu "Crypto"
>  	source "package/libnss/Config.in"
>  	source "package/libsecret/Config.in"
>  	source "package/libsha1/Config.in"
> +	source "package/libsodium/Config.in"
>  	source "package/libssh2/Config.in"
>  	source "package/nettle/Config.in"
>  	source "package/openssl/Config.in"
> diff --git a/package/libsodium/Config.in b/package/libsodium/Config.in
> new file mode 100644
> index 0000000..47b9bb3
> --- /dev/null
> +++ b/package/libsodium/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_LIBSODIUM
> +	bool "libsodium"
> +	help
> +	  A modern and easy-to-use crypto library.
> +
> +	  http://libsodium.org/
> diff --git a/package/libsodium/libsodium.hash b/package/libsodium/libsodium.hash
> new file mode 100644
> index 0000000..089dc03
> --- /dev/null
> +++ b/package/libsodium/libsodium.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256	cbcfc63cc90c05d18a20f229a62c7e7054a73731d0aa858c0517152c549b1288	libsodium-1.0.3.tar.gz
> diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
> new file mode 100644
> index 0000000..c032863
> --- /dev/null
> +++ b/package/libsodium/libsodium.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# libsodium
> +#
> +################################################################################
> +
> +LIBSODIUM_VERSION = 1.0.3
> +LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/$(LIBSODIUM_VERSION)

Sorry for the long delay.

I think this patch is ok, so:

Reviewed-by: Romain Naour <romain.naour@openwide.fr>

Best regards,
Romain Naour

> +LIBSODIUM_LICENSE = ISC
> +LIBSODIUM_LICENSE_FILES = LICENSE
> +LIBSODIUM_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> 

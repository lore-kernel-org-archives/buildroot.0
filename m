From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jul 2014 16:25:58 +0200
Subject: [Buildroot] [RFC 1/3] Rename package mpc to libmpc
In-Reply-To: <1405951937-21226-2-git-send-email-jkrause@posteo.de>
References: <1405951937-21226-1-git-send-email-jkrause@posteo.de>
 <1405951937-21226-2-git-send-email-jkrause@posteo.de>
Message-ID: <20140721162558.749a1393@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 21 Jul 2014 16:12:15 +0200, J?rg Krause wrote:

> diff --git a/package/mpc/mpc.mk b/package/libmpc/libmpc.mk
> similarity index 53%
> rename from package/mpc/mpc.mk
> rename to package/libmpc/libmpc.mk
> index 81ee5f0..766e113 100644
> --- a/package/mpc/mpc.mk
> +++ b/package/libmpc/libmpc.mk
> @@ -1,15 +1,15 @@
>  ################################################################################
>  #
> -# mpc
> +# libmpc
>  #
>  ################################################################################
>  
> -MPC_VERSION = 1.0.2
> -MPC_SITE = $(BR2_GNU_MIRROR)/mpc
> -MPC_LICENSE = LGPLv3+
> -MPC_LICENSE_FILES = COPYING.LESSER
> -MPC_INSTALL_STAGING = YES
> -MPC_DEPENDENCIES = gmp mpfr
> +LIBMPC_VERSION = 1.0.2
> +LIBMPC_SITE = $(BR2_GNU_MIRROR)/mpc
> +LIBMPC_LICENSE = LGPLv3+
> +LIBMPC_LICENSE_FILES = COPYING.LESSER
> +LIBMPC_INSTALL_STAGING = YES
> +LIBMPC_DEPENDENCIES = libgmp libmpfr

Did you actually test this? With the package named "mpc", we didn't had
to define MPC_SOURCE, as it is inferred from the package name. If the
package is named "libmpc", then surely, there needs to be a
LIBMPC_SOURCE specification.

That being said, I would prefer to find a different name for the mpc
package (mpd client) rather than renaming existing packages.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

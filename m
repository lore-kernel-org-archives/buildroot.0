From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 17 May 2015 12:59:53 +0200
Subject: [Buildroot] [PATCH] libsodium: new package
In-Reply-To: <1431819535-9598-1-git-send-email-fhunleth@troodon-software.com>
References: <1431819535-9598-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20150517125953.05cf0950@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Frank Hunleth,

On Sat, 16 May 2015 19:38:55 -0400, Frank Hunleth wrote:

> diff --git a/package/libsodium/libsodium.mk b/package/libsodium/libsodium.mk
> new file mode 100644
> index 0000000..9445f5a
> --- /dev/null
> +++ b/package/libsodium/libsodium.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# libsodium
> +#
> +################################################################################
> +
> +LIBSODIUM_VERSION = 1.0.3
> +LIBSODIUM_SITE = https://github.com/jedisct1/libsodium/releases/download/${LIBSODIUM_VERSION}

Use $() to reference make variables, not ${}.

> +LIBSODIUM_LICENSE = ISC
> +LIBSODIUM_LICENSE_FILES = LICENSE
> +LIBSODIUM_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> +$(eval $(host-autotools-package))

As Baruch said, this host-autotools-package call seems useless.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

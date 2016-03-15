From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Mar 2016 14:33:17 +0100
Subject: [Buildroot] xorrisso: Bump version, Add host variant
In-Reply-To: <20160315142900.4fb08c25@armant.core.local.os.greenbone.net>
References: <20160315142900.4fb08c25@armant.core.local.os.greenbone.net>
Message-ID: <20160315143317.69c14040@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 15 Mar 2016 14:29:00 +0100, Beno?t Allard wrote:
> From 799ebe2712a0953b48ebf5c74aa4fe306cb33a2e Mon Sep 17 00:00:00 2001
> From: =?UTF-8?q?Beno=C3=AEt=20Allard?= <benoit.allard@greenbone.net>
> Date: Tue, 15 Mar 2016 11:55:54 +0100
> Subject: [PATCH 1/1] [xorriso] Bump version, Add host variant
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit

Could you use "git send-email" to send the patches so that we don't
have e-mail headers in the e-mail itself?

Also, this commit should be split into two: one bumping the version,
one adding the host variant (it was already suggested to you on IRC by
y_morin).

> diff --git a/package/xorriso/Config.in.host b/package/xorriso/Config.in.host
> new file mode 100644
> index 0000000..e2b8790
> --- /dev/null
> +++ b/package/xorriso/Config.in.host
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_HOST_XORRISO
> +	bool "host xorriso"
> +	help
> +	  xorriso copies file objects from POSIX compliant filesystems into
> +	  Rock Ridge enhanced ISO 9660 filesystems and allows session-wise
> +	  manipulation of such filesystems. It can load the management
> +	  information of existing ISO images and it writes the session results
> +	  to optical media or to filesystem objects.
> +
> +	  Vice versa xorriso is able to copy file objects out of ISO 9660 filesystems.
> +
> +	  https://www.gnu.org/software/xorriso

Do we really need a visible Config.in option for this host package?
Isn't host-xorriso going to be used by the logic in fs/iso9660/ to
generate an ISO image ?

> -XORRISO_VERSION = 1.3.8
> +XORRISO_VERSION = 1.4.2
>  XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
>  XORRISO_LICENSE = GPLv3+
>  XORRISO_LICENSE_FILES = COPYING COPYRIGHT
> @@ -64,3 +64,4 @@ XORRISO_CONF_OPTS += --disable-jtethreads
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

You also want to set HOST_XORRISO_DEPENDENCIES. Otherwise, the
dependencies are derived from XORRISO_DEPENDENCIES, and will most
likely not have the value you expect.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

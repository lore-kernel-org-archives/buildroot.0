From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 4 Sep 2015 08:48:53 +0100
Subject: [Buildroot] [PATCH] system: add options for /bin /sbin and /lib
 to be symlinks into /usr
In-Reply-To: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
References: <1441324062-31743-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55E94CE5.1010308@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

I think you forgot to add "v2" to the subject prefix and also list the
changes between v1 and v2.

On 09/04/2015 12:47 AM, Yann E. MORIN wrote:
> Furthermore, this means we're no longer supporting a split-usr setup, so
> the corresponding configure options have been removed as well for
> systemd and, when using a merged /usr, for eudev as well.

taking the last line of that comment into account...

> diff --git a/package/eudev/eudev.mk b/package/eudev/eudev.mk
> index 1aa74b3..24fe4ed 100644
> --- a/package/eudev/eudev.mk
> +++ b/package/eudev/eudev.mk
> @@ -22,11 +22,9 @@ EUDEV_CONF_ENV += LIBS=-lrt
>  EUDEV_CONF_OPTS =		\
>  	--disable-manpages	\
>  	--sbindir=/sbin		\
> -	--with-rootlibdir=/lib	\
>  	--libexecdir=/lib	\
>  	--with-firmware-path=/lib/firmware	\
>  	--disable-introspection			\
> -	--enable-split-usr			\
>  	--enable-libkmod
>  
>  EUDEV_DEPENDENCIES = host-gperf host-pkgconf util-linux kmod

shouldn't you do that _ONLY_ when BR2_ROOTFS_MERGED_USR is selected?

Regards,

Vincent.

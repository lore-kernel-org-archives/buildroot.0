From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Sep 2013 18:36:52 +0200
Subject: [Buildroot] [PATCH 08/10] coreutils: add support for SELinux
In-Reply-To: <1378429464-12546-9-git-send-email-rjbarnet@rockwellcollins.com>
References: <1378429464-12546-1-git-send-email-rjbarnet@rockwellcollins.com>
 <1378429464-12546-9-git-send-email-rjbarnet@rockwellcollins.com>
Message-ID: <20130908183652.78178804@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Barnett,

On Thu, 5 Sep 2013 20:04:22 -0500, Ryan Barnett wrote:
> 
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> ---
>  package/coreutils/coreutils.mk |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
> index 17c81f7..9c18d85 100644
> --- a/package/coreutils/coreutils.mk
> +++ b/package/coreutils/coreutils.mk
> @@ -16,6 +16,13 @@ ifeq ($(BR2_PACKAGE_BUSYBOX),y)
>  COREUTILS_DEPENDENCIES = busybox
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> +COREUTILS_DEPENDENCIES += libselinux
> +COREUTILS_CONF_OPT += --with-selinux
> +else
> +COREUTILS_CONF_OPT += --without-selinux
> +endif
> +
>  COREUTILS_BIN_PROGS = cat chgrp chmod chown cp date dd df dir echo false hostname \
>  	ln ls mkdir mknod mv pwd rm rmdir vdir sleep stty sync touch true \
>  	uname join
> @@ -59,6 +66,7 @@ COREUTILS_CONF_OPT = --disable-rpath \
>  		--disable-dependency-tracking \
>  		--enable-install-program=hostname
>  
> +

Nitpick: unneeded change.

Other than that, looks good.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

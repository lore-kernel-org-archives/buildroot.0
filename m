From: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 11 Nov 2020 22:47:55 +0100
Subject: [Buildroot] [PATCH 2/2] package/linux-backports: bump version
 to 5.8
In-Reply-To: <20201111162208.362275-2-ju.o@free.fr>
References: <20201111162208.362275-1-ju.o@free.fr>
 <20201111162208.362275-2-ju.o@free.fr>
Message-ID: <20201111214755.GB28486@pevik>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Julien,

> Attempting to compile this package with newer Kernel version (e.g. v5.4)
> fails with message:

>    Generating local configuration database from kernel ...Kernel version parse failed!

> Upgrading the package to 5.8 fixes this issue. Anyways, v4.4 is now
> rather old and beat the very purpose of having newer drivers in older
> kernels.

...
> -LINUX_BACKPORTS_VERSION_MAJOR = 4.4.2
> +LINUX_BACKPORTS_VERSION_MAJOR = 5.8
>  LINUX_BACKPORTS_VERSION = $(LINUX_BACKPORTS_VERSION_MAJOR)-1
>  LINUX_BACKPORTS_SOURCE = backports-$(LINUX_BACKPORTS_VERSION).tar.xz
>  LINUX_BACKPORTS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/projects/backports/stable/v$(LINUX_BACKPORTS_VERSION_MAJOR)
...

Thanks for updating to the latest stable release.

I haven't found any info about minimal kernel version required.
Looking briefly into the code, it still supports 3.0 (LINUX_VERSION_IS_GEQ(3,0,0))
=> nothing has changed.

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr

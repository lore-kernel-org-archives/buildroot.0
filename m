From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Apr 2020 23:03:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/libtirpc: bump to version 1.2.6
In-Reply-To: <20200415182153.14511-1-petr.vorel@gmail.com>
References: <20200415182153.14511-1-petr.vorel@gmail.com>
Message-ID: <20200415230316.16b31c66@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 15 Apr 2020 20:21:53 +0200
Petr Vorel <petr.vorel@gmail.com> wrote:

> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index 0d260891e2..073c81edf7 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -31,6 +31,9 @@ else
>  IPUTILS_CONF_OPTS += -DUSE_IDN=false
>  endif
>  
> +#$(if $(BR2_PACKAGE_LIBICONV),libiconv)
> +IPUTILS_DEPENDENCIES += libiconv
> +

Really ? :-)

>  ifeq ($(BR2_PACKAGE_NETTLE),y)
>  IPUTILS_CONF_OPTS += -DUSE_CRYPTO=nettle
>  IPUTILS_DEPENDENCIES += nettle
> diff --git a/package/libtirpc/libtirpc.hash b/package/libtirpc/libtirpc.hash
> index a7907dc7b2..044a69b56a 100644
> --- a/package/libtirpc/libtirpc.hash
> +++ b/package/libtirpc/libtirpc.hash
> @@ -1,5 +1,5 @@
>  # From sourceforge's info on download page:
> -sha1 ab80619b214d93e5cfbf22a0d01e1ee06d434326  libtirpc-1.2.5.tar.bz2
> +sha1 f182235e32942fc0ac6b9b5b6fe7e32f69362659  libtirpc-1.2.6.tar.bz2
>  # Locally computed
> -sha256 f3b6350c7e9c3cd9c58fc7a5e5f8e6be469cc571bb5eb31eb9790b3e675186ca  libtirpc-1.2.5.tar.bz2
> +sha256 4278e9a5181d5af9cd7885322fdecebc444f9a3da87c526e7d47f7a12a37d1cc  dl/libtirpc/libtirpc-1.2.6.tar.bz2

                                                                             ^^^ really ? :-)

I fixed both issues, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 15:18:04 +0200
Subject: [Buildroot] Unable to compile uboot v2012.10 on Buildroot
 2016.05
In-Reply-To: <1249010753.7483898.1467378648497.JavaMail.zimbra@datacom.ind.br>
References: <1249010753.7483898.1467378648497.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20160701151804.61f389e9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 1 Jul 2016 10:10:48 -0300 (BRT), Carlos Santos wrote:

> /usr/bin/make -C tools all
> gcc -O2 -I/work/bcm95615x/host/usr/include   -o img2srec.o img2srec.c -c
> In file included from img2srec.c:55:0:
> os_support.h:22:22: fatal error: compiler.h: No such file or directory

What is your host gcc version ? This failure smells like building an
old U-Boot, with gcc 5.x as the host gcc version.

> diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> index a2274ee..5d171dd 100644
> --- a/boot/uboot/uboot.mk
> +++ b/boot/uboot/uboot.mk
> @@ -92,9 +92,7 @@ endif
>  
>  UBOOT_MAKE_OPTS += \
>  	CROSS_COMPILE="$(TARGET_CROSS)" \
> -	ARCH=$(UBOOT_ARCH) \
> -	HOSTCFLAGS="$(HOST_CFLAGS)" \
> -	HOSTLDFLAGS="$(HOST_LDFLAGS)"

I'm not sure to see why this would fix the problem you're reporting.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

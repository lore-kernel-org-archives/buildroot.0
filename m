From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 6 Feb 2013 19:42:18 +0100
Subject: [Buildroot] crosstool-ng build failure
In-Reply-To: <CAEyFGJEsYb=iSsOOYQHzjUpgorGjQPSApF_iYksRj-UZhUiCnQ@mail.gmail.com>
References: <CAEyFGJEsYb=iSsOOYQHzjUpgorGjQPSApF_iYksRj-UZhUiCnQ@mail.gmail.com>
Message-ID: <201302061942.19271.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yannick, All,

On Friday 01 February 2013 Yannick Kiekens wrote:
> The following defconfig does not build with current git buildroot:
> 
> BR2_x86_pentiumpro=y
> BR2_TOOLCHAIN_CTNG=y
> BR2_TOOLCHAIN_CTNG_glibc=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV=y
> BR2_INIT_SYSTEMD=y
> BR2_TARGET_GENERIC_GETTY_PORT="tty1"
> BR2_TARGET_ROOTFS_EXT2=y
> # BR2_TARGET_ROOTFS_TAR is not set
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION=y
> BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.1"
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86/linux-3.7.config"
> 
> This is the qemu defconfig, modified with crosstool-ng glibc, udev & systemd
> 
> 
> Crosstool-ng appears to be in an infinite/recursive loop (configure like
> output) for a while, then exits with:

I've given a spin at your defconfig, but was not able to reproduce the
infinite loop, neither on my Debian Squeeze 64-bit, nor on the latest
stable Ubuntu 64-bit.

I also tried building the resulting crosstool-NG .config file directly
with crosstool-NG, completely outside of buildroot, and I was not able
to reproduce the inifinite loop either.

What is your host system, so I can try to reproduce the error?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

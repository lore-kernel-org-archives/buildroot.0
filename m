From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Mar 2011 14:50:14 +0100
Subject: [Buildroot] [OT?] Re:  Applying custom kernel patches
In-Reply-To: <100123.65141.qm@web161814.mail.bf1.yahoo.com>
References: <AANLkTi=_dHFneTLXe3+P1-cOM2dsLsQW6f_fgbK7hSQy@mail.gmail.com>
	<518665.81144.qm@web161818.mail.bf1.yahoo.com>
	<4D716A17.1040008@wp.pl>
	<100123.65141.qm@web161814.mail.bf1.yahoo.com>
Message-ID: <20110307145014.6fb32bec@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Steeve,

On Fri, 4 Mar 2011 14:56:28 -0800 (PST)
Steve Calfee <nospamcalfee@yahoo.com> wrote:

> Yes, Docs are always nice. For now though from my boards defconfig:
> 
> #
> # Kernel
> #
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_2_6_36=y
> # BR2_LINUX_KERNEL_CUSTOM_VERSION is not set
> # BR2_LINUX_KERNEL_CUSTOM_TARBALL is not set
> BR2_LINUX_KERNEL_VERSION="2.6.36.1"
> BR2_LINUX_KERNEL_PATCH="$(TOPDIR)/target/device/beagleboard/kernel-patches/"
> # BR2_LINUX_KERNEL_USE_DEFCONFIG is not set
> BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
> BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(TOPDIR)/target/device/beagleboard/beagleboard-linux-2.6.36.1.config"
> 
> BR2_LINUX_KERNEL_UIMAGE=y
> # BR2_LINUX_KERNEL_ZIMAGE is not set
> 
> and the files I have put in target/device:
> 
> 
> ~/buildroot/bbkernel/target/device$ tree beagleboard/
> beagleboard/
> |-- Config.in
> |-- Makefile.in
> |-- README
> |-- beagleboard-busybox-1.17.x.config
> |-- beagleboard-linux-2.6.36.1.config
> |-- beagleboard_defconfig
> |-- beagleboard_external_toolchain_defconfig
> |-- dropbear
> |   |-- dropbear_dss_host_key
> |   `-- dropbear_rsa_host_key
> |-- kernel-patches
> |   `-- linux-kernel-2.6.36-bb-xm-usb-pwr.patch
> |-- patchrootfs.sh
> |-- shadow
> `-- skeleton
>     `-- etc
>         |-- dropbear
>         |   |-- dropbear_dss_host_key
>         |   `-- dropbear_rsa_host_key
>         |-- network
>         |   `-- interfaces
>         `-- shadow
> 
> 6 directories, 16 files

This is a good organisation, even though in a recent Buildroot
(2011.02), the board-specific stuff would rather go into
board/<manufacturer>/<product>, and there would be no
board-specific Config.in and Makefile.in. The rest would look essential
the same.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Nov 2016 14:59:37 +0100
Subject: [Buildroot] Support for MPC_8323E-RDB Board
In-Reply-To: <CANO2Q2-50CT2crNwtt8s7oyh_n+s0ukZ=zqT+R_8EtKh0+jg-w@mail.gmail.com>
References: <CANO2Q2-50CT2crNwtt8s7oyh_n+s0ukZ=zqT+R_8EtKh0+jg-w@mail.gmail.com>
Message-ID: <20161104145937.174c3cb6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Nov 2016 18:03:38 +0530, Siva Prakash Reddy Nareddy wrote:

> The issues I am getting are as follows..
> 
> jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make menuconfig

Don't run Buildroot as root.

> configuration written to /home/buildroot-labs/buildroot/.config
> 
> *** End of the configuration.
> *** Execute 'make' to start the build or try 'make help'.
> 
> jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make
> boot/uboot/uboot.mk:295: *** No board defconfig name specified, check your
> BR2_TARGET_UBOOT_DEFCONFIG setting.  Stop.

This means you have enabled the U-Boot bootloader, but you have not
defined which U-Boot configuration to build, so Buildroot cannot start
the build process.

> jyothi at jyothi:/home/buildroot-labs/buildroot$ sudo make
> linux/linux.mk:441: *** No kernel device tree source specified, check your
> BR2_LINUX_KERNEL_USE_INTREE_DTS / BR2_LINUX_KERNEL_USE_CUSTOM_DTS
> settings.  Stop.

This means you have enabled the Linux kernel, with Device Tree support,
but you haven't specified which Device Tree files you want to build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

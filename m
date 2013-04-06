From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 6 Apr 2013 15:26:19 +0200
Subject: [Buildroot] Trying to configure the kernel
In-Reply-To: <1365192366.30488.205.camel@station1.ormlab.com>
References: <1365192366.30488.205.camel@station1.ormlab.com>
Message-ID: <20130406152619.7d3f29c1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ormund Williams,

On Fri, 05 Apr 2013 16:06:06 -0400, Ormund Williams wrote:

> I downloaded the latest stable release, 2013.02, then ran 'make
> menuconfig' then 'make' and it built without errors, then I wanted to
> build the kernel so did 'make menuconfig' again and turned on the kernel
> but neither of the choices 'defconfig' or 'custom config file' works
> when I try to run 'make linux-menuconfig' I get one of the 2 errors
> bellow:
>   linux/linux.mk:321: *** No kernel defconfig name specified, check your BR2_LINUX_KERNEL_DEFCONFIG setting.  Stop.
> or
>   linux/linux.mk:327: *** No kernel configuration file specified, check your BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE setting.  Stop.
> 
> I feel like I've missed a step. Have I?

Well, I thought the messages were clear enough, but it seems they are
not.

 * If you chose to use a defconfig, then you must give the name of a
   defconfig file, using the BR2_LINUX_KERNEL_DEFCONFIG option.

 * If you chose to use a kernel configuration file, then you must give
   the path to this file in BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE.

In short, there is no way to just "start the kernel configuration", you
must first give it an initial existing configuration. Maybe we should
add an option "Just run the kernel configuration with whatever defaults
for the current architecture", so that you don't have to give an
existing defconfig or an existing kernel configuration file.

What architecture and hardware are you targeting? If you're targeting
x86, then you can set BR2_LINUX_KERNEL_DEFCONFIG to 'i386', if you're
targeting x86-64, then you can set BR2_LINUX_KERNEL_DEFCONFIG to
'x86_64'. If you're targeting ARM, then you should look in the kernel
sources which defconfig in arch/arm/configs/ matches your hardware.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Oct 2018 14:14:33 +0200
Subject: [Buildroot] [PATCH v3] manual: add QEMU demo to quick start
In-Reply-To: <20181010091812.26552-1-ciro.santilli@gmail.com>
References: <20181010091812.26552-1-ciro.santilli@gmail.com>
Message-ID: <20181010141433.1e9d2b15@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 10 Oct 2018 10:18:12 +0100, Ciro Santilli wrote:
> Signed-off-by: Ciro Santilli <ciro.santilli@gmail.com>
> ---
> OK, I think this is the best way to structure the more general intro to
> configs and their docs.

It seems like you haven't taken into account my previous comment.

> +=== Try it out with QEMU
>  
> -From the buildroot directory, run
> +If you just want to emulate a simple generic QEMU system to see
> +Buildroot in action immediately, run from the buildroot directory:
> +
> +--------------------
> +make qemu_x86_64_defconfig
> +make BR2_JLEVEL="$(nproc)"
> +qemu-system-x86_64 \
> +  -M pc \
> +  -kernel output/images/bzImage \
> +  -drive file=output/images/rootfs.ext2,if=virtio,format=raw \
> +  -append "root=/dev/vda" \
> +  -net nic,model=virtio \
> +  -net user
> +--------------------

Please point the user to board/qemu/x86-64/readme.txt instead,
don't duplicate the information. And I believe the section should be
made more general, and talk about all defconfigs. Maybe a section:

"Quick start on HW platforms or Qemu"

and then describe that we have defconfigs, how to use them, that we
have readme files to explain how to use the result of the defconfigs,
etc.


> +=== Day-to-day workflow
> +
> +In your day-to-day workflow, the first step when using Buildroot is to
> +create a custom configuration.
> +
> +If you wish to use an existing configuration as your starting point,
> +first find the available configs with:
> +
> +--------------------
> + $ ls configs/
> +--------------------
> +
> +If you want to build for the Raspberry Pi 3 for example, run:
> +
> +--------------------
> + $ make raspberrypi3_64_defconfig
> +--------------------
> +
> +This command generates a +.config+ file in the root directory.
> +
> +Each defconfig is documented under:
> +
> +--------------------
> + $ board/<config-hyphenated>/readme.txt
> +--------------------
> +
> +for example:
> +
> +--------------------
> + $ less board/raspberrypi3-64/readme.txt
> +--------------------
> +
> +Next, to customize the +.config+, Buildroot has a nice configuration tool
> +similar to the one you can find in the http://www.kernel.org/[Linux kernel]
> +or in http://www.busybox.net/[BusyBox]. Run it either with

I am not sure this section "Day-to-day workflow" is very useful/makes a
lot of sense in the context of the Buildroot manual.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

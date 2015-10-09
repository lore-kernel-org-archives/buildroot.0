From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 22:54:01 +0200
Subject: [Buildroot] [PATCH v3] board: add support for ARM Juno r1
 Development Board
In-Reply-To: <e5d96cb71e852bcd3b4f0ac9a445a11d82ae7a7a.1444410355.git.jpinto@synopsys.com>
References: <e5d96cb71e852bcd3b4f0ac9a445a11d82ae7a7a.1444410355.git.jpinto@synopsys.com>
Message-ID: <20151009225401.5d109dd3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Joao Pinto,

Thanks for this new version!

On Fri,  9 Oct 2015 18:08:24 +0100, Joao Pinto wrote:
> The Juno r1 ARM Development Platform (ADP) is a software development
> platform for ARMv8-A, it includes the Juno r1 Versatile Express board 
> and an ARMv8-A reference software port available through Linaro.
> 
> Remark: The kernel' arm64 defconfig lacks a considerable amount of 
> configuration items regarding the Juno r1 board, and that is the reason
> of this custom kernel configuration file.
> 
> 

Only one empty line is needed here.


> diff --git a/board/arm/junor1/readme.txt b/board/arm/junor1/readme.txt
> new file mode 100644
> index 0000000..224078e
> --- /dev/null
> +++ b/board/arm/junor1/readme.txt
> @@ -0,0 +1,15 @@
> +This is the support for the ARM Juno r1 development board.
> +
> +Please follow the following steps to achieve the desired result:
> +
> +1. Install the root filesystem 
> +1.1 The user should format a pen-drive (ext3 is the suggested 
> +filesystem type).
> +1.2 The user should untar the resulting root filesystem (deployed in 
> +output/images/rootfs.tar) targetting the previously prepared pen-drive.
> +
> +2. Install the kernel image and Device Tree Blob
> +2.1 The user should copy the Image file (output/Images/Image) and Device
> +Tree Blob (output/build/<linux_folder>/arch/arm64/boot/dts/arm/juno-r1.dtb)
> +to the Juno r1 Board

This is wrong: you shouldn't tell users to look into output/build/. All
useful output should be in output/images/.

Also, these instructions are not very interesting: you should explain
how to actually "install" the kernel image and Device Tree blob.

Please look at other readme.txt in Buildroot to see good examples. I
think board/raspberrypi2/readme.txt is a good example.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

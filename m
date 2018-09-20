From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 13:11:40 +0200
Subject: [Buildroot] STM32F767ZI Nucleo
In-Reply-To: <a78201d496ec473681000194f412b3da@baur.at>
References: <f844ef8357b0480a9d8e8cf8e1414c44@baur.at>
 <20180920100328.3d5ff046@windsurf>
 <bd252999392341cda6bec222f0e416dc@baur.at>
 <20180920110846.006e31ac@windsurf>
 <a78201d496ec473681000194f412b3da@baur.at>
Message-ID: <20180920131140.3cba4968@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please don't top post.

On Thu, 20 Sep 2018 09:33:48 +0000, Czybor Michael wrote:

> you wrote: " I have no idea which .bin files you're talking about."
> 
> the "binary stuff" could be the bootloader, is this right?
> 
> I found four versions (not five :-)):
> 
> a.) stm32f429i-disco.bin
> b.) stm32f469i-disco.bin
> c.) stm32429i-eval.bin
> d.) stm32746g-eval.bin

These are built by the afboot-stm32 package, which indeed is the
bootloader for STM32 platforms. See
https://github.com/mcoquelin-stm32/afboot-stm32.

> But I started the build process only with one configuration?

afboot-stm32 builds a bootloader for all boards it supports, and we
install all of them.

> One more question about the device-tree-file. If I like to use UIO-Devices, than I must edit the device-tree.
> 
> 1.) Can I use UIO-Device-Drivers?

Yes, why wouldn't you be able to use them ?

> 2.) How do I input a different device tree?

Either you patch the Device Tree in your kernel tree, or add a new one
in your kernel tree. Or you can use the option
BR2_LINUX_KERNEL_CUSTOM_DTS_PATH to point to an arbitrary Device Tree
file.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

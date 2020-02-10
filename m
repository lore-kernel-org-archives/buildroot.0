From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 10 Feb 2020 14:08:39 +0100
Subject: [Buildroot] [PATCH v4 5/9] board/qemu: add defconfig file name
 as tag before the qemu command line
In-Reply-To: <20200209180327.455426-6-romain.naour@smile.fr>
References: <20200209180327.455426-1-romain.naour@smile.fr>
 <20200209180327.455426-6-romain.naour@smile.fr>
Message-ID: <20200210140839.4dab48c8@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Feb 2020 19:03:23 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> diff --git a/board/qemu/aarch64-virt/readme.txt b/board/qemu/aarch64-virt/readme.txt
> index f868905d91..3443de05a8 100644
> --- a/board/qemu/aarch64-virt/readme.txt
> +++ b/board/qemu/aarch64-virt/readme.txt
> @@ -1,6 +1,6 @@
>  Run the emulation with:
>  
> -  qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0
> +qemu_aarch64_virt_defconfig: qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0

While I understand the idea, I believe this will potentially cause some
confusing for newcomers just getting started with Buildroot, and
potentially not too familiar with Linux.

Indeed, when one sees:

"""
Run the emulation with:

SOME COMPLICATED COMMAND
"""

One will clearly copy/paste "SOME COMPLICATED COMMAND", and here it
won't work anymore. So I understand that adding this metadata helps you
grepping through the readme.txt file to find the right command, but it
makes the instructions less directly usable by their original target:
newcomers to Buildroot.

One less bad option is to do it like this:

qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -kernel output/images/Image -append "rootwait root=/dev/vda console=ttyAMA0" -netdev user,id=eth0 -device virtio-net-device,netdev=eth0 -drive file=output/images/rootfs.ext4,if=none,format=raw,id=hd0 -device virtio-blk-device,drive=hd0 # qemu_aarch64_virt_defconfig

This way, the information is still encoded on the same line, but it's a
comment, so if a newcomer copy/pastes that command line, it will really
work.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

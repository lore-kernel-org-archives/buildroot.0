From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Nov 2013 09:27:15 +0100
Subject: [Buildroot] [PATCH 2/5] package/rpi-firmware: add option to
 install firmware files in target/boot/
In-Reply-To: <1108197933.15379580.1385712019266.JavaMail.root@openwide.fr>
References: <20131128205515.GB3337@free.fr>
 <1108197933.15379580.1385712019266.JavaMail.root@openwide.fr>
Message-ID: <20131129092715.24d2b199@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jeremy Rosen,

On Fri, 29 Nov 2013 09:00:19 +0100 (CET), Jeremy Rosen wrote:

> Basically, you build the root filesystem the way it will look when all
> sub-filesystems are mounted, you describe how they are mounted and 
> the system builds the partitions accordingly.

I don't necessarily agree here, because this strategy makes the
confusion between two things:

 * The contents of the /boot directory in the root filesystem.

 * The contents of the boot partition needed for some platforms (OMAP,
   RPi, UEFI-based x86 platforms, etc.)

Those are two different things, and Yann's proposal merges them. As an
example, provided your bootloader has ext3 support and you're on an
OMAP platform, you may want to have something like:

 * The /boot directory in the root filesystem contains the kernel image
   (uImage, zImage)

 * The boot partition contains just the bootloader images (MLO,
   u-boot.img).

There is no point to have the kernel image in the boot partition, and
there is no point in having the bootloader images in the /boot
directory of the root filesystem.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

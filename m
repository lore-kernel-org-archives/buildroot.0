From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 10:02:52 +0200
Subject: [Buildroot] first boot
In-Reply-To: <CAFo83mF5uCs5ULg-c9pz+9JoXE5e5tBbiYZ3w+db-yEXDxnpgQ@mail.gmail.com>
References: <CAFo83mF5uCs5ULg-c9pz+9JoXE5e5tBbiYZ3w+db-yEXDxnpgQ@mail.gmail.com>
Message-ID: <20141016100252.3506b1f4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jed Evnull,

On Wed, 15 Oct 2014 16:58:40 -0400, Jed Evnull wrote:

> qemu-system-arm -M versatilepb -kernel output/images/uImage -drive
> file=output/images/rootfs.ext2,if=scsi -append
> "root=/home/jeff/buildroot/output/images/filesystem.img

This has no chance of working. From the point of view of the kernel
running inside Qemu, a path like /home/jeff/... doesn't make any sense.

If you want to get started with a Qemu ARM platform, please do:

	make clean
	make qemu_arm_versatile_defconfig
	make

And then read board/qemu/arm-versatile/readme.txt, which will tell you
which Qemu command to use to test the generated system.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

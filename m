From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 3 Aug 2016 12:23:15 +0200
Subject: [Buildroot] Buildroot x86 hangs at login prompt
In-Reply-To: <DUB121-W314693264DAEF982A175ADF060@phx.gbl>
References: <DUB121-W3D8EC5A65EEC9FB579DC1DF060@phx.gbl>
 <DUB121-W314693264DAEF982A175ADF060@phx.gbl>
Message-ID: <20160803122315.2f5ae4f6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 3 Aug 2016 10:19:31 +0200, ?lvaro L?pez L?pez wrote:

> - Internal toolchain with uClibc with Linux kernel headers 4.4.11 (option 4.4.x).
> - Dev management with devtmpfs only.
> - Init system: BusyBox.
> - Bootloader: Grub2.
> - Filesystem type: ext4.

> - Kernel sources: the ones from Ubuntu 16.04 LTS related to kernel
> 4.4.0-31-generic, which seems to be based on Kernel 4.4.13 (as
> modules where installed in /lib/modules/4.4.13 folder). Config taken
> from the /usr/src/4.4.0-31.generic folder.

As explained on IRC, using the stock Ubuntu kernel configuration is
most likely not going to work. The Ubuntu kernel configuration builds
lots of drivers as modules, and since you selected "devtmpfs only"
for /dev, there is no mechanism to automatically load the necessary
module matching your HW.

Therefore, I would suggest to use pc_x86_64_bios_defconfig or
pc_x86_64_efi_defconfig, which have conveniently been provided by
Gustavo. If you have a 32 bits only system, then use
pc_x86_64_bios_defconfig, and simply change the target architecture to
i386.

See also board/pc/readme.txt for more details.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

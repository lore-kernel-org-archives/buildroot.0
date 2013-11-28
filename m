From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 28 Nov 2013 21:08:34 +0100
Subject: [Buildroot] [PATCH 3/5] package/rpi-firmware: move to
 bootloaders menu
In-Reply-To: <869fff522738fdd927541a3e3a303f97143f8469.1385157864.git.yann.morin.1998@free.fr>
References: <cover.1385157864.git.yann.morin.1998@free.fr>
 <869fff522738fdd927541a3e3a303f97143f8469.1385157864.git.yann.morin.1998@free.fr>
Message-ID: <20131128210834.3c78df23@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Fri, 22 Nov 2013 23:50:56 +0100, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> rpi-firmware, although it does contain the GPU firmware, also serves as
> the bootloader. As a reminder, here is an overview of how the RPi boots:
>   - GPU exits reset
>   - GPU loads its firmware from the first, FAT32-formatted partition
>   - GPU reads its config file from the same partition
>   - GPU loads kernel from the same partition, into RAM
>   - GPU de-asserts the reset of the ARM core (CPU)
>   - CPU exits reset and starts executing kernel code
> 
> So, although the largest part of rpi-firmware is indeed the GPU firmware,
> the first purpose it serves is as a bootloader for the ARM core.
> 
> People that do not want to use the GPU (eg. headless, no multimedia...)
> will still want to select rpi-firmware.
> 
> Having rpi-firmware in target packages -> hardware-handling -> firmware
> is a bit misleading in this case.
> 
> Hence, move rpi-firmware from the target packages submenu, into the
> bootloaders submenu.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

I must say I am not entirely convinced this change is necessary.
rpi-firmware is a much bootloader stuff than GPU/OpenGL stuff, so
deciding whether it should be in Bootloaders or in Packages -> Hardware
handling is difficult. And since it has now been in Packages ->
Hardware Handling for a long time, and that moving it to the
Bootloaders section involves renaming a number of Config.in options and
therefore adding some Config.in.legacy blurb, I'm not sure it's worth
the effort.

And in any case, if we decided to do this, it should be done *before*
your PATCH 1/5 that adds 4 additional Config.in symbols, which we
wouldn't have to carry in Config.in.legacy, because they are new.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

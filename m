From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Jul 2012 14:30:08 +0200
Subject: [Buildroot] [PATCH] Add support for the Calao-systems USB-A9263
In-Reply-To: <4FF6BA67.3070207@calao-systems.com>
References: <4FF6BA67.3070207@calao-systems.com>
Message-ID: <20120706143008.64d0e023@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Gr?gory,

Le Fri, 06 Jul 2012 12:13:59 +0200,
gregory hermant <gregory.hermant@calao-systems.com> a ?crit :

> Hi,
> Attached a patch for the USB-A9263.
> More info at <http://www.calao-systems.com>. 
> 
> 
> Signed-off-by: Gregory Hermant <gregory.hermant@calao-systems.com>
> ---
>  .../usb-a9263/at91bootstrap-1.16-usb-a9263.patch   |  851 ++++++++++
>  board/calao/usb-a9263/usb-a9263_defconfig          | 1662 ++++++++++++++++++++
>  configs/usb_a9263_defconfig                        | 1247 +++++++++++++++
>  3 files changed, 3760 insertions(+), 0 deletions(-)
>  create mode 100644 board/calao/usb-a9263/at91bootstrap-1.16-usb-a9263.patch
>  create mode 100644 board/calao/usb-a9263/usb-a9263_defconfig
>  create mode 100644 configs/usb_a9263_defconfig

Thanks for this contribution.

Both the kernel configuration and the bootloader configuration, we
prefer to use defconfig files, which are smaller.

To generate the Buildroot defconfig file:

	make savedefconfig

To generate the Linux defconfig file:

	make linux-savedefconfig

Also, do you know if at some point Atmel will create an upstream for
at91bootstrap? I've seen they have created some Github repository with
at91bootstrap sources. I'm a bit worried about integrating a patch that
has no upstream to be submitted, which means that we will have to carry
it around forever.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

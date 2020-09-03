From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 21:08:11 +0200
Subject: [Buildroot] [PATCH 1/1] board/pcengines/apu2: add config
In-Reply-To: <20191005024023.40f198c9@x2000>
References: <20191005024023.40f198c9@x2000>
Message-ID: <20200903210811.14e68358@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 5 Oct 2019 02:40:23 +0200
Danilo Bargen <mail@dbrgn.ch> wrote:

> The apu2 by PC Engines is a 64 bit single board computer with coreboot
> BIOS. It only has serial output, but no graphics chip. With its 2?4
> ethernet ports, it is often used to build a firewall or router.
> 
> The provided defconfig configures busybox and isolinux. It will output a
> hybrid ISO image that can be written to a USB stick or burned to a CD.
> 
> Configuration based on a blogpost by Tony Arkles:
> 
> http://www.better-bsp.com/blog/2017/03/02/buildrooting-for-apu2/
> 
> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
> ---
>  DEVELOPERS                        |  4 +++
>  board/pcengines/apu2/isolinux.cfg |  6 ++++
>  board/pcengines/apu2/linux.config | 51 +++++++++++++++++++++++++++++++
>  board/pcengines/apu2/readme.txt   | 40 ++++++++++++++++++++++++
>  configs/pcengines_apu2_defconfig  | 16 ++++++++++
>  5 files changed, 117 insertions(+)
>  create mode 100644 board/pcengines/apu2/isolinux.cfg
>  create mode 100644 board/pcengines/apu2/linux.config
>  create mode 100644 board/pcengines/apu2/readme.txt
>  create mode 100644 configs/pcengines_apu2_defconfig

Sorry for the long delay. I've applied to our master branch, with just
a fix to the commit title and the indentation of the DEVELOPERS file.
Of course, if you want to send a further update to upgrade the kernel
to a newer version, that would be nice. Another nice improvement would
be to select a more specific CPU than just "x86-64", i.e you could
select the specific x86-64 CPU that the APU2 is using.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

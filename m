From: =?ISO-8859-1?Q?Thiago_A._Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 4 Jan 2008 10:59:33 -0200
Subject: [Buildroot] [PATCH] Create /boot/uImage symlink to the
	currentkernel image
In-Reply-To: <00fc01c84eb0$07a3e010$0a0514ac@atmel.com>
References: <d6cda7730801031650i439f5821h566eeef460615172@mail.gmail.com>
	<00fc01c84eb0$07a3e010$0a0514ac@atmel.com>
Message-ID: <d6cda7730801040459n63079d3evfc12f2c72420079c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Maybe someone might want to have more than one kernel in /boot if they
are different versions (but would be awkward to get it, since would
require make menuconfig; make; make menuconfig again to change
settings then make once again). For different platforms doesn't make
sense, since the system wouldn't boot. You can't have different
busybox on the same filesystem. Besides why would you keep 2 kernels
with different and incompatible binaries?

About the u-boot scripts, it is equaly bad to have to reflash u-boot
all the time, whenever I try some different kernel setting or I want
to rebuild everything from scratch. An STK1000 owner for instance
might just use an USB Card Reader and not have a JTAG MKii.

This uImage linking is optional, while the naming is imposed.

Regards,
   Thiago A. Correa

On Jan 4, 2008 5:50 AM, Ulf Samuelsson <ulf.samuelsson@atmel.com> wrote:
>
>
>
> | Hi,
> |
> |   A while ago, the kernel naming have been changed to include $(DATE)
> | which makes it annoying to keep track. This patch adds an option to
> | the Advanced Kernel option to create an /boot/uImage symbolic link to
> | the built kernel. Please consider applying, this really improves
> | usability, if this naming scheme is to be kept.
> |
> | Kind Regards,
> |    Thiago A. Correa
> |
>
> Maybe,
> How do you store three different kernels in "/boot", if they have the same name?
> This could be for three different architectures, or three different versions.
>
> The AT91 U-Boot makes it real easy to use the long kernel names.
> If you generate an autoscript for U-boot then it will be as easy to do for other
> architectures as well.
>
> Best Regards
> Ulf Samuelsson
>
>

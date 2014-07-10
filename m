From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 10 Jul 2014 11:22:20 -0700
Subject: [Buildroot] [PATCH] nitrogen6x: include .dtb files for
	compatible variants
In-Reply-To: <20140710172818.GE28300@free.fr>
References: <a913d991bd0534d192982537a25388705c80c728.1404164261.git.yann.morin.1998@free.fr>
 <1405012684-30163-1-git-send-email-eric.nelson@boundarydevices.com>
 <20140710172818.GE28300@free.fr>
Message-ID: <CADCpmyOL9bGFzjKe-4NRZ2Fwm7o-q8jzJ+u0McyfQeWqbPZyQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Eric, All,

What about the bootloader configuration? I know the same bootloader will
work the same for sabrelite and nitrogen6q. However for the max and dl
versions I guess need another config as the DCD table will be different. Do
we want to create other defconfigs?

Regards,
Gary


On Thu, Jul 10, 2014 at 10:28 AM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Eric, Hadrien, All,
>
> On 2014-07-10 10:18 -0700, Eric Nelson spake thusly:
> > The Boundary Devices Nitrogen6X comes in a number of variants
> > with different processors, and the kernel and userspace is
> > compatible with the SABRE Lite (BD-SL-i.MX6), Nitrogen6_Lite,
> > and Nitrogen6_Max boards.
> >
> > This patch adds support for these boards through the
> > corresponding .dtb files.
> >
> > Signed-off-by: Eric Nelson <eric.nelson@boundarydevices.com>
>
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Hadrien, I think you have a few of the affected boards. Care to add this
> patch to the imx series and report on it, please?
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  configs/nitrogen6x_defconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
> > index da2a7e8..04db23a 100644
> > --- a/configs/nitrogen6x_defconfig
> > +++ b/configs/nitrogen6x_defconfig
> > @@ -26,4 +26,4 @@ BR2_LINUX_KERNEL_DEFCONFIG="nitrogen6x"
> >  BR2_LINUX_KERNEL_INSTALL_TARGET=y
> >  BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x10008000"
> >  BR2_LINUX_KERNEL_DTS_SUPPORT=y
> > -BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-nitrogen6x"
> > +BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-nit6xlite imx6dl-nitrogen6_max
> imx6dl-nitrogen6x imx6q-nitrogen6_max imx6q-nitrogen6x imx6q-sabrelite"
> > --
> > 1.9.1
> >
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>       |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
> conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140710/3685b57f/attachment.html>

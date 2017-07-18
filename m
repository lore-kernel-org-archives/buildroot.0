From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue, 18 Jul 2017 14:38:03 +0200
Subject: [Buildroot] [RFC] kernel-module-imx-gpu-viv:compaling error
In-Reply-To: <1500375085852-171182.post@n4.nabble.com>
References: <1500358371269-171162.post@n4.nabble.com>
 <20170718100720.39028066@windsurf>
 <CAAMH-ysnm5JMQnAJ4jQJS700o1tDE6tKeW0-niz8eBdRRQXWSQ@mail.gmail.com>
 <20170718110245.1f85dafb@windsurf.lan>
 <1500375085852-171182.post@n4.nabble.com>
Message-ID: <CAAMH-ytxV3-GON2BFshFDZ4TvDtFF4yjttXShK7O-K63B+WMCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Refik,

On Tue, Jul 18, 2017 at 12:51 PM, Refik Tuzakl? <tuzaklirefik@gmail.com> wrote:
> Thomas Petazzoni-2 wrote
>> Hello,
>>
>> On Tue, 18 Jul 2017 10:33:18 +0200, Gary Bisson wrote:
>>
>>> > Please indicate the Buildroot version being used, and provide the
>>> > Buildroot .config file that allows to reproduce this issue.
>>> >
>>> > But I believe the answer is pretty simple: you're trying to build the
>>> > i.MX GPU Vivante kernel module against Linux 4.11, and the i.MX GPU
>>> > Vivante kernel module hasn't been modified to work with such a recent
>>> > Linux kernel.
>>> >
>>> > I believe the i.MX GPU Vivante kernel module is most likely designed to
>>> > work with the Linux 4.1 based BSP provided by Freescale/NXP.
>>>
>>> Thomas is correct, this GPU module is only meant for NXP-based kernels
>>> from 3.10.x to 4.1.x.
>>
>> Perhaps we should update the Config.in help text of the
>> kernel-module-imx-gpu-viv package to indicate this ?
>>
>> I know people don't read the help text, but at least when it exists, we
>> can point them to the help text, and the fact that they should read the
>> documentation :-)
>>
>> Best regards,
>>
>> Thomas
>> --
>> Thomas Petazzoni, CTO, Free Electrons
>> Embedded Linux and Kernel engineering
>> http://free-electrons.com
>> _______________________________________________
>> buildroot mailing list
>
>> buildroot@
>
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
> Thanks for your quick replay,
>
>
> how can use Linux 4.1 based BSP provided by Freescale/NXP on buildroot. Is
> it enought to change kernel version to 4.1 under kernel and toolchain in
> Buildroot or should it be more specific like 4.1.15 as in Freescale website?

It depends on the platform you are using, but the standard
NXP/Freescale linux kernel can be found here:
http://git.freescale.com/git/cgit.cgi/imx/linux-imx.git/

You can have a look at the Freescale SABRE Smart Device Buildroot configuration:
https://git.buildroot.net/buildroot/tree/configs/freescale_imx6qsabresd_defconfig#n20

Regards,
Gary

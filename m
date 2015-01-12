From: Lou Crittenden <loucrittenden63@gmail.com>
Date: Mon, 12 Jan 2015 01:39:27 -0600
Subject: [Buildroot] Fwd: Fwd: Fwd: Fwd: [PATCH v3] linux: add fbtft
 kernel extension
In-Reply-To: <trinity-0351e62a-02eb-4e90-af63-3adc4b54e0d5-1421047797601@3capp-gmx-bs66>
References: <trinity-1ce487a2-4744-40b5-881f-77436e223543-1421020939196@3capp-gmx-bs65>
 <CAFGceHHN+TNZZVisChr2vSmfJNihcEnWSTxEuF1bit3pDDBEvw@mail.gmail.com>
 <trinity-0351e62a-02eb-4e90-af63-3adc4b54e0d5-1421047797601@3capp-gmx-bs66>
Message-ID: <CAFGceHHdGaDW-HZJJWokJYhC1zW0GOBY=FRsjT73=7ZUhrUnbw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Here's my latest buildroot config for your consideration. At least we know
it works.

On Mon, Jan 12, 2015 at 1:29 AM, Peter Seiderer <ps.report@gmx.net> wrote:

> Hello Lou,
>
> > Gesendet: Montag, 12. Januar 2015 um 05:55 Uhr
> > Von: "Lou Crittenden" <loucrittenden63@gmail.com>
> > An: "Peter Seiderer" <ps.report@gmx.net>, buildroot at busybox.net
> > Betreff: Re: Fwd: Fwd: Fwd: Fwd: [Buildroot] [PATCH v3] linux: add fbtft
> kernel extension
> >
> > Good news! The screen works, however the orientation is portrait instead
> of landscape and I'd
> > like it to be landscape. Also, how do I make this driver load on boot so
> I do not have to
> > keep loading "insmod
> /lib/modules/3.12.28/kernel/drivers/video/fbtft/fbtft_device.ko
> name=waveshare32b"
> > every time, so I can have this screen be the default? I also want to
> load the ads7846
> > touchscreen driver as well for touchscreen.
>
> The rotation part is the easy one, try
>
> $ insmod /lib/modules/3.12.28/kernel/drivers/video/fbtft/fbtft_device.ko
> name=waveshare32b rotation=90
>
> The automatic loading should work with the /etc/modules-load.d/fbtft.conf
> and /etc/modprobe.d/00-fbtft.conf
> entries (do not forget to add rotation=90 to 00-fbtft-conf), but I have to
> take a closer look at your
> buildroot config whats missing or is different from my one, needs some
> time ;-)
>
> For the touchscreen try [1]...
>
> > Again, thanks a bunch.
>
> Your welcome,
> Peter
>
> [1] http://lists.busybox.net/pipermail/buildroot/2015-January/116799.html
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150112/d81811f4/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 79732 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150112/d81811f4/attachment-0001.obj>

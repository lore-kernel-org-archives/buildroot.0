From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 12 Jan 2015 08:29:57 +0100
Subject: [Buildroot] Fwd: Fwd: Fwd: Fwd: [PATCH v3] linux: add fbtft
 kernel extension
In-Reply-To: <CAFGceHHN+TNZZVisChr2vSmfJNihcEnWSTxEuF1bit3pDDBEvw@mail.gmail.com>
References: <trinity-1ce487a2-4744-40b5-881f-77436e223543-1421020939196@3capp-gmx-bs65>, 
 <CAFGceHHN+TNZZVisChr2vSmfJNihcEnWSTxEuF1bit3pDDBEvw@mail.gmail.com>
Message-ID: <trinity-0351e62a-02eb-4e90-af63-3adc4b54e0d5-1421047797601@3capp-gmx-bs66>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Lou,

> Gesendet:?Montag, 12. Januar 2015 um 05:55 Uhr
> Von:?"Lou Crittenden" <loucrittenden63@gmail.com>
> An:?"Peter Seiderer" <ps.report@gmx.net>, buildroot at busybox.net
> Betreff:?Re: Fwd: Fwd: Fwd: Fwd: [Buildroot] [PATCH v3] linux: add fbtft kernel extension
> 
> Good news! The screen works, however the orientation is portrait instead of landscape and I'd
> like it to be landscape. Also, how do I make this driver load on boot so I do not have to
> keep loading "insmod /lib/modules/3.12.28/kernel/drivers/video/fbtft/fbtft_device.ko name=waveshare32b"
> every time, so I can have this screen be the default? I also want to load the ads7846
> touchscreen driver as well for touchscreen.

The rotation part is the easy one, try

$ insmod /lib/modules/3.12.28/kernel/drivers/video/fbtft/fbtft_device.ko name=waveshare32b rotation=90

The automatic loading should work with the /etc/modules-load.d/fbtft.conf and /etc/modprobe.d/00-fbtft.conf
entries (do not forget to add rotation=90 to 00-fbtft-conf), but I have to take a closer look at your
buildroot config whats missing or is different from my one, needs some time ;-)

For the touchscreen try [1]...

> Again, thanks a bunch.

Your welcome,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2015-January/116799.html

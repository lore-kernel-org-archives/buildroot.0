From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 22:42:06 +0100
Subject: [Buildroot] [PATCH] rpi-bt-firmware: new package
In-Reply-To: <20170320213039.wlpa2tdplbon6f2n@tarshish>
References: <094f74654295373c7cadd47044cbcfb9a80d8c87.1489093234.git.baruch@tkos.co.il>
 <20170319220043.6f819196@free-electrons.com>
 <20170320213039.wlpa2tdplbon6f2n@tarshish>
Message-ID: <20170320224206.33fa1dbb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 20 Mar 2017 23:30:39 +0200, Baruch Siach wrote:

> Do you have any indication that this is indeed the same file that RPi uses? My 
> impression was that this firmware is tailored specifically for the RPi board, 
> but I don't know for sure. That fact that Broadcom licenses the file may 
> indicate that this is the same one. But ...
> 
> > So perhaps the package should be bcrm-43430-firmware or something along
> > those lines.
> > 
> >   
> > > +RPI_BT_FIRMWARE_VERSION = a439f892bf549ddfefa9ba7ad1999cc515f233bf
> > > +RPI_BT_FIRMWARE_SITE = https://aur.archlinux.org/pi-bluetooth.git  
> > 
> > Is there a better upstream than this? I found
> > https://github.com/varigit/bcm_4343w_fw but I'm not sure it really
> > qualifies as "better".  
> 
> ... this is not the same file:
> 
> ls -l bcm43430a1.hcd pi-bluetooth/BCM43430A1.hcd 
> -rw-r--r-- 1 baruch baruch 14265 Mar 20 23:22 bcm43430a1.hcd
> -rw-r--r-- 1 baruch baruch 35976 Jan 17 12:25 pi-bluetooth/BCM43430A1.hcd

Gaah, what a mess. Why don't they just post it for integration in the
linux-firmware project? Why is it that RPi people always have to do
things the weird way?

> I have not tested the Variscite firmware on the RPi, though. There is a small 
> chance it might damage the hardware.
> 
> And since the git repo we use is named 'pi-bluetooth' maybe rpi-bt-firmware is 
> not such a bad name after all.

Yeah, indeed :-/

Can you resend the patch with just an extended explanation as to why
the package is named this way, and the fact that even though the
WiFi chip isn't RPi specific, the firmware might be.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

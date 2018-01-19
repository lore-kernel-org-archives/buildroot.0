From: daggs <daggs@gmx.com>
Date: Fri, 19 Jan 2018 13:45:25 +0100
Subject: [Buildroot] [PATCH v2] tvheadend: add dependency on udev
In-Reply-To: <2fdqiexfnk.ln2@ID-313208.user.individual.net>
References: <20180105093501.5793-1-daggs@gmx.com> <20180105225459.GC3673@scaer>
 <5ffjiex4oj.ln2@ID-313208.user.individual.net>
 <trinity-2e15bf47-914d-4de7-9461-34ddbcc6c51d-1515859378864@3c-app-mailcom-bs05>
 <2fdqiexfnk.ln2@ID-313208.user.individual.net>
Message-ID: <trinity-f3a8c702-3a80-4488-9bbd-7ad6ab4ec0c1-1516365925815@3c-app-mailcom-bs14>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Bernd,

> Sent: Sunday, January 14, 2018 at 12:22 AM
> From: "Bernd Kuhls" <bernd.kuhls@t-online.de>
> To: buildroot at uclibc.org
> Subject: Re: [Buildroot] [PATCH v2] tvheadend: add dependency on udev
>
> Am Sat, 13 Jan 2018 17:02:58 +0100 schrieb daggs:
> 
> > btw, just want to know, do you use a usb adapter?
> 
> Hi daggs,
> 
> yes, here are some snippets from lsusb -vv:
> 
> Bus 001 Device 006: ID 0b48:3017 TechnoTrend AG
>   iManufacturer           1 CityCom GmbH
>   iProduct                2 TechnoTrend USB2.0
> 
> https://cateee.net/lkddb/web-lkddb/DVB_USB_DVBSKY.html
this device is similar to what I have.

> 
> I am using tvheadend on a buildroot-built linux distro (fli4l) which does 
> not contain udev but uses BR2_ROOTFS_DEVICE_CREATION_STATIC=y, for this 
> distro I created personal packages adding the function I need. Therefore 
> I do not use buildroot-provided init scripts but instead coded my own 
> init script for tvheadend which suits my needs and works fine without an 
> udev daemon. For Kodi I need libudev[1] support for detecting my CEC-USB 
> adapter but again, no udev daemon needed.
> 
> My init scripts only contain one hardware-specific command relating to 
> tvheadend:
> 
> modprobe dvb_usb_dvbsky
> 
> Everything else worked out-of-the box after configuring all the kernel 
> modules needed for my USB device.
> 
> Regards, Bernd
> 
> [1] https://github.com/bkuhls/buildroot/tree/libudev

maybe this is what I need too. BR2_ROOTFS_DEVICE_CREATION_STATIC=y and modprobe the modules right before tvheadend boots.

I'll look into it.

Dagg.

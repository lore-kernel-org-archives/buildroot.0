From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 13 Apr 2007 00:09:42 +0200
Subject: [Buildroot] Building external modules
References: <20070412190016.e4i0x2reg4vko48w@www.kvas.at>
Message-ID: <001b01c77d8a$fd4c66b0$0402a8c0@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: <gernot@kvas.at>
To: <buildroot@uclibc.org>
Sent: Thursday, April 12, 2007 7:00 PM
Subject: [Buildroot] Building external modules


> Hello,
> 
> Is there a "best practice" to include external modules in buildroot,  
> get them built and insert them at the right spot in the rootfs?
> 
> I currently maintain my own board in target/device. It downloads and  
> builds its own kernel, so I have the source for Kbuild to build  
> against. I'm just wondering if somebody has done it before, as I  
> assume that especially embedded system need some exotic drivers.
> 
> Cheers,
> 
> Gernot


There are plenty of examples in the "packages" directory.

Take an arbitrary directory inside that directory,
copy it and rename to copy to the name of your external module
Update the config.in and <package>.mk files in the new
directory, remove any patches and update "packages/Config.on"

/done

If you want to have linux kernel modules, you can patch the linux kernel
after it is unpacked, and then the linux26.mk will insert the module
in the correct place.

Best Regards
Ulf Samuelsson

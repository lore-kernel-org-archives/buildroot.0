From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Jul 2012 14:32:12 +0200
Subject: [Buildroot] Barcode reader (rs232 + usb device) on buildroot
In-Reply-To: <jt6hgi$394$1@dough.gmane.org>
References: <jt6hgi$394$1@dough.gmane.org>
Message-ID: <20120706143212.13cf26e8@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 06 Jul 2012 13:17:38 +0200,
Willy <willy@willygroup.org> a ?crit :

> I've a barcode reader with RS232 and USB interfaces.
> In my host pc with Ubuntu 10.04 64bit I use it in both way without 
> problems.
> in serial mode I retrieve the device at /dev/ttyS0
> In USB mode (directly with USB or whit RS232/USB adaptor) I retrieve the 
> device at /dev/ttyUSB0
> 
> With buildroot in serial mode I read the code (and some error strings, 
> [probably a configuration error])
> in USB mode I can't read anything: I don't have /dev/ttyUSB*
> 
> I think something is missing, but in buildroot and kernel configuration 
> I can't figured out what is it... :(
> 
> Someone can give me an hint?

You probably lack the usbserial driver, and maybe some other underlying
usb serial driver. Depends on what your hardware is exactly. The
problem is definitely not Buildroot related, but kernel configuration
related.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

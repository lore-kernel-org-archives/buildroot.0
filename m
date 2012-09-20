From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Sep 2012 12:22:57 +0200
Subject: [Buildroot] [PATCH v2 1/2] pcsc-lite: new package
In-Reply-To: <99B09243E1A5DA4898CDD8B70011144818039905B8@EXMB04.eu.tieto.com>
References: <1348059150-32601-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
 <20120919164706.0e38b54d@skate>
 <99B09243E1A5DA4898CDD8B70011144818039905B8@EXMB04.eu.tieto.com>
Message-ID: <20120920122257.359e35d6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Waldemar Rymarkiewicz,

On Thu, 20 Sep 2012 09:10:26 +0300, Waldemar.Rymarkiewicz at tieto.com
wrote:

> >Why when udev is available you don't do need libusb? Also, if udev is
> >available, you need to add it to the list of dependencies.
> 
> This is how pcsc-lite  ./configure  works. 
> 
> Firstly, libudev and libusb can't be used together. That means if you --enable-libusb you have to --disable-libudev (by default is enabled) explicitly.
> 
> Secondly,  ./configure gives priority to libudev to be used if found, otherwise it searches for libusb.
> 
> Finally, Neither libusb nor libudev can be found then no usb devices are used (serial only). Then --disable-libudev --disable-libusb will still compile. 
> 
> The only concern I have now it that user has to know this dependencies and select libusb or libudev explicitly. So wandering if not to require libusb or libudev in this package. What's your opinion?

Samuel and Arnout have replied on the ways to make it possible.

On my side, I'm still surprised that either udev or libusb are needed.
They do really two different things, and I don't see how having udev
can replace what libusb is doing, except if libusb is only used for USB
device enumeration, and not access to the USB devices themselves. But I
haven't looked at the code.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

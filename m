From: hartleys <hartleys@visionengravers.com>
Date: Wed, 18 Jun 2008 17:41:36 -0400
Subject: [Buildroot] Problem building usbutils
In-Reply-To: <871w2v9lm9.fsf@macbook.be.48ers.dk>
References: <BD79186B4FD85F4B8E60E381CAEE190918280F@mi8nycmail19.Mi8.com>
	<871w2v9lm9.fsf@macbook.be.48ers.dk>
Message-ID: <BD79186B4FD85F4B8E60E381CAEE1909182D84@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard write:
> > 1) usbutils requires libusb This was the easy one. I just
> > needed to select the libusb package. But, shouldn't the  
> > Config.in for usbutils select it automatically?
>
> Yes, fixed in trunk.
>
> > 2) configure for usbutils outputs error: get libusb 0.1.8
> > or newer Not sure how to fix this one. The libusb in
> > buildroot is 0.1.12. It built fine and the library is in my
> > build_arm/staging_dir/usb/lib directory. For some reason
> > it's not being found. Can anyone offer so insite on what I
> > might have setup wrong?
>
> Strange, it builds here (i386).
>
> Could you provide more details, please?

Hello Peter,

I'm building for an arm platform using an extern uclibc-based toolchain.

The libusb package builds fine in build_arm/libusb-0.1.12 and library
file is placed in the build_arm/staging_dir/usr/lib directory. And when
the final root filesystem is created the library file is in
root/usr/lib.

If I then enable the usbutils package and try to run the build it gets
to the configure stage for usbutils and stops at:

Checking for usb_get_string_simple in -lusb... No
Configure: error: get libusb 0.1.8 or newer

I looked at the source for libusb-0.1.12 and the usb_get_string_simple
function does exist in usb.c and is prototyped in usb.h so it should be
available.

The only thing I can figure is the make process is not including my
build_arm/staging_dir/usb/lib in the library search path.

Is there anyway to output this information to verify?

Thanks,
Hartley

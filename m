From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Oct 2019 23:30:16 +0200
Subject: [Buildroot] [PATCH] package/qemu: enable usb passthrough on
 host variant
In-Reply-To: <20191024223639.28125bf8@windsurf.home> (Thomas Petazzoni's
 message of "Thu, 24 Oct 2019 22:36:39 +0200")
References: <20191024202820.18814-1-angelo@amarulasolutions.com>
 <20191024223639.28125bf8@windsurf.home>
Message-ID: <87h83x4ys7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 >> +ifeq ($(BR2_PACKAGE_LIBUSB),y)

 > So, if the target libusb package is enabled...

 >> +HOST_QEMU_OPTS += --enable-libusb
 >> +HOST_QEMU_DEPENDENCIES += host-libusb

 > ... you assume the user wants libusb support in host-qemu.

 > Sorry, but this is not good. Add an option in
 > package/qemu/Config.in.host to enable USB passthrough, and use that in
 > qemu.mk.

And pass --disable-libusb (if such option exists) in the else clause.

-- 
Bye, Peter Korsgaard

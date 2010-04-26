From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Apr 2010 09:02:15 +0200
Subject: [Buildroot] /dev/bus/usb on BR
In-Reply-To: <p2l630286c71004252341l5ed447f0sd5cb0c0bf3c68a75@mail.gmail.com>
	(Nataraj S. Narayan's message of "Mon, 26 Apr 2010 06:41:21 +0000")
References: <p2l630286c71004252341l5ed447f0sd5cb0c0bf3c68a75@mail.gmail.com>
Message-ID: <87tyqy4ryg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nataraj" == Nataraj S Narayan <natarajsn@gmail.com> writes:

 Nataraj> Hi
 Nataraj> I am on BR git latest.

 Nataraj> I am connecting a Upek fingerprint device to my At91sam9263ek SBC with
 Nataraj> linux-2.6.32 and BR file system using glibc based Codesourcery
 Nataraj> external toolchain.

 Nataraj> Adding the device doesn't add nodes into /proc/bus/usb even though i
 Nataraj> get the following after connecting device.

Your title said /dev/bus/usb, but here you say /proc - /proc/bus/usb is
handled by usbfs, whereas /dev/bus/usb is handled by udev/mdev. Which
one do you mean?

 Nataraj> The same code works well on qemu emulated arm-linux libc
 Nataraj> system ,where the usb system got /dev/bus/usb with populated
 Nataraj> nodes.

What's the difference between that rootfs and this one? Does it work on
your AT91 if you use the qemu rootfs?

-- 
Bye, Peter Korsgaard

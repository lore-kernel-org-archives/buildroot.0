From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Mon, 26 Apr 2010 06:41:21 +0000
Subject: [Buildroot] /dev/bus/usb on BR
Message-ID: <p2l630286c71004252341l5ed447f0sd5cb0c0bf3c68a75@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

I am on BR git latest.

I am connecting a Upek fingerprint device to my At91sam9263ek SBC with
linux-2.6.32 and BR file system using glibc based Codesourcery
external toolchain.

Adding the device doesn't add nodes into /proc/bus/usb even though i
get the following after connecting device.

# usb 1-1: new full speed USB device using at91_ohci and address 4
usb 1-1: configuration #1 chosen from 1 choice

I use udev.

My code needs to to open the Usb port using:-

status = PTOpen ("usb, timeout=2000", &mConn);

The same code works well on qemu emulated arm-linux libc system ,where
the usb system got /dev/bus/usb with populated nodes.

What am I lacking in the file system?

Warm regards

nataraj

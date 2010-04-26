From: Ravi Kumar Kulkarni <ravilinux4u@gmail.com>
Date: Mon, 26 Apr 2010 12:37:44 +0545
Subject: [Buildroot] /dev/bus/usb on BR
In-Reply-To: <p2l630286c71004252341l5ed447f0sd5cb0c0bf3c68a75@mail.gmail.com>
References: <p2l630286c71004252341l5ed447f0sd5cb0c0bf3c68a75@mail.gmail.com>
Message-ID: <m2k532dd5841004252352jdc881088y588d57d5fbde19a6@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Apr 26, 2010 at 12:26 PM, Nataraj S Narayan <natarajsn@gmail.com> wrote:
> Hi
>
> I am on BR git latest.
>
> I am connecting a Upek fingerprint device to my At91sam9263ek SBC with
> linux-2.6.32 and BR file system using glibc based Codesourcery
> external toolchain.
>
> Adding the device doesn't add nodes into /proc/bus/usb even though i
> get the following after connecting device.
>
> # usb 1-1: new full speed USB device using at91_ohci and address 4
> usb 1-1: configuration #1 chosen from 1 choice
>
> I use udev.
>
> My code needs to to open the Usb port using:-
>
> status = PTOpen ("usb, timeout=2000", &mConn);
>
> The same code works well on qemu emulated arm-linux libc system ,where
> the usb system got /dev/bus/usb with populated nodes.

sometimes the buildroot doesnt create nodes in /dev/sda1 or /dev/bus/
 create manually by using mknod with device major n minor no from
Documentation/devices.txt from the  kernel source which u are running
on target.

warm regards,
Ravi Kulkarni.

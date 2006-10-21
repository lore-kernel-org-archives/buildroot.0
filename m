From: don <don_reid@comcast.net>
Date: Sat, 21 Oct 2006 11:34:03 -0700
Subject: [Buildroot] Using udev, non-static /dev, and ramfs (or tmpfs)
Message-ID: <20061021183403.GA21456@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a buildroot system that has been working fine (thanks) using
a static /dev in a ramfs rootfs.  Now I want to add a USB device and it 
seems like I should let udev etc. handle it.

However udev cannot make entries in a read-only /dev.

Is there a simple recipe for mounting /dev as writable?

There are several compilcations:

	Normally to mount with ramfs I'd use /dev/ram*.  
	How does that work with mounting /dev?

	What about all the existing static /dev/entries?

I see that /etc/init.d/S10udev tries to use "/sbin/udevstart", but
I don't have that.

Would I be better off to keep things static?

Thanks
Don Reid

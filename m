From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 3 Dec 2012 09:32:15 +0100
Subject: [Buildroot] Problem with NFS boot
In-Reply-To: <CADKZYYLt90YY8rm4SCuqRN2SsAGqjXhQM7t5hQydpV9o7ZtT+A@mail.gmail.com>
References: <CADKZYYLt90YY8rm4SCuqRN2SsAGqjXhQM7t5hQydpV9o7ZtT+A@mail.gmail.com>
Message-ID: <20121203093215.2b6d64c6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Santhosh Ramani,

On Sat, 1 Dec 2012 19:51:37 -0600, Santhosh Ramani wrote:

> Thank you for your reply, yes I did untar the rootfs.tar.bz2 into the
> folder that is exported as NFS using sudo.
> 
> Note:
> Linux kernel from TI SDK + buildroot rootfs = no nfs (only SD Card)
> Linux kernle from buildroot + buildroot rootfs = everything works fine.

What /dev management solution are you using? Static? Dynamic?

If you're using one of the dynamic solutions (devtmpfs, mdev or udev),
make sure that your kernel is built with CONFIG_DEVTMPFS and
CONFIG_DEVTMPFS_MOUNT. When the kernel is built by Buildroot, Buildroot
automatically enables those options. When your kernel is built
manually, you have to make sure those options are enabled.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

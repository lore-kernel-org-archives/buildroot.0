From: Mike Zick <minimod@morethan.org>
Date: Thu, 13 Feb 2014 07:09:53 -0600
Subject: [Buildroot] How to get the kernel to mount a rootfs without an
 initramfs ?? (2)
In-Reply-To: <52FC9329020000460004A9FA@gwia2.rz.hs-offenburg.de>
References: <52FC9329020000460004A9FA@gwia2.rz.hs-offenburg.de>
Message-ID: <20140213070953.69a3ed30@core2quad.morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 13 Feb 2014 09:40:57 +0100
"Frank Ihle" <frank.ihle@hs-offenburg.de> wrote:

> console=ttyAT0,115200 root=/dev/mmcblk0 ro rootfstype=squashfs
> 

/dev/mmcblk0 is the ***root of the (raw) device***.
/dev/mmcblk0p0 is the first partition
/dev/mmcblk0p1 is the second partition
etc.

> 
> 
> When I then boot my system the following kernel panic occurs:
> VFS: Cannot open ***root device*** "mmcblk0" or unknown-block(0,0)
>

Which is correct and specific - the ***root of the (raw) device*** is
not intended to be opened with VFS.

Put **at least** one partition on the storage device, use it for your
file system root (not device root).

Mike

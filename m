From: Luca Ceresoli <list@lucaceresoli.net>
Date: Mon, 18 Apr 2011 16:54:20 +0200
Subject: [Buildroot] initramfs, busybox init, switch_root and ARM
Message-ID: <LJUS2K$28351E41DE62C4240393CF6875FF3D6E@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Koster wrote:
> ...
> Question one: If the requisite drivers are included in the kernel
> (e.g. ext2, or nfs + kernel network auto-configuration if I want an
> NFS root), is an initramfs even necessary?

No.

> Can I get away with the
> 'real' root filesystem being mounted from the start?

Yes!
If your kernel has all the drivers needed to mount the root filesystem
compiled in statically (=not as modules), there is usually no need to
have an initramfs.
This is frequent on embedded systems that have no or little variations
of hardware configuration.

Luca

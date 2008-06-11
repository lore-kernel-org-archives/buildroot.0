From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 11 Jun 2008 19:29:19 +0200
Subject: [Buildroot] mdev.conf missing during kernel boot-up process?
In-Reply-To: <326f33790806110918x2d922e13vbd8b62bbc223bac5@mail.gmail.com>
References: <326f33790806110918x2d922e13vbd8b62bbc223bac5@mail.gmail.com>
Message-ID: <20080611172919.GL3795@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 11, 2008 at 09:18:45AM -0700, Arun Reddy wrote:
>I just finished a MIPS build and I seem to have a near-successful boot-up in
>QEMU going. After mounting the root (ext2 filesystem) as ready only, the
>boot up halts saying that it
>
>cannot create directory '/dev/pts': File exists
>/bin/sh: /proc/sys/kernel/hotplug: No such file or directory
>mdev: /etc/mdev.conf: No such file or directory
>mdev: /etc/mdev.conf: No such file or directory
>mdev: /etc/mdev.conf: No such file or directory
>mdev: mknod loop2: Read-only file system
>/bin/hostname: invalid option -- F
>Try '/bin/hostname --help' for more information.
>
>I checked my BusyBox settings and mdev.conf support is enabled. It seems to
>me that mdev.conf should be automatically generated for me, but after

No, it should not. You should only turn on something that you really
need. If you don't need an mdev.conf then you should turn support for
the config-parsing off. If, OTOH, you _know_ that you need a specific
mdev.conf, then you're supposed to use your .conf that you wrote and
that does what it is supposed to do.
mdev works fine without conf support.

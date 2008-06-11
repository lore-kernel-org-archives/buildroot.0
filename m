From: Arun Reddy <reddyac@gmail.com>
Date: Wed, 11 Jun 2008 11:00:54 -0700
Subject: [Buildroot] mdev.conf missing during kernel boot-up process?
In-Reply-To: <20080611172919.GL3795@mx.loc>
References: <326f33790806110918x2d922e13vbd8b62bbc223bac5@mail.gmail.com>
	<20080611172919.GL3795@mx.loc>
Message-ID: <326f33790806111100h3c4a9c1aoa57491db62ce2252@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you both for the responses. I thought mdev.conf was required to set
device node permissions properly, but this doesn't look like it's the case.
I went ahead and removed support for mdev.conf in BusyBox but haven't
recompiled yet. From the output posted above it looks like my real problem
is then with the line:

/bin/hostname: invalid option -- F.

I am looking into that now to see how I can fix it.

On Wed, Jun 11, 2008 at 10:29 AM, Bernhard Fischer <rep.dot.nop@gmail.com>
wrote:

> On Wed, Jun 11, 2008 at 09:18:45AM -0700, Arun Reddy wrote:
> >I just finished a MIPS build and I seem to have a near-successful boot-up
> in
> >QEMU going. After mounting the root (ext2 filesystem) as ready only, the
> >boot up halts saying that it
> >
> >cannot create directory '/dev/pts': File exists
> >/bin/sh: /proc/sys/kernel/hotplug: No such file or directory
> >mdev: /etc/mdev.conf: No such file or directory
> >mdev: /etc/mdev.conf: No such file or directory
> >mdev: /etc/mdev.conf: No such file or directory
> >mdev: mknod loop2: Read-only file system
> >/bin/hostname: invalid option -- F
> >Try '/bin/hostname --help' for more information.
> >
> >I checked my BusyBox settings and mdev.conf support is enabled. It seems
> to
> >me that mdev.conf should be automatically generated for me, but after
>
> No, it should not. You should only turn on something that you really
> need. If you don't need an mdev.conf then you should turn support for
> the config-parsing off. If, OTOH, you _know_ that you need a specific
> mdev.conf, then you're supposed to use your .conf that you wrote and
> that does what it is supposed to do.
> mdev works fine without conf support.
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080611/7279f9a6/attachment-0001.htm 

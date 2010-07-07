From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Jul 2010 20:59:09 +0200
Subject: [Buildroot] init: I won't write compressed data to a terminal.
In-Reply-To: <4C34C0C3.4000500@gmx.net> (Ossy's message of "Wed, 07 Jul 2010
	20:00:35 +0200")
References: <4C33AB4E.9050604@gmx.net> <87pqyz6dpa.fsf@macbook.be.48ers.dk>
	<4C34C0C3.4000500@gmx.net>
Message-ID: <87eiff5daa.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ossy" == Ossy  <ossy1980@gmx.net> writes:

 Ossy> Am 07.07.2010 07:52, schrieb Peter Korsgaard:
 >>>>>>> "Ossy" == Ossy<ossy1980@gmx.net>  writes:
 >> 
 Ossy> Hi buildroot mailinglist,
 Ossy> After successfully compiling a whole rootfs and mounting it via loop
 Ossy> on some nfs export I started my arm ebedded device and ran into tho
 Ossy> following error after booting the image via tftp.
 >> 
 Ossy> "init: I won't write compressed data to a terminal."
 >> 
 >> What .config are you using? That string doesn't exist in the busybox
 >> init (or anywhere in busybox).

 Ossy> I'm using the configuration attached (you may need to ignore my custom
 Ossy> settings for the sheevaplugbased DockStar).

 Ossy> I mount the generated rootfs with
 Ossy> mount -o loop,ro br_dist/dev/rootfs.ext2 /exports/rootfs/rfs1
 Ossy> and export it via nfs. The Kernel supports rootfs over nfs and was
 Ossy> able to mount the filesystem via nfs. After that I get the above
 Ossy> mentioned error.

You can also simply extract the generated tarball as root instead of the
ext2 stuff.

 Ossy> As Mitch already mentioned, this error comes from bzip2 (or maybe
 Ossy> gzip). So I guess there is some ext2 inline compression, which is not
 Ossy> compatibel with the serial console?

No, as you mount the ext2 on the nfs server and not on your embedded
box. Have you added any custom init scripts in your tree?

What does a grep -rlis zip * in your /etc give?

I don't see anything wrong with your .config's right away.

-- 
Bye, Peter Korsgaard

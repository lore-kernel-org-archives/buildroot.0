From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 12:04:21 +0100
Subject: [Buildroot] Alternate solution for the pkg-config mess ?
Message-ID: <20181216120421.48937ad1@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

You'll find attached a patch that modifies pkgconf 1.5.3 to behave like
our older pkg-config used to, i.e only prefix by the sysroot a
specific subset of variables, and leave all others untouched.

I am clearly not familiar with all the internals of pkgconf, so I won't
pretend that the patch is perfect, but it seems to do the job.

If we decide that this is the right approach rather than adjusting
gazillions of packages for pkgconf 1.5.3, then let me know and I'll
submit as a proper patch.

Fabrice: I tested this with util-linux/bash-completion, and it does the
job. If you have the chance to test it on other situations where you
had to patch packages to work with pkgconf 1.5.3, it would be very
useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: 0001-Only-prefix-with-the-sysroot-a-subset-of-variables.patch
Type: text/x-patch
Size: 4495 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20181216/37669f96/attachment.bin>

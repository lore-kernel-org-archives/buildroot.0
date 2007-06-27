From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 27 Jun 2007 12:11:31 +0200
Subject: [Buildroot] where is the initrd image?
In-Reply-To: <f0528b5b0706270235w2b25920j5f37ec067ae5fbfc@mail.gmail.com>
References: <mailman.136.1182935450.1099.buildroot@uclibc.org>
	<1497cb6d0706270226o6f86fe31lcfa31ba8d8740982@mail.gmail.com>
	<f0528b5b0706270235w2b25920j5f37ec067ae5fbfc@mail.gmail.com>
Message-ID: <20070627101131.GD5349@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 27, 2007 at 11:35:02AM +0200, Julien Letessier wrote:
>As far as I known there is no support for initrd in buildroot.
>And you don't need one for an embedded system!
>
>In desktop distributions, the initrd is used e.g. to load device/filesystem
>drivers before mounting the root filesystem (which may reside on a
>nonstandard device/filesystem). [1]
>
>In an embedded system, you should include all appropriate drivers in the
>kernel itself, so an initrd is useless.
>Just compile a proper kernel, and configure grub on your target with e.g.
>
>kernel /boot/bzImage root=/dev/hda1
>
>[1] http://en.wikipedia.org/wiki/Initrd

http://busybox.net/bugs/view.php?id=881

This is high on my TODO list for quite some time now, fwiw.
As noted in that report, it is not acceptable to mount stuff.
Ideally we will have to add cpio write support to busybox (and, but this
is not related, ar write support. Wrong list, though).

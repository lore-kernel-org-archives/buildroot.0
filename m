From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Wed, 6 Jan 2010 17:07:27 -0500
Subject: [Buildroot] (no subject)
Message-ID: <BD79186B4FD85F4B8E60E381CAEE19090208945D@mi8nycmail19.Mi8.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,

Does anyone know what happened to mkfs.jffs in mtd-utils?

I recently updated my buildroot tree to the latest git.  This bumped
the mtd-utils package from 1.1.0 to 1.2.0.  I did a make mtd-dirclean
then started the make.  Eventually I got:

cp -f /home/bigguiness/buildroot/output/build/mtd_orig/mkfs.jffs /home/bigguiness/buildroot/output/target/usr/sbin/mkfs.jffs
cp: cannot stat `/home/bigguiness/buildroot/output/build/mtd_orig/mkfs.jffs': No such file or directory
make: *** [/home/bigguiness/buildroot/output/target/usr/sbin/mkfs.jffs] Error 1

The mtd Makefile has a target for it but I don't see any source...

mkfs.jffs:	$(BUILDDIR)/mkfs.jffs

Thanks for any help,
Hartley

From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 20 Jul 2011 10:15:17 +0200
Subject: [Buildroot] devtmpfs and initramfs
In-Reply-To: <201107191323.36347.arnout@mind.be> (Arnout Vandecappelle's
 message of "Tue, 19 Jul 2011 13:23:36 +0200")
References: <201107191222.19313.arnout@mind.be>
 <87aaca4l1y.fsf@macbook.be.48ers.dk>
 <201107191323.36347.arnout@mind.be>
Message-ID: <87ei1l2wru.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 Arnout> Does anyone know a more elegant solution?
 >> 
 >> Not really - Besides adding a devtmps_mount() call in kernel_init(), but
 >> that's kind of icky as well.

 Arnout>  We could of course use the same trick as for GENERIC_SERIAL...

We could, or adjust initramfs.mk to add a small shellscript as /init
rather than just a symlink:

#!/bin/sh
# devtmpfs does not get automounted for initramfs'es
/bin/mount -t devtmpfs devtmpfs /dev
exec /sbin/init $*

Unless BR2_ROOTFS_DEVICE_CREATION_STATIC is enabled.

-- 
Bye, Peter Korsgaard

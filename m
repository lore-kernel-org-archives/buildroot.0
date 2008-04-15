From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Tue, 15 Apr 2008 10:35:36 +0200
Subject: [Buildroot] Creating a bootable filesystem image?
References: <20080411190815.5EB722FE0D36@sam.liddicott.com><326f33790804140957h5059545aw4cc9fea56c79cd0e@mail.gmail.com>
	<326f33790804141009iadec986u91a1abbde904bbf1@mail.gmail.com>
Message-ID: <028d01c89ed3$b035e7f0$ad289e86@LPSC0173W>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I normally just use dd to transfer the filesystem image onto a larger one.
Say you have /dev/sdc2 which is 500Mb and rootfs.powerpc.ext2 which is 10Mb 
like in my case. I just do
dd if=rootfs.powerpc.ext2 of=/dev/sdc2

There may be some hidden problems with that, but I never ran into them. Even 
a subsequent chkdsk runs without errors (you'd assume it would at least tell 
you the free space is missreported).

If you really want an ext2 at a specific size, just do the opposite:
dd if=/dev/sdc2 of=- | bzip2 > test.ext2.bz2

You may be able to use a loopback mount to do this, but I haven't tried it.
-- 
Guillaume Dargaud
http://www.gdargaud.net/

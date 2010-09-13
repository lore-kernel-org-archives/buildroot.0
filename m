From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Sep 2010 11:22:31 +0200
Subject: [Buildroot] EXT2-fs error
In-Reply-To: <SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl> (Johnny Beardsmore's
	message of "Mon, 13 Sep 2010 08:45:56 +0000")
References: <29591683.post@talk.nabble.com> <29641651.post@talk.nabble.com>
	<SNT119-W3039C61443ADF5E85164F582730@phx.gbl>
	<SNT119-W26A1FD2D4331730D164D2C82770@phx.gbl>
	<20100913102031.03481d63@surf>
	<SNT119-W9D3C2902126B58DEE9A1282770@phx.gbl>
Message-ID: <87mxrm6lrc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Johnny" == Johnny Beardsmore <jny0@hotmail.com> writes:

 Johnny> My understanding of running e2fsck is that it should only be
 Johnny> done on an unmounted file system (or setting to read-only, but
 Johnny> I've never actually done this).  I've only ever run it on hda
 Johnny> (usually a hard disk or flash drive) or sda (usually a usb
 Johnny> stick) after a umount.  For me to e2fsck on the build machine
 Johnny> means that I'm applying it to files on a mounted file system,
 Johnny> not a complete unmounted drive.  This is where I'm getting
 Johnny> confused.

Here it works:

tar jxf buildroot-2010.08.tar.bz2
cd buildroot-2010.08
make menuconfig (don't change anything, exit and save)
make
/sbin/e2fsck -f output/images/rootfs.ext2
e2fsck 1.41.9 (22-Aug-2009)
Filesystem did not have a UUID; generating one.

Pass 1: Checking inodes, blocks, and sizes
Pass 2: Checking directory structure
Pass 3: Checking directory connectivity
Pass 4: Checking reference counts
Pass 5: Checking group summary information

output/images/rootfs.ext2: ***** FILE SYSTEM WAS MODIFIED *****
output/images/rootfs.ext2: 504/896 files (0.4% non-contiguous), 1268/3568 blocks

-- 
Bye, Peter Korsgaard

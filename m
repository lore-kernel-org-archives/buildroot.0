From: Bogdan Cristea <cristeab@gmail.com>
Date: Mon, 16 Nov 2009 08:05:13 +0200
Subject: [Buildroot] Creating a filesystem for Real Time Linux using QEMU
Message-ID: <200911160805.13709.cristeab@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have been able to use buildroot (buildroot-20091114.tar.bz2) in order to 
build a filesystem for Real Time Linux. I have been able to boot Linux in QEMU 
with the following command:

qemu -kernel $LOCATION/bzImage \
     -hda $LOCATION/rootfs.i686.ext2 \
     -append "root=/dev/sda"

However, the file system is detected as read only, which could be a problem 
since I need to make my changes.

Someone else suggested to use a different approach, based on initramfs option 
(in build root menu) which loads the filesystem into RAM, but in this case the 
changes are not permanent.

Could you advise please ?

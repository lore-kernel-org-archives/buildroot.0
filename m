From: raj <hraj50@yahoo.com>
Date: Fri, 21 Mar 2014 15:02:56 -0700 (PDT)
Subject: [Buildroot] compiling kernel
In-Reply-To: <532B50D0.7030100@mind.be>
References: <1393369707.747.YahooMailNeo@web120205.mail.ne1.yahoo.com>
 <20140226014847.23839269@core2quad.morethan.org> <530E2686.8040409@mind.be>
 <1395101926704-65501.post@n4.nabble.com> <532B50D0.7030100@mind.be>
Message-ID: <1395439376789-65689.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

I use the buildroot system to build the uImage and rootfs.cpio file, I am
not building image linked with rootfs file system.

CONFIG_BLK_DEV_INITRD=y
CONFIG_INITRAMFS_SOURCE=""

I want to pass boot arguments to kernel to use my file system(rootfs.cpio)

Ex: uImage located on DRAM address = 0x60080000
       rootfs.cpio  DRMA        address   = 0x61000000

my boot arguments
===============
root=/dev/mem rw initrd=0x61000000,8M init=/init console=ttyS1
ip=192.168.1.12:::::eth0:off



init file 
==========

/bin/mount -t devtmpfs devtmpfs /dev

exec 0</dev/console
exec 1>/dev/console
exec 2>/dev/console

exec /sbin/init $*


Thanks & regards,
Raj




--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/compiling-kernel-tp63718p65689.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.

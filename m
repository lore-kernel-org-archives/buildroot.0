From: Eric <spamsink@scoot.netis.com>
Date: Thu, 23 Oct 2008 11:24:38 -0400
Subject: [Buildroot] New to embedded Linux... questions ref. buildroot
In-Reply-To: <8763njgyfz.fsf@macbook.be.48ers.dk>
References: <6.2.5.6.2.20081023070550.02f4eb98@rkt-tech.com>
	<20081023133805.GB956@mx.loc>
	<6.2.5.6.2.20081023103240.02fb21b0@rkt-tech.com>
	<8763njgyfz.fsf@macbook.be.48ers.dk>
Message-ID: <6.2.5.6.2.20081023111920.02d64568@rkt-tech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


At 10:48 AM 10/23/2008, Peter Korsgaard wrote:

 >>>>>
>We don't know. Ask Atmel what they have changed and why it doesn't
>work for you.
<<<<<

Good morning, Peter.

Actually, I don't know that it doesn't work.  Probably works fine 
once I clear up a few questions and get the nerve to try it.  :-)

All I really need (for now) is to find out if this means anything important...

Checking partition file: target/device/Atmel/atngw100/jffs2_partitions.txt
    * found root
      * which is root partition
    * found usr
Using mkfs.jffs2 at location './toolchain_build_avr32/mtd_orig/mkfs.jffs2'
Processing partition: root
    * options '-b -s 0x1000 -e 0x10000 -D
target/device/Atmel/atngw100/device_table.txt -p'
rootdir=/home/eric/AVR32Studio/buildroot/buildroot-avr32-v2.2.0/build_avr32/staging_dir/.tmp/root
table='target/device/Atmel/atngw100/device_table.txt'
mkfs.jffs2: skipping device_table entry '/boot': no parent directory!
mkfs.jffs2: skipping device_table entry '/dev': no parent directory!
mkfs.jffs2: skipping device_table entry '/tmp': no parent directory!
mkfs.jffs2: skipping device_table entry '/etc': no parent directory!
mkfs.jffs2: skipping device_table entry '/sys': no parent directory!
mkfs.jffs2: skipping device_table entry '/config': no parent directory!
mkfs.jffs2: skipping device_table entry '/proc': no parent directory!
mkfs.jffs2: skipping device_table entry '/lost+found': no parent directory!
mkfs.jffs2: skipping device_table entry '/media': no parent directory!
mkfs.jffs2: skipping device_table entry '/www': no parent directory!


... especially since it seems to report a successful build@the end.

Only other thing I need right now is to know from among the following files...

drwxrwxr-x 2 eric eric     4096 2008-10-23 03:42 .
drwxrwxr-x 3 eric eric     4096 2008-10-22 16:05 ..
-rw-rw-r-- 1 eric eric  1226398 2008-10-23 03:39 atngw100-linux-2.6.25.10-.gz
-rw-rw-r-- 1 eric eric        0 2008-10-23 03:40 rootfs.avr32.jffs2
-rw-r--r-- 1 eric eric  7798784 2008-10-23 03:42 rootfs.avr32.jffs2-root
-rw-r--r-- 1 eric eric  7451136 2008-10-23 03:42 rootfs.avr32.jffs2-usr
-rw-rw-r-- 1 eric eric 19230720 2008-10-23 03:42 rootfs.avr32.tar
-rw-rw-r-- 1 eric eric 10138625 2008-10-23 03:42 rootfs.avr32.tar.bz2
-rwxrwxr-x 1 eric eric   104708 2008-10-23 03:24 u-boot.bin


... whether rootfs.avr32.jffs2-root and rootfs.avr32.jffs2-usr are 
the image files I want.  I know I can just try them and see if they 
work but as I said I'm nervous about blowing away the u-boot with no 
way to restore it.

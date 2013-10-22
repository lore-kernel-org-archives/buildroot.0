From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 22 Oct 2013 23:15:32 +0200
Subject: [Buildroot] No proc mounted
In-Reply-To: <OFE26C9A8F.E4D8CD49-ON85257C0C.006AEB60-85257C0C.006B3127@ametek.com>
 (Naitik Amin's message of "Tue, 22 Oct 2013 15:30:48 -0400")
References: <OFE26C9A8F.E4D8CD49-ON85257C0C.006AEB60-85257C0C.006B3127@ametek.com>
Message-ID: <871u3datxn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Naitik" == Naitik Amin <Naitik.Amin@ametek.com> writes:

 > Hi there,
 > I have been generating the rootfs using buildroot. Then dd'ing the rootfs.ext3
 > to the rootfs partition on my sdcard. After inserting the sdcard into my
 > target, it comes up with no /proc, /sys etc...

 > In fstab, I do see the line which should mount /proc, but doesnt seem to
 > happen..

 > Any ideas..

 > $ cat /etc/fstab
 > # /etc/fstab: static file system information.
 > #
 > # <file system> <mount pt>     <type>   <options>         <dump> <pass>
 > /dev/root       /              ext2     rw,noauto         0      1
 > proc            /proc          proc     defaults          0      0
 > devpts          /dev/pts       devpts   defaults,gid=5,mode=620   0      0
 > tmpfs           /dev/shm       tmpfs    mode=0777         0      0
 > tmpfs           /tmp           tmpfs    defaults          0      0
 > sysfs           /sys           sysfs    defaults          0      0

Odd. Could you provide some more details, please? E.G. type 'make
savedefconfig' and paste the content of the 'defconfig' file here.

The default busybox init program runs mount -a, so all these should get
mounted. What happens if you manually run mount -a?

-- 
Bye, Peter Korsgaard

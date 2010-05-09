From: Ossy <ossy1980@gmx.net>
Date: Sun, 09 May 2010 22:12:40 +0200
Subject: [Buildroot] squashfs build failed with rc1 plus aptches until May
	8th - arm926t
Message-ID: <4BE71738.3030501@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear buildroot mailinglist,

I tried to include the squashfs tools using the current rc1, but 
unfortunatly it failed during linking with the below output:
...
--sysroot=/home/ossy/buildroot/buildroot-dev/output/staging/ 
mksquashfs.o read_fs.o sort.o swap.o pseudo.o -lz -lpthread -lm -o 
mksquashfs
mksquashfs.o: In function `initialise_threads':
mksquashfs.c:(.text+0x1d68): undefined reference to `get_nprocs'
collect2: ld returned 1 exit status
make[1]: *** [mksquashfs] Fehler 1
...

Please find attached my configuration.

I just skipped squashfs generation and went on with further compilation.
I was able to compile a larger rootfs in squashfs-format with a former 
development version (before tagging with rc1) without any problems.
Btw: make menuconfig does not show the squashfs 3.x option - but maybe I 
configured something wrong.


Kind regards,
Marcus
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: buildroot.config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100509/c29249f6/attachment-0001.diff>
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: squashfs-tools-failed.txt
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100509/c29249f6/attachment-0001.txt>

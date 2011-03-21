From: Guillaume Dargaud <dargaud@lpsc.in2p3.fr>
Date: Mon, 21 Mar 2011 15:46:22 +0100
Subject: [Buildroot] Booting with ramdisk
Message-ID: <201103211546.22271.dargaud@lpsc.in2p3.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello all,
I'm trying to do something very classic, but it doesn't seem to work and the more I read about it the more I'm confused 
by the amount of antiquated info and nearly-but-not-quite-so relevant info (like doing a temporary ramdisk before the 
real OS loads).

So I have a kernel and a buildroot-generated OS, currently on an NFS server. I boot with the following kernel parameters 
and everything goes fine:
console=ttyUL0,115200 rw root=/dev/nfs ip=bootp

Now I want to embed that OS in the kernel (no need for a network anymore as the kernel is on a flash mem). So I did the 
following:
- add ROOTFS CPIO to the buildroot options and make a new version
- point CONFIG_INITRAMFS_SOURCE to the resulting rootfs.cpio file
- change the kernel parameters to "console=ttyUL0,115200 root=/dev/ram" (that's in a dts file)

The kernel stops instantly without even a blip on the console. A debugger reveals that it stops at 0x401718... I have no 
idea what's going on at this stage.
-- 
Guillaume Dargaud
http://www.gdargaud.net/

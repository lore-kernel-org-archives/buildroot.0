From: Judson Wilson <judson@powerstandards.com>
Date: Mon, 02 Jul 2012 17:57:08 -0700
Subject: [Buildroot] Linux throwing "uncompression error" on rootfs.ext2.gz ?
Message-ID: <4FF24364.7010303@powerstandards.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Curious if anyone has run into an issue where their ext2.gz image causes 
linux boot to say "uncompression error", like this:

...
RAMDISK: gzip image found at block 0
uncompression error
VFS: Mounted root (ext2 filesystem) on device 1:0.
...

I have two patches to my buildroot install, one that causes this, and 
one that doesn't. Both have the same config file.

I can't imagine this to be caused by the contents of the skeleton, 
unless it is a bug in either buildroot (or its zipper), or my Linux 
kernel (ARM). My kernel is 2.6.37.

I can't see any significant changes in the kernel to 
lib/decompress_inflate.c, lib/zlib_deflate, or lib/zlib_inflate since 
our version.

Also of interest, the suspect file passes a 7zip "Test archive".

Thanks for any help or ideas!
-Judson

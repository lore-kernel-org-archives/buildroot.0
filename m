From: Brad House <brad@mainstreetsoftworks.com>
Date: Tue, 14 Aug 2007 20:57:35 -0400
Subject: [Buildroot] [patch] kernel-headers: lzma causing issues
Message-ID: <46C24F7F.1020203@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The lzma patches really should be optional, so I've attached a patch
which does exactly that.

I find myself having to remove the lzma patches because my build system
doesn't natively have lzma.  I tried to compensate for this by
installing the latest lzma from gentoo's package tree, and apparently,
it accepts different flags than the one these patches expect, so my
kernel build still fails.  Finally, I used the lzma from this buildroot
and compiled it by hand, and it _mostly_ worked.  Regardless, it seems
silly to make this a requirement.  Personally, I gzip my initramfs,
and that's enough compression for me...

Please apply this patch and create a toolchain/kernel-headers/lzma
directory and move the linux-*lzma*.patch files to that directory.
I'm sure I can't be the only person who's had to simply delete those
patches from my tree.

Thanks.
-Brad
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: kernel-headers-lzma-optional.diff
Url: http://busybox.net/lists/buildroot/attachments/20070814/3c555d82/attachment.diff 

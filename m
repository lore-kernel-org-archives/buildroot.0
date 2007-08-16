From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 15 Aug 2007 23:26:48 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers:
	lzma
Message-ID: <20070816062648.B8584A4007@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-15 23:26:25 -0700 (Wed, 15 Aug 2007)
New Revision: 19524

Log:

Move lzma patches to toolchain/kernel-headers/lzma

They will be applied ONLY if BR2_KERNEL_HEADERS_LZMA is set.

BR2_KERNEL_HEADERS_LZMA defaults to NO, so the user
has to actively set this config flag if lzma is needed.

This means that the default behaviour of buildroot will work
for most users.

Comment from author:

[Brad House]
I find myself having to remove the lzma patches because my build system
doesn't natively have lzma.  I tried to compensate for this by
installing the latest lzma from gentoo's package tree, and apparently,
it accepts different flags than the one these patches expect, so my
kernel build still fails.  Finally, I used the lzma from this buildroot
and compiled it by hand, and it _mostly_ worked.  Regardless, it seems
silly to make this a requirement.  Personally, I gzip my initramfs,
and that's enough compression for me...




Added:
   trunk/buildroot/toolchain/kernel-headers/lzma/
   trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.21.5-001-lzma-vmlinuz.00.patch
   trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.21.5-002-lzma-vmlinuz.01.patch
   trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.22.1-001-lzma-vmlinuz.00.patch
   trunk/buildroot/toolchain/kernel-headers/lzma/linux-2.6.22.1-002-lzma-vmlinuz.01.patch

Removed:
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-001-lzma-vmlinuz.00.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.21.5-002-lzma-vmlinuz.01.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-001-lzma-vmlinuz.00.patch
   trunk/buildroot/toolchain/kernel-headers/linux-2.6.22.1-002-lzma-vmlinuz.01.patch

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in
   trunk/buildroot/toolchain/kernel-headers/kernel-headers-new.makefile


Changeset:

Sorry, the patch is too large to include (108045 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=19524

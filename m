From: Charles Krinke <charles.krinke@gmail.com>
Date: Sun, 13 Mar 2011 16:59:21 -0700
Subject: [Buildroot] Looking for BDI2000 advice with buildroot kernel
Message-ID: <AANLkTinw1xHiBRfeUhjJyk-aLE=fRWzkRNdRt9C4DupO@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have a kernel built with "-g", both zImage and vmlinux for MPC8323E-RDB
using buildroot-2010.11. I can run the target until a u-boot prompt, halt
the target with the BDI2000, load either vmlinux or zImage into the target,
but after I do a "target remote bdi2000:2001", although I can "stepi"
through the first few dozen assembly instructions in vmlinux, I cannot seem
to get anywhere with zImage.

I think I am bolloxed up in mmu/virtual/physical addresses.

Here is my recipe so far:

BDI> load zImage 0x00400000
BDI> bi 0xc000xxxx <start_kernel from System.map>

Host$ ddd --debugger powerpc....gdb vmlinux
  (gdb) target remote bdi2000:2001
  (gdb) symbol-file vmlinux

At this point a "BDI> go" or a "(gdb) cont" ends up just resetting the
board.

What am I stupidly doing wrong?

-- 
Charles Krinke
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110313/6bc47f51/attachment.html>

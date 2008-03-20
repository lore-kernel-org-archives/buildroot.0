From: Reinier Coetzer <reinier.coetzer@gmail.com>
Date: Thu, 20 Mar 2008 12:03:38 +0200
Subject: [Buildroot] Buildroot with a Vortex86SX CPU
Message-ID: <823018ed0803200303q5cb907f5gc40a05baad33639d@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

I'm new to kernel compiling so I'm not exactly sure how it should be done.
The CPU
I'm using is a Vortext86SX which is a i486 CPU without a FPU.

 I use Buildroot to do the cross compilation for my root filesystem.
I do not use Buildroot to compile the kernel. I downloaded the
2.6.18.8kernel, unzipped
it and patched it with the patch provided by DMP (
http://www.dmp.com.tw/tech/vortex86sx).
I then run 'make xconfig' to configure the kernel parameters and I only
changed the parameter
as described in the linux howto pdf (also on that site). I dont need a
window manager, just the
command line. The kernel compiled succesfully.

I then build a root filesystem with Buildroot and tried to boot. I got the
following kernel
panic:

Call Trace:
  [<c0108ef6>] identify_cpu+0x88/0x268
  [<c03525f7>] start_kernel+0x2d/0x317
Code: 00 80 89 f8 0f a2 89 55 10 89 f8 0f a2 89 4d 24 81 fe 03 00 00 80 76
07 89
e8 e8 e1 fc ff ff 89 e8 f6 0b 00 00 b8 01 00 00 00 <0f> a2 c1 eb 18 88 9d 93
00 00 00 83 c4 10 5b 5e 5f 5d c3 57 56
EIP: [<c0108e2f>] generic_identify+0x105/0x118 SS:ESP 0068:c034dfac
<0>Kernel panic - not syncing: Attempt to kill the idle task!

How can I fix this? Is it how the kernel is compiled or is how the root
filesystem is build?

Regards
 Reinier
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080320/0409a447/attachment.htm 

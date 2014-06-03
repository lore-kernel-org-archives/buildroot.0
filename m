From: Rohit Kumar <rkthebest@gmail.com>
Date: Tue, 3 Jun 2014 11:02:00 +0900
Subject: [Buildroot] configuring buildroot tolchain to compile existing
	kernel source
Message-ID: <CABzetm3_=GBJDH9TdtSOGF2hieGJndxjTCL9=GCoKoOtMLps6Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

i already have kernel source and cross toolchain from the vendor but i want
to create toolchain with buildroot and compile the kernel.

what are the parameters crucial while configuring buildroot for such
application?
i mean gcc version, kernel headers version or anything else?

i used toolchain by buildroot, compiled the kernel but when the board boots
with compiled kernel...
it generates following and doesnt boot.

Starting kernel ...

[    0.000000] Slab corruption: size-32 start=c62011e0, len=32
[    0.000000] 010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
[    0.000000] Next obj: start=c6201200, len=32
[    0.000000] 000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
[    0.000000] 010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
[    0.000000] Slab corruption: size-64 start=c6202120, len=64
[    0.000000] 030: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
[    0.000000] Next obj: start=c6202160, len=64
[    0.000000] 000: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
[    0.000000] 010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
[    0.000000] Slab corruption: size-32 start=c6201700, len=32
[    0.000000] 010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
[    0.000000] Prev obj: start=c62016e0, len=32
[    0.000000] 000: 00 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00
[    0.000000] 010: 00 17 20 c6 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
[    0.000000] Next obj: start=c6201720, len=32
[    0.000000] 000: 00 00 00 00 01 00 00 00 01 00 00 00 00 00 00 00
[    0.000000] 010: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a a5
[    0.000000] Slab corruption: size-32 start=c62016a0, len=32
[    0.000000] 010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
[    0.000000] Prev obj: start=c6201680, len=32
[    0.000000] 000: 00 00 00 00 01 00 00 00 01 00 00 00 00 00 00 00
[    0.000000] 010: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a
[    0.000000] Next obj: start=c62016c0, len=32
[    0.000000] 000: 00 00 00 00 01 00 00 00 01 00 00 00 01 00 00 00
[    0.000000] 010: 00 3a 20 c6 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a a5
[    0.000000] Slab corruption: size-32 start=c6201700, len=32
[    0.000000] 010: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b

buildroot configuration file is attached for reference

With Regards,

Rohit Kumar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140603/50048334/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_config
Type: application/octet-stream
Size: 38085 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140603/50048334/attachment-0001.obj>

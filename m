From: Luca Ellero <luca.ellero@brickedbrain.com>
Date: Wed, 11 May 2016 11:43:12 +0200
Subject: [Buildroot] uClibc debug symbols
Message-ID: <ddfc826b-9bf7-38c8-a442-bea33bf05621@brickedbrain.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everybody,
I'm trying to debug uClibc with a debugger, but even if I enable "build 
packages with debugging symbols" it seems that debug symbols are not 
present in the final binaries.

My .config reports:
BR2_ENABLE_DEBUG=y
BR2_DEBUG_2=y

I'm using binaries in output/staging/lib (is this the correct place to go?)

If I do "objdump -h | grep debug" on this libraries I get the following:

$ arm-buildroot-linux-uclibcgnueabi-objdump -h ld-uClibc-1.0.12.so | 
grep debug

$ arm-buildroot-linux-uclibcgnueabi-objdump -h libuClibc-1.0.12.so | 
grep debug
   20 .debug_aranges 00000180  00000000  00000000  0004b310  2**3
   21 .debug_info   00000c7a  00000000  00000000  0004b490  2**0
   22 .debug_abbrev 00000353  00000000  00000000  0004c10a  2**0
   23 .debug_line   000008ce  00000000  00000000  0004c45d  2**0
   24 .debug_frame  00000124  00000000  00000000  0004cd2c  2**2
   25 .debug_str    00000330  00000000  00000000  0004ce50  2**0
   26 .debug_loc    0000068c  00000000  00000000  0004d180  2**0
   27 .debug_ranges 00000038  00000000  00000000  0004d80c  2**0

Could someone please tell me what is wrong with this approach?

Thanks
Regards
Luca

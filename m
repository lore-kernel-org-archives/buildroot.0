From: =?iso-8859-1?B?Sm9z6SBSdWl6?= <ja_rd@hotmail.com>
Date: Sat, 4 Jun 2011 15:47:11 +0000
Subject: [Buildroot] Installation problem -- libgcc build fails with "ELF
 file data encoding not little-endian"
Message-ID: <SNT132-w12E3A738FE4A3C317B00998D7E0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello:

I have trouble installing buildroot on a Fedora Core 11 machine targetting a MIPS platform. I'm using 'buildroot-2011.05' downloaded in June 4th.

Specifically, the installation stops when building libgcc complaining that "ELF file data encoding not little-endian" somehow.


I strictly follow the installation instructions in the documentation. After uncompressing the buildroot tarball this is what I do (as a regular user, not root):

1.- make install --> select mips1 and a few system parameters (NOT INCLUDING ENDIANESS)
2.- make

After a lot of downloading and compiling, this is the error I get:

<**************************************************************************************************************>
<START OF ERROR TRANSCRIPTION>


... <preceding lines omitted>

make[2]: Entering directory `/home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/gcc'
make[2]: Leaving directory `/home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/gcc'
Checking multilib configuration for libgcc...
/bin/sh: error while loading shared libraries: /home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/./gcc/libgcc_s.so.1: ELF file data encoding not little-endian
/bin/sh: error while loading shared libraries: /home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/./gcc/libgcc_s.so.1: ELF file data encoding not little-endian
/bin/sh: error while loading shared libraries: /home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/./gcc/libgcc_s.so.1: ELF file data encoding not little-endian
/bin/sh: error while loading shared libraries: /home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/./gcc/libgcc_s.so.1: ELF file data encoding not little-endian
/bin/sh: error while loading shared libraries: /home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/./gcc/libgcc_s.so.1: ELF file data encoding not little-endian
/bin/sh: error while loading shared libraries: /home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/./gcc/libgcc_s.so.1: ELF file data encoding not little-endian
/bin/sh: error while loading shared libraries: /home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/./gcc/libgcc_s.so.1: ELF file data encoding not little-endian
/bin/sh: error while loading shared libraries: /home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/./gcc/libgcc_s.so.1: ELF file data encoding not little-endian
make[2]: Entering directory `/home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/mips-unknown-linux-uclibc/libgcc'
# If this is the top-level multilib, build all the other
/bin/sh: error while loading shared libraries: /home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/./gcc/libgcc_s.so.1: ELF file data encoding not little-endian
make[2]: *** [all-multi] Error 127
make[2]: Leaving directory `/home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/mips-unknown-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory `/home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate'
make: *** [/home/jaruiz/dev/mips/buildroot/buildroot-2011.05/output/toolchain/gcc-4.3.5-intermediate/.compiled] Error 2
[jaruiz at PF15 buildroot-2011.05]$ 


<**************************************************************************************************************>
<END OF ERROR TRANSCRIPTION>



Please note the following:

1.- I haven't explicitly configured the MIPS endianess; if there's an option for that in the menuconfig, I missed it.

2.- In last February I did use buildroot for the same target, on a Kubuntu 8.4 machine, without any trouble at all. I vaguely recall that I did have to choose the endianess then, I may be wrong. I was using the then-latest buildroot version too.


In case you're wondering, my LD_LIBRARY_PATH (echo $LD_LIBRARY_PATH) is empty.

Any help will be appreciated. There is no chance that I can fix this on my own in any reasonable time so I really need the help.

Thanks and regards!

Jos? A. Ruiz







     
 		 	   		  
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110604/22c26459/attachment.html>

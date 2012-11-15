From: Alexander Khryukin <alexander@mezon.ru>
Date: Fri, 16 Nov 2012 01:20:32 +0300
Subject: [Buildroot] gcc on target system issue
Message-ID: <CABtOAfxKdUhvGHF2K_BG__vPPcqmio24DW0suz86Hfzngzc01g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all.
I'm trying to build gcc on target but it fails with


./gcc -I/home/user/buildroot/output/toolchain/gcc-4.7.2/libgcc/../include
-DHAVE_CC_TLS  -o _negdi2_s.o -MT _negdi2_s.o -MD -MP -MF _negdi2_s.dep
-DSHARED -DL_negdi2 -c
/home/user/buildroot/output/toolchain/gcc-4.7.2/libgcc/libgcc2.c
In file included from
/home/user/buildroot/output/toolchain/gcc-4.7.2/libgcc/config/arm/unwind-arm.c:154:0:
/home/user/buildroot/output/toolchain/gcc-4.7.2/libgcc/unwind-arm-common.inc:
At top level:
/home/user/buildroot/output/toolchain/gcc-4.7.2/libgcc/unwind-arm-common.inc:30:21:
fatal error: sys/sdt.h: No such file or directory
compilation terminated.
make[3]: *** [unwind-arm.o] Error 1
make[3]: *** Waiting for unfinished jobs....
In file included from
/home/user/buildroot/output/toolchain/gcc-4.7.2/libgcc/unwind-c.c:29:0:
./unwind.h: In function '_Unwind_decode_typeinfo_ptr':
./unwind.h:42:45: warning: unused parameter 'base' [-Wunused-parameter]
./unwind.h: In function '__gnu_unwind_24bit':
./unwind.h:68:41: warning: unused parameter 'context' [-Wunused-parameter]
./unwind.h:68:54: warning: unused parameter 'data' [-Wunused-parameter]
./unwind.h:68:64: warning: unused parameter 'compact' [-Wunused-parameter]
make[3]: Leaving directory
`/home/user/buildroot/output/build/gcc-4.7.2-target/arm-buildroot-linux-uclibcgnueabi/libgcc'
make[2]: *** [all-target-libgcc] Error 2
make[2]: Leaving directory
`/home/user/buildroot/output/build/gcc-4.7.2-target'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/user/buildroot/output/build/gcc-4.7.2-target'
make: *** [/home/user/buildroot/output/build/gcc-4.7.2-target/.compiled]
Error 2



Also sys/sdt.h provides by systemtap
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121116/38957449/attachment.html>

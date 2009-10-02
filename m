From: Heyendal, Carl <CHeyendal@stanleyworks.com>
Date: Fri, 2 Oct 2009 16:20:14 -0400
Subject: [Buildroot] compile error with 'crtstuff.c'
Message-ID: <1D6034426110564DA0DEA9EE9793B38357C834BA7D@NBE-MBX01.americas.swk.pri>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm getting this error below when I'm using Buildroot regarding the cross compiler tools. I searched the net for references to the same problem, lots of hits but there was no definitive solution that I could find.

Attached is my Buildroot config file. Any help would be appreciated. Please, I'm a newbie, be verbose.

thanx
/carl h


.....
[snip]
......
make[2]: Entering directory `/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-initial/fixincludes'
make[2]: Nothing to be done for `all'.
make[2]: Leaving directory `/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-initial/fixincludes'
make[2]: Entering directory `/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-initial/gcc'
make[2]: Leaving directory `/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-initial/gcc'
Checking multilib configuration for libgcc...
make[2]: Entering directory `/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-initial/arm-linux-uclibc/libgcc'
# If this is the top-level multilib, build all the other
# multilibs.
/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-initial/./gcc/xgcc -B/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-initial/./gcc/ -B/home/heyendal/buildroot/output/staging/usr/arm-linux-uclibc/bin/ -B/home/heyendal/buildroot/output/staging/usr/arm-linux-uclibc/lib/ -isystem /home/heyendal/buildroot/output/staging/usr/arm-linux-uclibc/include -isystem /home/heyendal/buildroot/output/staging/usr/arm-linux-uclibc/sys-include -g -Os -O2 -g -Os -DIN_GCC -DCROSS_DIRECTORY_STRUCTURE   -W -Wall -Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes -Wold-style-definition  -isystem ./include  -I. -I. -I/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/gcc -I/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/gcc/. -I/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/gcc/../include -I/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/gcc/../libcpp/include -I/home/heyendal/buildroot/output/toolchain/gmp/include -I/home/heyendal/buildroot/output/toolchain/mpfr/include -I/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/gcc/../libdecnumber -I/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/gcc/../libdecnumber/dpd -I../libdecnumber  -g0 -finhibit-size-directive -fno-inline-functions -fno-exceptions -fno-zero-initialized-in-bss -fno-toplevel-reorder -fno-tree-vectorize  -I. -I. -I../.././gcc -I/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc -I/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/. -I/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc -I/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../include  -o crtbegin.o -MT crtbegin.o -MD -MP -MF crtbegin.dep  \
   -c /home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c -DCRT_BEGIN
/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c: In function '__do_global_dtors_aux':
/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306: error: '__DTOR_LIST__' undeclared (first use in this function)
/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306: error: (Each undeclared identifier is reported only once
/home/heyendal/buildroot/output/toolchain/gcc-4.3.4/libgcc/../gcc/crtstuff.c:306: error: for each function it appears in.)
make[2]: *** [crtbegin.o] Error 1
make[2]: Leaving directory `/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-initial/arm-linux-uclibc/libgcc'
make[1]: *** [all-target-libgcc] Error 2
make[1]: Leaving directory `/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-initial'
make: *** [/home/heyendal/buildroot/output/toolchain/gcc-4.3.4-initial/.compiled] Error 2
heyendal at carl-desktop:~/buildroot$<mailto:heyendal@carl-desktop:~/buildroot$>







Carl Heyendal

Senior Embedded S/W Designer

Stanley Healthcare Solutions
309 Legget Drive
Ottawa, ON K2K 3A3
Canada

Tel: 613-592-6997 ext. 265
Fax: 613 592-4296
cheyendal at stanleyworks.com<mailto:cheyendal@stanleyworks.com>
www.stanleyhealthcare.com<http://www.stanleyhealthcare.com/>

Same products, same team, with a new Corporate Identity
New! My e-mail address has changed.

This e-mail, including any attached files, is intended only for the person to whom or the entity to which it is addressed and may contain confidential and/or privileged material. Any review, retransmission, dissemination or other use of, or taking of any action in reliance upon, this information by persons or entities other than the intended recipient is prohibited. If you received this in error, please contact the sender and delete the material from any computer.


-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091002/fb0eeff0/attachment-0001.htm>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 19338 bytes
Desc: config
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091002/fb0eeff0/attachment-0001.obj>

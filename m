From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Fri, 14 May 2010 16:47:14 +0200
Subject: [Buildroot] gdbserver 7.* broken ?
Message-ID: <8F3FB24622D14AFAAB855DCC378837AC@apexjs>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi
 
In an attempt to build gdbserver 7.01 :
 
cp -dpRf package/config/buildroot-config
/home/johan/buildroot/output/build/buildroot-config
/usr/bin/make -j1
CC=/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gc
c MT_CFLAGS="-Os -pipe -Os  -mtune=geode -march=geode -D_LARGEFILE_SOURCE
-D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/johan/buildroot/output/staging/usr/include
-I/home/johan/buildroot/output/staging/include
--sysroot=/home/johan/buildroot/output/staging/ -isysroot
/home/johan/buildroot/output/staging" \
  -C /home/johan/buildroot/output/build/gdbserver-7.0.1
make[1]: Entering directory
`/home/johan/buildroot/output/build/gdbserver-7.0.1'
/home/johan/buildroot/output/staging/usr/bin/i586-unknown-linux-uclibc-gcc
-c  -Wall -g -O2 -Os -pipe -Os  -mtune=geode -march=geode
-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
-I/home/johan/buildroot/output/staging/usr/include
-I/home/johan/buildroot/output/staging/include
--sysroot=/home/johan/buildroot/output/staging/ -isysroot
/home/johan/buildroot/output/staging   -I.
-I/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver
-I/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver/../common
-I/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver/../regforma
ts
-I/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver/../../inclu
de
/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver/linux-low.c 
In file included from
/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver/linux-low.c:2
1:
/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver/linux-low.h:5
8: error: expected specifier-qualifier-list before 'td_thragent_t'
/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver/linux-low.c:
In function 'linux_add_process':
/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver/linux-low.c:2
53: error: 'struct process_info_private' has no member named 'arch_private'
/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver/linux-low.c:
In function 'linux_remove_process':
/home/johan/buildroot/output/toolchain/gdb-7.0.1/gdb/gdbserver/linux-low.c:2
64: error: 'struct process_info_private' has no member named 'arch_private'
make[1]: *** [linux-low.o] Error 1
make[1]: Leaving directory
`/home/johan/buildroot/output/build/gdbserver-7.0.1'
make: *** [/home/johan/buildroot/output/build/gdbserver-7.0.1/gdbserver]
Error 2
 
I am not sure  if this has something to do with uclibc 3.31 , or  has it to
do with one of the .configure options ?
 
 
Johan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100514/4ad29b79/attachment.htm>

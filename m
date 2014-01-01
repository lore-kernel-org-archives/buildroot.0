From: Ivan Wagner <ivan.wagner@gmail.com>
Date: Wed, 1 Jan 2014 23:46:27 +0100
Subject: [Buildroot] Wrong compiler path when compiling zlib
Message-ID: <CA+hj=MoNYEZchBs1_34cS4eA=UYfU+2QNdbNBDOqt=u2YFsJPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I noticed that the compiler base directory is actually wrong when
attempting to compiler the zlib library.

I've configured CodeSourcery as an external pre-installed toolchain with
path under /opt but this is the error log I get when trying to compile zlib:

--------------------
./configure --shared --prefix=/usr
Wed Jan  1 23:37:01 CET 2014
=== ztest6146.c ===
extern int getchar();
int hello() {return getchar();}
===
/home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc
-c ztest6146.c
./configure: line 165:
/home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc:
No such file or directory
... using
/home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc

Checking for obsessive-compulsive compiler options...
=== ztest6146.c ===
int foo() { return 0; }
===
/home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc
-c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -pipe
-Os -fPIC ztest6146.c
./configure: line 343:
/home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc:
No such file or directory
(exit code 127)
Compiler error reporting is too harsh for ./configure (perhaps remove
-Werror).
** ./configure aborting.
--------------------

I don't know where it gets the
/home/ivan/projects/buildroot/output/host/usr/bin/arm-none-linux-gnueabi-gcc
path from...

I someone facing something similar when trying to compile everything with
an external pre-installed toolchain?

Thank you,

Ivan
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140101/85b1b76d/attachment-0001.html>

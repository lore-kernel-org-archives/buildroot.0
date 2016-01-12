From: Steve Calfee <stevecalfee@gmail.com>
Date: Mon, 11 Jan 2016 20:55:34 -0800
Subject: [Buildroot] [USER] buildroot install external toolchains
Message-ID: <CAJJ6jxvGYN8Pd-8GwzVHSZWKc2CpsNE47Xb23EF-m0_ZFVS7Ew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

?Hi,
I am trying to use docker to cross build buildroot. I don't want to build
the toolchain so I tried to use a pre-built toolchain as the autobuilders
do. I got a list of toolchains from
https://sourceware.org/ml/crossgcc/2015-05/msg00014.html written by Thomas
P.

So I extracted one into the filesystem and tried to use it, but something
is wrong. ?

From bash I tried:
/br/armv7-ctng-linux-gnueabihf/bin/armv7-ctng-linux-gnueabihf-gcc --version
bash: /br/armv7-ctng-linux-gnueabihf/bin/armv7-ctng-linux-gnueabihf-gcc: No
such file or directory

from buildroots base directory:

ls -l /br/armv7-ctng-linux-gnueabihf/bin/armv7-ctng-linux-gnueabihf-gcc
-rwxr-xr-x 2 br br 562548 Apr 18  2014
/br/armv7-ctng-linux-gnueabihf/bin/armv7-ctng-linux-gnueabihf-gcc

make
>>> toolchain-external undefined Configuring
Cannot execute cross-compiler
'/br/armv7-ctng-linux-gnueabihf/bin/armv7-ctng-linux-gnueabihf-gcc'


So I conclude that just extracting the archive is not enough. What do I
need to do to use a prebuild toolchain?

Thanks, Steve
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160111/ccb6465d/attachment.html>

From: Marcus Johansson <macce.johansson@gmail.com>
Date: Thu, 6 Nov 2008 14:43:21 +0100
Subject: [Buildroot] --with-sysroot and --prefix in cross-gcc configure
Message-ID: <f5d6db230811060543t5f6e0811i4c5949425fa881ec@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I am using Buildroot just for building an arm-linux cross compiler running
on x86. I would like to have the sysroot being put somewhere below
$(prefix), so that the toolchain and sysroot can be fully portable, without
specifying --sysroot=<dir>. For instance, this is how the CodeSourcery
distribution works. However, in Buildroot, when running "arm-linux-gcc -v"
it appears that --prefix always is hardcoded to /usr. My --with-sysroot is
not below /usr (it happens to be below /opt, as there is where our projects
including Buildroot are built and stored), therefore my sysroot is not
relocateable (see section on --with-sysroot on
http://gcc.gnu.org/install/configure.html).

Is there some way I can configure prefix to be something else than /usr or
any other way to make the sysroot and executables relocateable?

I have been experimenting quite a bit with toolchain/gcc/gcc-uclibc-4.x.mk,
but cannot find any (good) way to make a change here.

Best Regards,
Marcus
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081106/a9ed33b3/attachment.htm 

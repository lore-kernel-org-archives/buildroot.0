From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 10:01:59 +0200
Subject: [Buildroot] build 2015.11 - sbin/init: error while loading
	shared libraries: libtirpc.so.1
In-Reply-To: <CALD51P81wh8mSgypNtVqZ+EpEtVdTAxsM27tO_njwjtJDap7nw@mail.gmail.com>
 (Lijun QIN's message of "Wed, 31 Aug 2016 00:40:49 -0500")
References: <CALD51P81wh8mSgypNtVqZ+EpEtVdTAxsM27tO_njwjtJDap7nw@mail.gmail.com>
Message-ID: <87vayhz7rc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Lijun" == Lijun QIN <lijun.qin2008@gmail.com> writes:

Hi,

 > I got Marvell's  buildroot-2015.11-16.06.0 which is  buildroot-2015.11 +
 > Mavell packages

No idea what those marvell changes are about.

 > Compiler: gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 > Kernel: 3.10.70
 > CPU: Marvell A38x
 > When I boot up rootfs,  I got the following errors:

 > VFS: Mounted root (ext3 filesystem) on device 8:1.
 > devtmpfs: mounted
 > Freeing unused kernel memory: 248K (c08b1000 - c08ef000)
 > /sbin/init: error while loading shared libraries: libtirpc.so.1: cannot
 > open shared object file: No such file or directory
 > Kernel panic - not syncing: Attempted to kill init! exitcode=0x00007f00

 > I checked the libtirpc.so, it is in  /usr/lib and I also copy  ibtirpc.so*

The error message was about libtirpc.so.1 (notice the .1!) and you
mentioned you looked for libtirpc.so (without .1). Can you verify that
you have usr/lib/libtirpc.so.1?

What is the output of:
arm-linux-gnueabihf-readelf -d target/sbin/init | grep NEEDED


-- 
Bye, Peter Korsgaard

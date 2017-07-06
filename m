From: Mark Jackson <mpfj-list@newflow.co.uk>
Date: Thu, 6 Jul 2017 15:34:27 +0100
Subject: [Buildroot] ARM cross compiler path error "no such file or
	directory"
Message-ID: <5ea74359-6a01-7668-c1d2-3784711227ab@newflow.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I can successfully compile "beaglebone_defconfig".

$ make clean
$ make beaglebone_defconfig
$ make

And in output/host/usr/bin, I can find all the "arm-linux-xyz" cross compiler tools (gcc, strings, strip, etc).

But when I try to use these to compile my own code, I get an error as follows:-

$ which arm-linux-gcc
/home/mpfj/buildroot/output/host/usr/bin/arm-linux-gcc
$ arm-linux-gcc
/home/mpfj/buildroot/output/usr/bin/arm-linux-gcc.br_real: No such file or directory

Quite correctly, "output/usr/bin" doesn't exist ... the files are in "output/host/usr/bin"
                                                                             ^^^^

arm-linux-gcc is just a symlink to toolchain-wrapper, so toolchain-wrapper seems to be pointing to the wrong directory!!

I'm sure was working yesterday, but I did a "git pull" this morning, so it may be something quite recent ??

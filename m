From: Yegor Masharsky <yegor.masharsky@gmail.com>
Date: Thu, 17 Jan 2008 18:41:07 +0300
Subject: [Buildroot] buildroot building problems
Message-ID: <53499b480801170741m1cee5028q2fc41f1a52b3fd6f@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all ,

I'm trying to setup buildroot and uclibc on my host , but something
goes wrong . According to buildroot manual I've downloaded buildroot
using
"svn co svn://uclibc.org/trunk/buildroot" then configured it using
"make menuconfig" and run "make" . After kernel is patched make fails
saying that it could not copy .config file . The output is the
following:

rm -rf /home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10
*** Unpacking kernel source
bzcat /home/aym001/buildroot/dl/linux-2.6.22.10.tar.bz2 | tar -C
/home/aym001/buildroot/project_build_powerpc/uclibc   -xf -
touch /home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10/.unpacked
toolchain/patch-kernel.sh
/home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10
toolchain/kernel-headers \
linux-2.6.22.10-\*.patch{,.gz,.bz2}
touch /home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10/.patched
cp -dpf  /home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10/.config
cp: missing destination file
Try `cp --help' for more information.
make: *** [/home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10/.configured]
Error 1

What do I do wrong ?

Thanks,
Yegor

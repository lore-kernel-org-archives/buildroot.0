From: Paul <pbor1234@zonnet.nl>
Date: Thu, 17 Jan 2008 20:35:02 +0100
Subject: [Buildroot] buildroot building problems
In-Reply-To: <53499b480801170741m1cee5028q2fc41f1a52b3fd6f@mail.gmail.com>
Message-ID: <20080117193508.A6B25C6DA@green.qinip.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yegor,
You need a .config for the kernel as well. In make menuconfig you can select
to run xconfig prior to compiling the kernel. Otherwise run the config tool
yourself and point to the .config file in make menuconfig. Hope this helps?
Paul



-----Original Message-----
From: buildroot-bounces@uclibc.org [mailto:buildroot-bounces at uclibc.org] On
Behalf Of Yegor Masharsky
Sent: donderdag 17 januari 2008 16:41
To: buildroot at uclibc.org
Subject: [Buildroot] buildroot building problems

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
touch
/home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10/.unpacke
d
toolchain/patch-kernel.sh
/home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10
toolchain/kernel-headers \
linux-2.6.22.10-\*.patch{,.gz,.bz2}
touch
/home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10/.patched
cp -dpf
/home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10/.config
cp: missing destination file
Try `cp --help' for more information.
make: ***
[/home/aym001/buildroot/project_build_powerpc/uclibc/linux-2.6.22.10/.config
ured]
Error 1

What do I do wrong ?

Thanks,
Yegor
_______________________________________________
buildroot mailing list
buildroot at uclibc.org
http://busybox.net/mailman/listinfo/buildroot

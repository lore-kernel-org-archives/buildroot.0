From: Microbit_Ubuntu <microbit@virginbroadband.com.au>
Date: Fri, 28 May 2010 10:37:27 +1000
Subject: [Buildroot] Buildroot 2010.05-rc3 released :: 2 build errors -
 lockfile-progs & gdb
In-Reply-To: <877hmpv7km.fsf@macbook.be.48ers.dk>
References: <877hmpv7km.fsf@macbook.be.48ers.dk>
Message-ID: <1275007047.6387.17.camel@ubuntu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Thu, 2010-05-27 at 14:43 +0200, Peter Korsgaard wrote:
> Hi,
> 
> Buildroot 2010.05-rc3 is released - Go download it at:
> 
> http://buildroot.net/downloads/buildroot-2010.05-rc3.tar.gz
> 
> or
> 
> http://buildroot.net/downloads/buildroot-2010.05-rc3.tar.bz2
> 
> Or get it from Git:
> 
> git://git.buildroot.net/buildroot
> 
> Please give it a spin and report any problems to the mailing list or bug
> tracker. Many thanks to the people contributing to this release:
> 
> git shortlog -s -n 2010.05_rc2..
>     49  Peter Korsgaard
>     32  Thomas Petazzoni
>      1  Baruch Siach
>      1  Bj?rn Forsman
>      1  H Hartley Sweeten
>      1  Julien Boibessot
>      1  Nick Leverton
>      1  Yann E. MORIN
>      1  cmchao
> 
> Unless any big issues are found, expect the final 2010.05 release by the
> end of the week - So please give it a good test.
> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

I still come across 2 build errors with rc3 :

1. lockfile-progs-0.1.11
========================
The generated Makefile causes a build error in :
CFLAGS    := -g -Wall -Werror -O2
I still need to remove the -Werror to resume the build ??

2. gdb symlink
==============
ct-ng generates arm-unknown-linux-uclibcgnueabi where I have
arm-elf-xxx as an alias.
The build stops when the symlink for gdb fails. I need to manually
insert a folder 'arm-unknown-linux-uclibcgnueabi' with 'bin' as a
subfolder under ../output/staging/usr

The error is some such :

install
-c /home/kris/buildroot-2010.05-rc3/output/toolchain/gdbhost-6.8/gdb/gdb /home/kris/x-tools/arm-unknown-linux-uclibcgnueabi/bin/arm-elf-gdb
ln -snf ../../bin/arm-unknown-linux-uclibcgnueabi-gdb \
		/home/kris/buildroot-2010.05-rc3/output/staging/usr/arm-unknown-linux-uclibcgnueabi/bin/gdb
ln: creating symbolic link
`/home/kris/buildroot-2010.05-rc3/output/staging/usr/arm-unknown-linux-uclibcgnueabi/bin/gdb': No such file or directory
make: ***
[/home/kris/x-tools/arm-unknown-linux-uclibcgnueabi/bin/arm-elf-gdb]
Error 1


AFAIK I'm using the tool turnkey manner.
Can you advise ?

-- Kris

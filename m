From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  5 Aug 2015 14:05:06 +0000 (UTC)
Subject: [Buildroot] [Bug 8256] pointing to /usr/bin/objcopy old version
 (x86) instead of the generated one
In-Reply-To: <bug-8256-163@https.bugs.busybox.net/>
References: <bug-8256-163@https.bugs.busybox.net/>
Message-ID: <20150805140506.8081481E50@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=8256

--- Comment #2 from CB <christophebricout@yahoo.fr> 2015-08-05 14:05:06 UTC ---
Host configuration
    [elinux]$echo ${HOSTTYPE}
    [elinux] i386-linux

Buildroot Inital step:
     the .config file is exactly the same as generated
     by 'gmake minnowboard_max_defconfig'

history:

    10  15:12   gmake
    11  15:41   history


checking if C symbols get an underscore after compilation... no
checking for __bswapsi2... no
checking for __bswapdi2... no
checking for __ashldi3... no
checking for __ashrdi3... no
checking for __lshrdi3... no
checking for __trampoline_setup... no
checking for __ucmpdi2... no
checking for _restgpr_14_x... no
checking for __ia64_trampoline... no
checking for __udivsi3... no
checking for __umoddi3... no
checking for __udivdi3... no
checking for __divsi3... no
checking for __modsi3... no
checking for __umodsi3... no
checking for __moddi3... no
checking for __divdi3... no
checking for __ctzdi2... no
checking for __ctzsi2... no
checking whether target compiler is working... yes
checking whether /usr/bin/objcopy works for absolute addresses... configure:
error: /usr/bin/objcopy cannot create binary files
gmake: ***
[/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/build/grub2-2.00/.stamp_configured]
Error 1


Further investigation results:

Before launcing gmake, I have  now executed the following command

setenv PATH
"/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/x86_64-buildroot-linux-uclibc/bin:/home/elinu
x/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/bin:${PATH}"
set PATH =
"/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/x86_64-buildroot-linux-uclibc/bin:/home/elinux
/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/bin:${PATH}"

The new result is

checking target system type... x86_64-pc-none
checking for a BSD-compatible install... /usr/bin/install -c
checking whether build environment is sane... yes
checking for x86_64-buildroot-linux-uclibc-strip...
/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/bin/x86_64-buildroot-linux-uclibc-strip
checking for a thread-safe mkdir -p... /bin/mkdir -p
checking for gawk... gawk
checking whether make sets $(MAKE)... yes
checking for cmp... cmp
checking for bison... bison
checking for x86_64-buildroot-linux-uclibc-ranlib...
/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/x86_64-buildroot-linux-uclibc/bin/ranlib
checking for gawk... (cached) gawk
checking for style of include used by make... GNU
checking for x86_64-buildroot-linux-uclibc-gcc...
/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/host/usr/x86_64-buildroot-linux-uclibc/bin/gcc
checking whether the C compiler works... no
configure: error: in
`/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/build/grub2-2.00':
configure: error: C compiler cannot create executables
See `config.log' for more details
gmake: ***
[/home/elinux/localinstall/buildroot-2015.05/install/buildroot-2015.05/output/build/grub2-2.00/.stamp_configured]
Error 77

(In reply to comment #1)
> Thanks for your bug report. Can you first make sure that you can reproduce the
> issue after doing a full rebuild, i.e after doing "make clean all" ?
> 
> Once you have verified this, could you please give us:
> 
> 
>  - The Buildroot version you're using
>  - The exact steps to reproduce the issue
> 
>  - What you mean exactly by "gmake process points to the host
> /usr/bin/objcopy". make doesn't "point" to anything, so this sentence doesn't
> make a lot of sense.
> 
> Also, please attach the last 100 lines of the build output, which contain the
> build failure you're seeing. Thanks!

(In reply to comment #1)
> Thanks for your bug report. Can you first make sure that you can reproduce the
> issue after doing a full rebuild, i.e after doing "make clean all" ?
> 
> Once you have verified this, could you please give us:
> 
> 
>  - The Buildroot version you're using
>  - The exact steps to reproduce the issue
> 
>  - What you mean exactly by "gmake process points to the host
> /usr/bin/objcopy". make doesn't "point" to anything, so this sentence doesn't
> make a lot of sense.
> 
> Also, please attach the last 100 lines of the build output, which contain the
> build failure you're seeing. Thanks!

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

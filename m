From: =?iso-8859-1?Q?Jan_Kundr=E1t?= <jan.kundrat@cesnet.cz>
Date: Wed, 19 Apr 2017 18:23:22 +0200
Subject: [Buildroot]
	=?iso-8859-1?q?=5BPATCH=5D_gcc=3A_Fix_build_failure_r?=
	=?iso-8859-1?q?elated_to_-fPIC_for_x86=5F64_-=3E_i686_builds?=
Message-ID: <71cfdaf7-367d-44de-a1c6-9041e269c8de@cesnet.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Without this patch, I cannot build the toolchain (both host-gcc-initial
> and -final) on Gentoo's amd64 using GCC 4.9.3:
>
>   
> /usr/lib/gcc/x86_64-pc-linux-gnu/4.9.3/../../../../x86_64-pc-linux-gnu/bin/ld:
>   gcov.o: relocation R_X86_64_32 against `.rodata.str1.8' can not
>   be used when making a shared object; recompile with -fPIC

One important piece I forgot to add -- I'm running "Hardened Gentoo GCC" 
which enables PIE by default [1] [2]. As such, this might explain why other 
are (presumably) not seeing this problem.

BTW, I cannot find my original submission on patchwork. Was that e-mail OK? 
I see it in the ML archive [3].

With kind regards,
Jan

[1] 
https://wiki.gentoo.org/wiki/Hardened/Toolchain#Automatic_generation_of_Position_Independent_Executables_.28PIEs.29
[2] 
https://wiki.gentoo.org/wiki/Hardened/Toolchain#Toolchain_modifications_for_automatic_PIEs
[3] http://lists.busybox.net/pipermail/buildroot/2017-April/189441.html

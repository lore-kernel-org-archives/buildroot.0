From: Vania Joloboff <vania.joloboff@tsinghua.edu.cn>
Date: Mon, 20 Apr 2009 16:29:39 +0800
Subject: [Buildroot] Bug with gmp and mpfr
In-Reply-To: <4989680E.4010807@liama.ia.ac.cn>
References: <4989680E.4010807@liama.ia.ac.cn>
Message-ID: <49EC3273.5000100@tsinghua.edu.cn>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,


We have a problem. We have build gcc with buildroot and in most cases it 
works fine.
But in one case we do not want to use the _start entry point because we 
redefine it.
So we use option -nostdlib and then we explicitly want to link with 
libstdc++ and libgcc

so we use a command like

g++ -nostdlib path/to/ourfiles $options -lstdc++ -lc -lgcc

We get

/usr/local/cross/arm/usr/bin/../lib/gcc/arm-linux-uclibc/4.3.2/../../../../arm-linux-uclibc/bin/ld: 
warning: libgcc_s.so.1, needed by 
/usr/local/cross/arm/usr/arm-linux-uclibc/lib/libstdc++.so, not found 
(try using -rpath or -rpath-link)
and then many  undefined references to _Unwind_*

We have tried using

1. -L options on the command line with the directories where are 
libgcc_s.so.1 and libstdc++
2.  the  -static-libgcc option
3. using export LD_LIBRARY_PATH=/path/to/libs
4. using LD_RUN_PATH=/path/to/libs

None of the 4 above work.

Does anybody have any clue ?

Can we build buildroot so that it uses only static linking ?

PS: Using the -L option just works fine if we build gcc with binutils 
and newlib.
It does not work with uclibc.

-- 
Sincerely,
-- Vania Joloboff
======================================================================
Tsinghua University, FIT Building, 3-605, Beijing 100040, China
Tel: +80 10 6279 6979 x605
email: vania.joloboff at tsinghua.edu.cn

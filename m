From: Cyril HAENEL <chaenel@free.fr>
Date: Tue, 07 Apr 2009 18:58:06 +0200
Subject: [Buildroot] JFFS2 / MTD suggestions
In-Reply-To: <20090407083540.15437e75@surf>
References: <20090407083540.15437e75@surf>
Message-ID: <49DB861E.8040503@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



Thomas Petazzoni a ?crit :
> Hi,
>
> When selecting jffs2 as the output filesystem, mtd-utils gets compiled
> both on the host and on the target. I think that generating a jffs2
> filesystem image should *not* trigger the compilation/installation of
> mtd-utils inside the target since this is not necessary.
>
> Moreover, the compilation of host mtd-utils fails with "lzo/lzo1.h not
> found" if the liblzo-dev package is not installed on the host. We
> should probably add a test checking this and telling the user to
> install liblzo-dev, because the current state is quite confusing.
>
> Sincerly,
>
> Thomas
>   
Hi,

On my machine I have a strange problem when I activate jffs2 as the 
output filesystem. The build process blocks when building the lzo package :

configure: Configuring LZO 2.03
checking build system type... i386-pc-linux-gnu
checking host system type... arm-unknown-linux-gnu
checking target system type... arm-unknown-linux-gnu
checking whether to enable maintainer-specific portions of Makefiles... no
checking for arm-linux-gcc... 
/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-gcc 
-Os -pipe -Os  
-I/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/usr/include 
-I/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/include 
--sysroot=/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir/ 
-isysroot 
/home/nlc/developpement/linuxEmbedded/buildroot/build_arm/staging_dir 
-mabi=apcs-gnu
checking for C compiler default output file name... a.out
checking whether the C compiler works... yes
checking whether we are cross compiling... yes
checking for suffix of executables...
checking for suffix of object files... o
checking whether we are using the GNU C compiler... yes
[...]
[...]
[...]
checking how to recognise dependent libraries... pass_all
checking for ANSI C header files... yes
checking for sys/types.h... yes
checking for sys/stat.h... yes
checking for stdlib.h... yes
checking for string.h... yes
checking for memory.h... yes
checking for strings.h... yes
checking for inttypes.h... yes
checking for stdint.h... yes
checking for unistd.h... yes
checking dlfcn.h usability... yes
checking dlfcn.h presence... yes
checking for dlfcn.h... yes
checking for arm-linux-g++... arm-linux-g++
checking whether we are using the GNU C++ compiler...


1 hour after it's alway blocked on the last line...

Any idea !?

Regards,
Cyril

-- 

Cyril Haenel
Registered Linux User #332632

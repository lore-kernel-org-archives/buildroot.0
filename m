From: Will Newton <will.newton@gmail.com>
Date: Thu, 27 Aug 2009 16:07:33 +0100
Subject: [Buildroot] gmp error with git version
In-Reply-To: <4A969D66.1040506@cimeq.qc.ca>
References: <4A969D66.1040506@cimeq.qc.ca>
Message-ID: <87a5b0800908270807h69da421y276edafa60f3fa16@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 27, 2009 at 3:51 PM, Jonathan Dumaresq<jdumaresq@cimeq.qc.ca> wrote:
> Hi all,
>
> I'm trying the git version of buildroot for my atngw100 and I got this
> error.
>
> I did
>
> make atngw100_defconfig
> make
>
>
> bzcat /home/dumarjo/projects/buildroot/dl/gmp-4.2.4.tar.bz2 | tar -C
> /home/dumarjo/projects/buildroot/toolchain_build_avr32 ? -xf -
> toolchain/patch-kernel.sh
> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4
> package/gmp/ \*.patch
> cp -f package/gnuconfig/config.sub package/gnuconfig/config.guess
> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4
> touch
> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4/.unpacked
> mkdir -p
> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4-host
> (cd /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4-host;
> rm -rf config.cache; \
>
> PATH=/home/dumarjo/projects/buildroot/build_avr32/host_dir/bin:/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/bin:/home/dumarjo/projects/C2T3/buildroot-avr32-v2.3.0-1/buildroot-avr32-v2.3.0/build_avr32/staging_dir/usr/bin:
> /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
> AR="/usr/bin/ar" AS="/usr/bin/as" LD="/usr/bin/ld
> -L/home/dumarjo/projects/buildroot/build_avr32/host_dir/lib
> -L/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/lib"
> NM="/usr/bin/nm" CC="/usr/bin/gcc
> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/include
> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
> GCC="/usr/bin/gcc
> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/include
> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
> CXX="/usr/bin/g++
> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/include
> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
> CPP="/usr/bin/cpp
> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/include
> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
> AR_FOR_BUILD="/usr/bin/ar" AS_FOR_BUILD="/usr/bin/as"
> CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc"
> CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld"
> FC_FOR_BUILD="/usr/bin/ld"
> CFLAGS_FOR_BUILD="-I/home/dumarjo/projects/buildroot/build_avr32/host_dir/include
> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
> CXXFLAGS_FOR_BUILD="-I/home/dumarjo/projects/buildroot/build_avr32/host_dir/include
> -I/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/include"
> LDFLAGS_FOR_BUILD="-L/home/dumarjo/projects/buildroot/build_avr32/host_dir/lib
> -L/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/lib"
> FCFLAGS_FOR_BUILD=""
> AR_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ar"
> AS_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-as"
> CC_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-gcc"
> LD_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld"
> NM_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-nm"
> RANLIB_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ranlib"
> STRIP_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-strip"
> OBJCOPY_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-objcopy"
> OBJDUMP_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-objdump"
> DEFAULT_ASSEMBLER="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-as"
> DEFAULT_LINKER="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld"
> ORIGINAL_AS_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-as"
> ORIGINAL_LD_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-ld"
> ORIGINAL_NM_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-nm"
> ORIGINAL_OBJDUMP_FOR_TARGET="/home/dumarjo/projects/buildroot/build_avr32/staging_dir/usr/bin/avr32-linux-uclibc-objdump"
> PKG_CONFIG="/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/bin/pkg-config"
> PKG_CONFIG_PATH="/home/dumarjo/projects/buildroot/build_avr32/host_dir/usr/lib/pkgconfig"
> \
> ? ? ? ? ? ? ? ?\
>
> /home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4/configure \
>
> --prefix="/home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp" \
> ? ? ? ? ? ? ? --build=i386-pc-linux-gnu \
> ? ? ? ? ? ? ? --host=i386-pc-linux-gnu \
> ? ? ? ? ? ? ? --disable-shared \
> ? ? ? ? ? ? ? --enable-static \
> ? ? ? ? ? ? ? ?\
> ? ? ? )
> /bin/bash: line 1:
> /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games: No
> such file or directory
> make: ***
> [/home/dumarjo/projects/buildroot/toolchain_build_avr32/gmp-4.2.4-host/.configured]
> Error 127
>
> I could not what file is missing.

It looks like you have a space at the start of your PATH environment
variable that is causing the shell to parse part of PATH as an
executable name.

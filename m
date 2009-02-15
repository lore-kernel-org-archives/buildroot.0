From: Rob Landley <rob@landley.net>
Date: Sun, 15 Feb 2009 01:55:19 -0600
Subject: [Buildroot]
 =?iso-8859-1?q?Error=3A_duplicate_=2Epersonality_dire?=
 =?iso-8859-1?q?ctive_while_building_libstdc++=09w/_ARM_EABI?=
In-Reply-To: <1181064053.10600.27.camel@argo>
References: <1181064053.10600.27.camel@argo>
Message-ID: <200902150155.19899.rob@landley.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Did you ever get a reply to this message?  I'm hitting it now on an unrelated 
project and this message is the most relevant google hit that comes up.

Possibly gcc 4.1.2 doesn't properly support arm eabi with C++...

Rob

On Tuesday 05 June 2007 12:20:53 Jon Nalley wrote:
> All,
>
> I have been attempting to produce an ARM EABI toolchain (including g++)
> using the buildroot.  The build fails while building libstdc++ with the
> error "duplicate .personality directive".  I did some googling and it
> looks like this is coming from gas from binutils.  Although the build
> fails to create libstdc++ it does successfully build gcc and I have
> verified that gcc produces EABI binaries.  I have also verified that if
> I disable EABI (and change the GNU target suffix to linux-uclibc) in the
> buildroot config that the c++ compiler along with everything else
> successfully builds.
>
> Does anyone know why enabling EABI would prevent libstdc++ from
> building?
>
> I have selected the following in the Buildroot Configuration:
>
> Target Architecture (armeb)
> Target Architecture Variant (xscale)
> Target ABI (EABI)
> GNU target suffix (linux-uclibcgnueabi)
> Binutils Version (binutils 2.17.50.0.16)
> GCC compiler Version (gcc 4.1.2)
> Build/install c++ compiler and libstdc++ (y)
>
> More context for the error is attached below.
>
> Any ideas on this issue are greatly appreciated.
>
> Thanks,
>
> Jon Nalley
>
>
> Making all in libsupc++
> make[5]: Entering directory \
>    
> `/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux-
>uclibcgnueabi/libstdc++-v3/libsupc++' /bin/sh ../libtool --tag CXX --tag
> disable-shared --mode=compile \
> /uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/./gcc/xgcc \
> -shared-libgcc
> -B/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/./gcc \
> -nostdinc++ \
>    
> -L/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux
>-uclibcgnueabi/libstdc++-v3/src \
> -L/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux
>-uclibcgnueabi/libstdc++-v3/src/.libs \
> -B/uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi
>/bin/ \
> -B/uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi
>/lib/ \ -isystem
> /uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/i
>nclude \ -isystem
> /uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/s
>ys-include \
> -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/../g
>cc \
> -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux
>-uclibcgnueabi/libstdc++-v3/include/armeb-linux-uclibcgnueabi \
> -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux
>-uclibcgnueabi/libstdc++-v3/include \
> -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/libs
>upc++  \ -g -Os -fno-implicit-templates -prefer-pic -Wall -Wextra
> -Wwrite-strings -Wcast-qual \ -fdiagnostics-show-location=once 
> -ffunction-sections -fdata-sections  -c -o eh_alloc.lo \
> /uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/libsup
>c++/eh_alloc.cc
> /uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/./gcc/xgcc
> -shared-libgcc \
> -B/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/./gcc
> -nostdinc++ \
> -L/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux
>-uclibcgnueabi/libstdc++-v3/src \
> -L/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux
>-uclibcgnueabi/libstdc++-v3/src/.libs \
> -B/uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi
>/bin/ \
> -B/uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi
>/lib/ \ -isystem
> /uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/i
>nclude \ -isystem
> /uclibc-buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibcgnueabi/s
>ys-include \
> -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/../g
>cc \
> -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux
>-uclibcgnueabi/libstdc++-v3/include/armeb-linux-uclibcgnueabi \
> -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2-final/armeb-linux
>-uclibcgnueabi/libstdc++-v3/include \
> -I/uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/libs
>upc++ \ -g -Os -fno-implicit-templates -Wall -Wextra -Wwrite-strings
> -Wcast-qual -fdiagnostics-show-location=once \ -ffunction-sections
> -fdata-sections -c
> /uclibc-buildroot/toolchain_build_armeb_nofpu/gcc-4.1.2/libstdc++-v3/libsup
>c++/eh_alloc.cc \ -fPIC -DPIC -o eh_alloc.o
> /tmp/ccPjsGDj.s: Assembler messages:
> /tmp/ccPjsGDj.s:354: Error: duplicate .personality directive
> make[5]: *** [eh_alloc.lo] Error 1
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot

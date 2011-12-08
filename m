From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 08 Dec 2011 10:19:26 -0300
Subject: [Buildroot] Error building for ARM Cortex A8 - "For cortex-a8
 real value is cortexa8"
In-Reply-To: <CAOh8SabFka2WK=WK0Uu2KRFw1kfkfBsXKMxWTFXLRwEdC3bnKg@mail.gmail.com>
References: <CAOh8SabFka2WK=WK0Uu2KRFw1kfkfBsXKMxWTFXLRwEdC3bnKg@mail.gmail.com>
Message-ID: <4c8a8afa79c6489405d54c676c9c49d2@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08.12.2011 02:15, Alireza Nematollahi wrote:

> Hello
>
> I am trying to build "buildroot" on CentOS 6 64 bit for my ARM Cortex
> A8 target. I have gcc/g++ 4.2. In the settings for buildroot the only
> one I change is the target type, arm and arm cortex a8. I left
> everything else untouched to build a default copy.
>
> Everytime I build I get the same error message:
> "/usr/bin/make -j2 -C
> 
> /home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial
> all-gcc
> make[1]: Entering directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial
>
> Configuring in ./gcc
> make[2]: Entering directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libiberty
> make[3]: Entering directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libiberty/testsuite
>
> make[3]: Nothing to be done for `all.
> make[3]: Leaving directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libiberty/testsuite
> make[2]: Leaving directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libiberty
>
> make[2]: Entering directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/intl
> make[2]: Nothing to be done for `all.
> make[2]: Leaving directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/intl
>
> make[2]: Entering directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/libiberty
> make[3]: Entering directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/libiberty/testsuite
>
> make[3]: Nothing to be done for `all.
> make[3]: Leaving directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/libiberty/testsuite
>  make[2]: Leaving directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/libiberty
> make[2]: Entering directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libdecnumber
>
> make[2]: Nothing to be done for `all.
> make[2]: Leaving directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/libdecnumber
> make[2]: Entering directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/fixincludes
>
> make[2]: Nothing to be done for `all.
> make[2]: Leaving directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/fixincludes
> make[2]: Entering directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/build-i686-pc-linux-gnu/fixincludes
> ...
> For ?real value is?
> For cortex-a8 real value is cortexa8
> Unknown arch used in --with-arch=armv7-a
> make[1]: *** [configure-gcc] Error 1
> make[1]: Leaving directory
> 
> `/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial
> make: ***
> 
> [/home/alireza/Downloads/buildroot-2011.11/output/toolchain/gcc-4.3.6-initial/.compiled]
> Error 2"
>
> I dont know what I am doing wrong or what is wrong with my set up. 
> Can
> anybody help me with this please? I am fairly new to this.
>
> Thanks very much

You are targeting a Cortex A8 core with gcc-4.3.6, that won't work and 
it's explicitly stated so in the configuration menu when selecting the 
target architecture variante.
You need at least gcc 4.4.
Regards.

From: Angirasa <agnirasa@gmail.com>
Date: Tue, 18 Nov 2008 07:59:30 -0800
Subject: [Buildroot] Status of buildroot on Mac OS X
In-Reply-To: <873ahpb5wv.fsf@macbook.be.48ers.dk>
References: <4921EB3B.4020102@gmail.com> <873ahpb5wv.fsf@macbook.be.48ers.dk>
Message-ID: <4922E662.9010706@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


They are mainly related to the compilation of ulibc gcc and to my best
knowledge are there because of use of glibc.

The Mac OS X libs are not compatible with glibc usage it seems.
Following are the exact errors after I force it to use the Mac OS X
library.


/usr/bin/gcc -c   -g -O2 -DIN_GCC -DCROSS_COMPILE  -W -Wall
-Wwrite-strings -Wstrict-prototypes -Wmissing-prototypes
-Wold-style-definition -Wmissing-format-attribute    -DHAVE_CONFIG_H
-DGENERATOR_FILE -I. -Ibuild
-I/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc
-I/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/build
-I/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/../include
-I/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/../libcpp/include
-I/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gmp/include
-I/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/mpfr/include
-I/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/../libdecnumber
-I../libdecnumber    -o build/genmodes.o
/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/genmodes.c
In file included from /usr/include/sys/wait.h:117,
                 from /usr/include/stdlib.h:65,
                 from
/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/system.h:207,
                 from
/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/genmodes.c:22:
/usr/include/sys/resource.h:88: error: two or more data types in
declaration specifiers
In file included from
/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/genmodes.c:22:
/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/system.h:397:20:
error: malloc.h: No such file or directory
In file included from
/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/genmodes.c:22:
/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2/gcc/system.h:417:
error: conflicting types for ?strsignal?
/usr/include/string.h:136: error: previous declaration of ?strsignal?
was here
make[3]: *** [build/genmodes.o] Error 1
make[2]: *** [all-gcc] Error 2
make[1]: *** [all] Error 2
make: ***
[/Users/agnirasa/Documents/Dev/ToolChainS/build/buildroot-avr32-v2.2.1/toolchain_build_avr32/gcc-4.2.2-final/.compiled]
Error 2




Peter Korsgaard wrote:
>>>>>> "Angirasa" == Angirasa  <agnirasa@gmail.com> writes:
> 
>  Angirasa> Hey all,
> 
>  Angirasa> Was just wondering if there is any active
>  Angirasa> work/solution/workaround for having buildroot on Mac OS X.
> 
> We have received patches in the past, but to my knowledge no
> developers are actively using macosx - What problems are you seing
> exactly?
> 

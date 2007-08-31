From: Gertjan Hofman <gertjan_hofman@yahoo.com>
Date: Fri, 31 Aug 2007 15:00:47 -0700 (PDT)
Subject: [Buildroot] ARM config error with  buildroot-20070830
Message-ID: <216458.52630.qm@web32606.mail.mud.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Dear Sir(s)

Let me start with an apology for what are probably
beginners question. I got 20070830 snapshot. Attempted
a first build with miminal changes to the config file:
I choose ARM and the Atmel board support
(at91sam9260EK), JFF2 image. Nothing else. Then a make

The process goes well until:
make[2]: Entering directory
`/arm/buildroot/buildroot/toolchain_build_arm/gcc-4.2.1-initial/gcc'

and end with:
/usr/bin/gcc  -c   -g -O2 -DIN_GCC -DCROSS_COMPILE  -W
-Wall -Wwrite-strings -Wstrict-prototypes
-Wmissing-prototypes -Wold-style-definition
-Wmissing-format-attribute    -DHAVE_CONFIG_H
-DGENERATOR_FILE -I. -Ibuild
-I/arm/buildroot/buildroot/toolchain_build_arm/gcc-4.2.1/gcc
-I/arm/buildroot/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/build
-I/arm/buildroot/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../include
-I/arm/buildroot/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../libcpp/include
-I/arm/buildroot/buildroot/toolchain_build_arm/gmp/include
-I/arm/buildroot/buildroot/toolchain_build_arm/mpfr/include
-I/arm/buildroot/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/../libdecnumber
-I../libdecnumber    -o build/gengtype.o
/arm/buildroot/buildroot/toolchain_build_arm/gcc-4.2.1/gcc/gengtype.c
/arm/buildroot/buildroot/build_arm/staging_dir/usr/bin/arm-linux-uclibc-as:
unrecognized option `-Qy'
make[2]: *** [build/errors.o] Error 1

(if the formatting mucked it, it the horrible yahoo
mail editor).

I tried looking for a '-Qy' option anywhere. I have no
idea where its set. Can any one point me in the right
direction ? I am happy to try things, post my .config
etc.

Much appreciated

Gertjan


Note also that in package:

MPFR_VERSION:=2.1.0
MPFR_PATCH:=patches

should read:

MPFR_VERSION:=2.3.0
#MPFR_PATCH:=patches








       
____________________________________________________________________________________
Be a better Heartthrob. Get better relationship answers from someone who knows. Yahoo! Answers - Check it out. 
http://answers.yahoo.com/dir/?link=list&sid=396545433

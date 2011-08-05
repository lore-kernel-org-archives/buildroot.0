From: Reef Morse <reef1944@gmail.com>
Date: Fri, 05 Aug 2011 08:14:28 -0400
Subject: [Buildroot] Problem compiling buildroot - assembler error with
 cplus-dem.o and regex.o
Message-ID: <4E3BDEA4.7020803@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While compiling buildroot on an X86 device, I encounter assembler errors 
when trying to compile cplus-dem.o and regex.o.
What am I doing wrong?
  Here is the result of make for this part (everything up to this point 
has compiled):

root[buildroot-2011.05]# make
/usr/bin/make -j2 -C 
/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final all
make[1]: Entering directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final'
make[2]: Entering directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final'
make[3]: Entering directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/libiberty'
if [ x"-fpic" != x ]; then \
       
/home/sssuser/Desktop/buildroot-2011.05/output/host/usr/bin/ccache 
/usr/bin/gcc -c -DHAVE_CONFIG_H -O2 
-I/home/sssuser/Desktop/buildroot-2011.05/output/host/include 
-I/home/sssuser/Desktop/buildroot-2011.05/output/host/usr/include -I. 
-I/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5/libiberty/../include  
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  
-fpic 
/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5/libiberty/regex.c 
-o pic/regex.o; \
     else true; fi
make[3]: Entering directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/intl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/intl'
make[3]: Entering directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/build-i686-pc-linux-gnu/libiberty'
make[4]: Entering directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/build-i686-pc-linux-gnu/libiberty/testsuite'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/build-i686-pc-linux-gnu/libiberty/testsuite'
make[3]: Leaving directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/build-i686-pc-linux-gnu/libiberty'
make[3]: Entering directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/libdecnumber'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/libdecnumber'
make[3]: Entering directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/build-i686-pc-linux-gnu/fixincludes'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/build-i686-pc-linux-gnu/fixincludes'
if [ x"-fpic" != x ]; then \
       
/home/sssuser/Desktop/buildroot-2011.05/output/host/usr/bin/ccache 
/usr/bin/gcc -c -DHAVE_CONFIG_H -O2 
-I/home/sssuser/Desktop/buildroot-2011.05/output/host/include 
-I/home/sssuser/Desktop/buildroot-2011.05/output/host/usr/include -I. 
-I/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5/libiberty/../include  
-W -Wall -Wwrite-strings -Wc++-compat -Wstrict-prototypes -pedantic  
-fpic 
/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5/libiberty/cplus-dem.c 
-o pic/cplus-dem.o; \
     else true; fi
Assembler messages:
Fatal error: can't create pic/cplus-dem.o: No such file or directory
make[3]: *** [cplus-dem.o] Error 1
make[3]: *** Waiting for unfinished jobs....
Assembler messages:
Fatal error: can't create pic/regex.o: No such file or directory
make[3]: *** [regex.o] Error 1
make[3]: Leaving directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/libiberty'
make[2]: *** [all-libiberty] Error 2
make[2]: Leaving directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final'
make[1]: *** [all] Error 2
make[1]: Leaving directory 
`/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final'
make: *** 
[/home/sssuser/Desktop/buildroot-2011.05/output/toolchain/gcc-4.3.5-final/.compiled] 
Error 2


-- 
Reef Morse, Director
Steppingstone MAgnetic Resonance Training Center
30250 Grand River Ave.
Farmington Hills, MI 48336
248 957 8200

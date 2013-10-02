From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Oct 2013 09:34:57 +0200
Subject: [Buildroot] [PATCH 2/3] lmbench: needs mmu
In-Reply-To: <1380693054.31880.1.camel@phoenix> (Axel Lin's message of "Wed,
 02 Oct 2013 13:50:54 +0800")
References: <1380692976.31880.0.camel@phoenix>
 <1380693054.31880.1.camel@phoenix>
Message-ID: <87had0ruqm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Axel" == Axel Lin <axel.lin@ingics.com> writes:

 Axel> Fix below build error:
 Axel> ./tmp./bin/arm/lmbench.a(lib_timing.o): In function `benchmp':
 Axel> lib_timing.c:(.text+0x34fc): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status.
 Axel> ./bin/arm/lmbench.a(lib_tcp.o): In function `tcp_connect/'cc8Ta2C2.o: Inmake[2]:  function `*** [../bin/arm/bw_file_rd] Error 1
 Axel> initialize':
 Axel> lib_tcp.c:make[2]: (.text+0x208): warning: gethostbyname*** Waiting for unfinished jobs....
 Axel>  is obsolescent, use: getnameinfo
 Axel> bw_pipe.c(): (instead..text
 Axel> /+tmp0x134/)cc5yg1Q2.o: :undefined In  referencefunction  to`server_main `'fork:
 Axel> 'bw_tcp.c
 Axel> .:.(./textbin+/0x298arm)/:lmbench.a (undefinedlib_timing.o )reference:  Into  function`fork '`
 Axel> benchmp/'tmp:/
 Axel> cc5yg1Q2.olib_timing.c:: (In.text function+0x34fc `)main: 'undefined:
 Axel>  bw_tcp.creference: (to. text`fork+0x370'
 Axel> )collect2: : undefined reference to `fork'
 Axel> ../bin/armld returned 1 exit status/lmbench.a(lib_timing.o): In function
 Axel> `benchmp':
 Axel> lib_timing.c:(.text+0x34fc): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[2]: *** [../bin/arm/bw_pipe] Error 1
 Axel> make[2]: *** [../bin/arm/bw_tcp] Error 1
 Axel> ../bin/arm/lmbench.a(lib_timing.o): In function `benchmp':
 Axel> lib_timing.c:(.text+0x34fc): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[2]: *** [../bin/arm/bw_mmap_rd] Error 1
 Axel> ../bin/arm/lmbench.a(lib_timing.o): In function `benchmp':
 Axel> lib_timing.c:(.text+0x34fc): undefined reference to `fork'
 Axel> collect2: ld returned 1 exit status
 Axel> make[2]: *** [../bin/arm/bw_mem] Error 1

The error message looks a bit messed up (parallel make?), but ok -
Committed, thanks.

-- 
Bye, Peter Korsgaard

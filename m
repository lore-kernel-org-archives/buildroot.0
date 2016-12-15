From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 15 Dec 2016 20:05:37 +0100
Subject: [Buildroot] [PATCH 1/1] tinycbor: try to fix unreproducible
 errors
In-Reply-To: <20161215093101.0b19d425@free-electrons.com>
References: <1481659403-7923-1-git-send-email-fabrice.fontaine@orange.com>
 <20161213223739.7735f291@free-electrons.com>
 <CAPi7W83Jr9Cj9qZ=RqAwDjbcjPKQa-ioodc_Mf2zH1HXx=oV9A@mail.gmail.com>
 <20161214000233.7a18fe6a@free-electrons.com>
 <CAPi7W83mnepjSMBh_4PchV-Zi1fSmjHMeo6ib1jiPm=vgYn_eA@mail.gmail.com>
 <20161215093101.0b19d425@free-electrons.com>
Message-ID: <20161215200537.60123c00@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas, Frabrice,

On Thu, 15 Dec 2016 09:31:01 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Thu, 15 Dec 2016 09:17:50 +0100, Fabrice Fontaine wrote:
> 
> > I ping you ;-)  
> 
> So, the problem occurred, but did not abort the build (which overall
> completed successfully). Relevant part of the build log below. It is
> worth mentioning that this build has tinycbor enabled, but cjson
> disabled.
> 
> ESC[3m>>> tinycbor v0.4 BuildingESC[23m
> PATH="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/bin:/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/sbin:/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin:/home/thomas/8e8fd
> 1e19d6d07212f29e19a305712e715fe781b/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games" /usr/bin/make -j25 PATH="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/bin:/home/thomas/8e8fd1e19d6d0721
> 2f29e19a305712e715fe781b/output/host/sbin:/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin:/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/u
> sr/games" AR="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-ar" AS="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-as" LD="/home/thomas/8e
> 8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-ld" NM="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-nm" CC="/home/thomas/8e8fd1e19d6d07212f29e19a305712e
> 715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc" GCC="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc" CPP="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr
> /bin/arm-none-linux-gnueabi-cpp" CXX="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-g++" FC="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueab
> i-gfortran" F77="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gfortran" RANLIB="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-ranlib" RE
> ADELF="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-readelf" STRIP="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-strip" OBJCOPY="/home/
> thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-objcopy" OBJDUMP="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-objdump" AR_FOR_BUILD="/usr/bin/a
> r" AS_FOR_BUILD="/usr/bin/as" CC_FOR_BUILD="/usr/bin/gcc" GCC_FOR_BUILD="/usr/bin/gcc" CXX_FOR_BUILD="/usr/bin/g++" LD_FOR_BUILD="/usr/bin/ld" CPPFLAGS_FOR_BUILD="-I/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/incl
> ude" CFLAGS_FOR_BUILD="-O2 -I/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/include" CXXFLAGS_FOR_BUILD="-O2 -I/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/include" LDFLAGS_FOR_BUILD="-L/home
> /thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/lib -L/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/lib -Wl,-rpath,/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/lib" FCFLAGS_FOR_
> BUILD="" DEFAULT_ASSEMBLER="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-as" DEFAULT_LINKER="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnuea
> bi-ld" CPPFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" CFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os " CXXFLAGS="-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  
> -Os " LDFLAGS="" FCFLAGS=" -Os " FFLAGS=" -Os " PKG_CONFIG="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/pkg-config" STAGING_DIR="/home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/arm-buildr
> oot-linux-gnueabi/sysroot" INTLTOOL_PERL=/usr/bin/perl V=1 -C /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/build/tinycbor-v0.4
> Makefile:79: warning: funopen and fopencookie unavailable, open_memstream can not be implemented and conversion to JSON will not work properly!
> /usr/bin/make -f ./Makefile.configure OUT='>&9' configure 9> .config
> if printf "extern int open_memstream(); int main() { return open_memstream(); }" | \
>             /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -xc  -o /dev/null - ; \
>         then \
>             echo open_memstream-pass := 1 >&9; \
>         fi
> if printf "extern int funopen(); int main() { return funopen(); }" | \
>             /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -xc  -o /dev/null - ; \
>         then \
>             echo funopen-pass := 1 >&9; \
>         fi
> if printf "extern int fopencookie(); int main() { return fopencookie(); }" | \
>             /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -xc  -o /dev/null - ; \
>         then \
>             echo fopencookie-pass := 1 >&9; \
>         fi
> if printf "int main() {}" | \
>             /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -xc -Wl,--gc-sections -o /dev/null - ; \
>         then \
>             echo gc_sections-pass := 1 >&9; \
>         fi
> if printf "#include <stdlib.h>\n #include <cjson/cJSON.h>\n int main() { return cJSON_False; }" | \
>             /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -xc -lcjson -o /dev/null - ; \
>         then \
>             echo system-cjson-pass := 1 >&9; \
>         fi
> if printf "#include <stdlib.h>\n #include <cjson/cJSON.h>\n int main() { return cJSON_False; }" | \
>             /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -xc -I./src/cjson -o /dev/null - ; \
>         then \
>             echo cjson-pass := 1 >&9; \
>         fi
> <stdin>:2:26: fatal error: cjson/cJSON.h: No such file or directory
> compilation terminated.
> <stdin>:2:26: fatal error: cjson/cJSON.h: No such file or directory
> compilation terminated.
> /tmp/ccO2eRGv.o: In function `main':
> :(.text+0x8): undefined reference to `funopen'
> collect2: error: ld returned 1 exit status

This error messages are just stderr output of the compile tests (results should
be stored in the file '.config' (any chance to take a lookg at the .config file
after failure?)..., the difference to [1] is that both cJSON.h test
(system-cjson-pass and cjson-pass), [1] shows only one failing cJSON.h test.
Mind that the funopen test is printed first, the stderr output is shown last...

Maybe a parallel build problem (could not reproduce it local)?

Workaround by disabling parallel build? Or write a pre-generated .config before
starting the compile?

	$ cat build/tinycbor-v0.4/.config 
funopen-tested := 1
fopencookie-tested := 1
open_memstream-tested := 1
system-cjson-tested := 1
gc_sections-tested := 1
cjson-tested := 1
fopencookie-pass := 1
system-cjson-pass := 1
cjson-pass := 1
open_memstream-pass := 1
gc_sections-pass := 1

Regards,
Peter 

[1] http://autobuild.buildroot.net/results/8e8/8e8fd1e19d6d07212f29e19a305712e715fe781b/build-end.log


> /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -DTINYCBOR_VERSION=\"0.4\" -std=c99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o src/cborerrorstrings.o src/cborerrorstrings.c
> /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -DTINYCBOR_VERSION=\"0.4\" -std=c99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o src/cborencoder.o src/cborencoder.c
> /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -DTINYCBOR_VERSION=\"0.4\" -std=c99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o src/cborencoder_close_container_checked.o src/cborencoder_close_container_checked.c
> /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -DTINYCBOR_VERSION=\"0.4\" -std=c99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o src/cborparser.o src/cborparser.c
> /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -DTINYCBOR_VERSION=\"0.4\" -std=c99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o src/cborparser_dup_string.o src/cborparser_dup_string.c
> /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -DTINYCBOR_VERSION=\"0.4\" -std=c99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o src/cborpretty.o src/cborpretty.c
> mkdir -p lib
> /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -DTINYCBOR_VERSION=\"0.4\" -std=c99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o src/cbortojson.o src/cbortojson.c
> mkdir -p bin
> /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I./src -DTINYCBOR_VERSION=\"0.4\" -std=c99 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -c -o tools/cbordump/cbordump.o tools/cbordump/cbordump.c
> sed > tinycbor.pc < tinycbor.pc.in \
>                 -e 's, at prefix@,/usr/local,' \
>                 -e 's, at exec_prefix@,/usr/local,' \
>                 -e 's, at libdir@,/usr/local/lib,' \
>                 -e 's, at includedir@,/usr/local/include,' \
>                 -e 's, at version@,0.4,'
> /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-ar cqs lib/libtinycbor.a src/cborerrorstrings.o src/cborencoder.o src/cborencoder_close_container_checked.o src/cborparser.o src/cborparser_dup_string.o src/cborpretty.o src/cbortojson.o
> /home/thomas/8e8fd1e19d6d07212f29e19a305712e715fe781b/output/host/usr/bin/arm-none-linux-gnueabi-gcc -o bin/cbordump  tools/cbordump/cbordump.o lib/libtinycbor.a  -lm
> ESC[3m>>> tinycbor v0.4 Installing to staging directoryESC[23m
> 
> Thomas

From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 17 Sep 2008 12:33:21 +0200
Subject: [Buildroot] Cannot build uclibc++ against
	toolchain	(dl_iterate_phdr & __tls_get_addr)
In-Reply-To: <97e646690809170233k12f5ae5iad2048e8197a3ef8@mail.gmail.com>
References: <97e646690809170233k12f5ae5iad2048e8197a3ef8@mail.gmail.com>
Message-ID: <20080917103321.GB21123@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 17, 2008 at 11:33:33AM +0200, Flemming Madsen wrote:
>Hello
>
>First of all: Thank you codepoet folks for all this wonderful stuff!

s/codepoet//

not all of us are erik ;)
>
>I am having touble building uclibc++ Upon linking the .so file i get the
>output below.

>I am using gcc 4.2.4 and uClibc 0.9.29 since these were the defaults (Full
>.config attached)

>arm-linux-uclibc-gcc -Wl,--warn-common -Wl,--warn-once -Wl,-z,combreloc
>-Wl,-z,defs -nodefaultlibs -shared -Wl,-soname,libuClibc++.so.0 `echo ""`
>-Wl,-s -o libuClibc++-0.2.2.so algorithm.o associative_base.o bitset.o
>char_traits.o complex.o del_op.o del_opnt.o del_opv.o del_opvnt.o deque.o
>eh_alloc.o eh_globals.o exception.o fstream.o func_exception.o iomanip.o
>ios.o iostream.o istream.o iterator.o limits.o list.o locale.o map.o
>new_handler.o new_op.o new_opnt.o new_opv.o new_opvnt.o numeric.o ostream.o
>queue.o set.o sstream.o stack.o stdexcept.o streambuf.o string.o utility.o
>valarray.o vector.o abi/abi.o abi/libsupc/cp-demangle.o abi/libsupc/eh_arm.o
>abi/libsupc/eh_aux_runtime.o abi/libsupc/eh_call.o abi/libsupc/eh_catch.o
>abi/libsupc/eh_exception.o abi/libsupc/eh_personality.o
>abi/libsupc/eh_term_handler.o abi/libsupc/eh_terminate.o
>abi/libsupc/eh_throw.o abi/libsupc/eh_type.o abi/libsupc/eh_unex_handler.o
>abi/libsupc/guard.o abi/libsupc/tinfo.o abi/libsupc/tinfo2.o
>abi/libsupc/vec.o abi/libsupc/vterminate.o abi/libgcc_eh/gthr-gnat.o
>abi/libgcc_eh/unwind-c.o abi/libgcc_eh/unwind-dw2-fde-glibc.o
>abi/libgcc_eh/unwind-dw2.o abi/libgcc_eh/unwind-sjlj.o
>-L/opt/toolchain-stable/t26/usr/bin/../lib/gcc/arm-linux-uclibc/4.2.4/ -lc
>-lgcc -ldl -Wl,--as-needed -lgcc_s -Wl,--no-as-needed
>eh_globals.o: In function `__cxa_get_globals':
>eh_globals.cpp:(.text+0xc): undefined reference to `__tls_get_addr'

i'm quite sure that 0.9.29 didn't have TLS support.

>abi/libgcc_eh/unwind-dw2-fde-glibc.o: In function `_Unwind_Find_FDE':
>unwind-dw2-fde-glibc.c:(.text+0x17b8): undefined reference to `
>dl_iterate_phdr'

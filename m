From: Kay McCormick <kaym@modsystems.com>
Date: Mon, 17 Sep 2007 14:19:44 -0700
Subject: [Buildroot] failure to build c++ for 3.4.x version
Message-ID: <2D30722FBBDE6749973243F4F01BE984C65629@dotexchange.dotcorporation.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello, I am trying to build c++ cross compiler for 3.4.x.  I am getting
a failure of the following:

 

/home/kaym/src/buildroot/toolchain_build_i386/gcc-3.4.6-final/gcc/xgcc 

... <stuff removed> ...

-c
/home/kaym/src/buildroot/toolchain_build_i386/gcc-3.4.6/libstdc++-v3/src
/allocator.cc  -fPIC -DPIC -o .libs/allocator.o

In file included from
/home/kaym/src/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux
-uclibc/libstdc++-v3/include/iosfwd:46,

                 from
/home/kaym/src/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux
-uclibc/libstdc++-v3/include/bits/stl_algobase.h:70,

                 from
/home/kaym/src/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux
-uclibc/libstdc++-v3/include/memory:54,

                 from
/home/kaym/src/buildroot/toolchain_build_i386/gcc-3.4.6/libstdc++-v3/src
/allocator.cc:35:

/home/kaym/src/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux
-uclibc/libstdc++-v3/include/i386-linux-uclibc/bits/c++locale.h: In
function `int std::__convert_from_v(char*, int, const char*, _Tv, int*
const&, int)':

/home/kaym/src/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linux
-uclibc/libstdc++-v3/include/i386-linux-uclibc/bits/c++locale.h:103:
error: `snprintf' is not a member of `std'

make[4]: *** [allocator.lo] Error 1

 

I removed std:: from the offending line and it worked.  I'm not sure if
the solution is a gcc-version-dependent #ifdef or if there is some
larger issue I'm unaware of.  Was this a bug in gcc?

 

Later on I got:

 

for file in ./i386-linux-uclibc/bits/stdc++.h.gch/*; do \

          /usr/bin/install -c -m 644 $file
/home/kaym/src/buildroot/build_i386/staging_dir/include/c++/3.4.6/./i386
-linux-uclibc/bits/stdc++.h.gch; done

/usr/bin/install: cannot stat `./i386-linux-uclibc/bits/stdc++.h.gch/*':
No such file or directory

make[4]: *** [install-pch] Error 1

make[4]: Leaving directory
`/home/kaym/src/buildroot/toolchain_build_i386/gcc-3.4.6-final/i386-linu
x-uclibc/libstdc++-v3/include'

 

So I created a file named 'junk' in
toolchain_build_i386/gcc-3.4.6-final/i386-linux-uclibc/libstdc++-v3/incl
ude/i386-linux-uclibc/bits/stdc++.h.gch which seems to have gotten me
past that part.

 

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070917/52ba8221/attachment.htm 

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Apr 2015 12:43:37 +0200
Subject: [Buildroot] [PATCH 1/2] package/gcc: Fix compiling jsoncpp with
 musl
In-Reply-To: <1428739163-3413-1-git-send-email-bernd.kuhls@t-online.de>
References: <1428739163-3413-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150411124337.4cf40664@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 11 Apr 2015 09:59:22 +0200, Bernd Kuhls wrote:
> [ 16%] Building CXX object src/lib_json/CMakeFiles/jsoncpp_lib.dir/json_value.cpp.o
> In file included from /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/xmmintrin.h:34:0,
>                  from /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/x86intrin.h:31,
>                  from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/x86_64-buildroot-linux-musl/bits/opt_random.h:33,
>                  from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/random:50,
>                  from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/bits/stl_algo.h:66,
>                  from /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/include/c++/4.9.2/algorithm:62,
>                  from /home/fli4l/br3/output/build/jsoncpp-1.6.1/src/lib_json/json_value.cpp:20:
> /home/fli4l/br3/output/host/usr/lib/gcc/x86_64-buildroot-linux-musl/4.9.2/include/mm_malloc.h:34:64: error: declaration of 'int posix_memalign(void**, size_t, size_t) throw ()' has a different exception specifier
>  extern "C" int posix_memalign (void **, size_t, size_t) throw ();
>                                                                 ^
> In file included from /home/fli4l/br3/output/build/jsoncpp-1.6.1/include/json/assertions.h:9:0,
>                  from /home/fli4l/br3/output/build/jsoncpp-1.6.1/src/lib_json/json_value.cpp:7:
> /home/fli4l/br3/output/host/usr/x86_64-buildroot-linux-musl/sysroot/usr/include/stdlib.h:98:5: error: from previous declaration 'int posix_memalign(void**, size_t, size_t)'
>  int posix_memalign (void **, size_t, size_t);
>      ^
> make[2]: *** [src/lib_json/CMakeFiles/jsoncpp_lib.dir/json_value.cpp.o] Error 1
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

I think instead just make jsoncpp depends on !musl. Because while this
patch fixes the problem for the internal toolchain backend, it will
continue to fail with external musl toolchains.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

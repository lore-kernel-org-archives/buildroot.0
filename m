From: servo gmrt <servo.gmrt@gmail.com>
Date: Thu, 15 Sep 2016 22:20:41 +0530
Subject: [Buildroot] RTAI math module compilation
Message-ID: <CAEqQue108OTCsmAejX1sR6q8HL2zCj7jXtaB927b=kHo=UQTrA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Anybody compiled rtai in buildroot-2016.02 version ?

Other than "rtai_math.ko" all the modules compiles without error. When I
include math module for compilation, I am getting the following error,

The part of the make error log I attached with that.

Help me to resolve the issue.


In file included from /usr/include/features.h:365:0,
                 from ../rtai-4.0.1/base/include/rtai_math.h:37,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/sys/cdefs.h:236:0: warning: "__attribute_const__" redefined
 # define __attribute_const__ __attribute__ ((__const__))
 ^
In file included from include/linux/compiler.h:54:0,
                 from include/linux/linkage.h:4,
                 from include/linux/kernel.h:6,
                 from ../rtai-4.0.1/base/math/libm.c:21:
include/linux/compiler-gcc.h:93:0: note: this is the location of the
previous definition
 #define __attribute_const__  __attribute__((__const__))
 ^
In file included from /usr/include/features.h:365:0,
                 from ../rtai-4.0.1/base/include/rtai_math.h:37,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/sys/cdefs.h:307:0: warning: "__always_inline" redefined
 # define __always_inline __inline __attribute__ ((__always_inline__))
 ^
In file included from include/linux/compiler.h:54:0,
                 from include/linux/linkage.h:4,
                 from include/linux/kernel.h:6,
                 from ../rtai-4.0.1/base/math/libm.c:21:
include/linux/compiler-gcc.h:112:0: note: this is the location of the
previous definition
 #define __always_inline  inline __attribute__((always_inline))
 ^
In file included from ../rtai-4.0.1/base/include/rtai_math.h:77:0,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/bits/mathcalls.h:63:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (cos,, (_Mdouble_ __x));
                     ^
/usr/include/bits/mathcalls.h:65:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (sin,, (_Mdouble_ __x));
                     ^
In file included from ../rtai-4.0.1/base/include/rtai_math.h:77:0,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/bits/mathcalls.h:100:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (exp,, (_Mdouble_ __x));
                     ^
/usr/include/bits/mathcalls.h:109:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (log,, (_Mdouble_ __x));
                     ^
In file included from ../rtai-4.0.1/base/include/rtai_math.h:77:0,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/bits/mathcalls.h:153:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (pow,, (_Mdouble_ __x, _Mdouble_ __y));
                     ^
In file included from ../rtai-4.0.1/base/include/rtai_math.h:104:0,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/bits/mathcalls.h:63:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (cos,, (_Mdouble_ __x));
                     ^
/usr/include/bits/mathcalls.h:65:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (sin,, (_Mdouble_ __x));
                     ^
In file included from ../rtai-4.0.1/base/include/rtai_math.h:104:0,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/bits/mathcalls.h:100:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (exp,, (_Mdouble_ __x));
                     ^
/usr/include/bits/mathcalls.h:109:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (log,, (_Mdouble_ __x));
                     ^
In file included from ../rtai-4.0.1/base/include/rtai_math.h:104:0,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/bits/mathcalls.h:153:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (pow,, (_Mdouble_ __x, _Mdouble_ __y));
                     ^
In file included from ../rtai-4.0.1/base/include/rtai_math.h:129:0,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/bits/mathcalls.h:63:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (cos,, (_Mdouble_ __x));
                     ^
/usr/include/bits/mathcalls.h:65:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (sin,, (_Mdouble_ __x));
                     ^
In file included from ../rtai-4.0.1/base/include/rtai_math.h:129:0,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/bits/mathcalls.h:100:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (exp,, (_Mdouble_ __x));
                     ^
/usr/include/bits/mathcalls.h:109:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (log,, (_Mdouble_ __x));
                     ^
In file included from ../rtai-4.0.1/base/include/rtai_math.h:129:0,
                 from ../rtai-4.0.1/base/math/libm.c:24:
/usr/include/bits/mathcalls.h:153:21: error: expected ?)? before ?,? token
 __MATHCALL_VEC (pow,, (_Mdouble_ __x, _Mdouble_ __y));
                     ^
../rtai-4.0.1/base/math/libm.c:59:15: error: ?cos? undeclared here (not in
a function)
 EXPORT_SYMBOL(cos);
               ^
../rtai-4.0.1/base/math/libm.c:61:15: error: ?exp? undeclared here (not in
a function)
 EXPORT_SYMBOL(exp);
               ^
../rtai-4.0.1/base/math/libm.c:67:15: error: ?log? undeclared here (not in
a function)
 EXPORT_SYMBOL(log);
               ^
../rtai-4.0.1/base/math/libm.c:70:15: error: ?pow? undeclared here (not in
a function)
 EXPORT_SYMBOL(pow);
               ^
../rtai-4.0.1/base/math/libm.c:72:15: error: ?sin? undeclared here (not in
a function)
 EXPORT_SYMBOL(sin);
               ^
scripts/Makefile.build:307: recipe for target
'/data/ICOP/buildroot-2016.02/output/build/rtai-4.0.1/base/math/libm.o'
failed
make[2]: ***
[/data/ICOP/buildroot-2016.02/output/build/rtai-4.0.1/base/math/libm.o]
Error 1
Makefile:1220: recipe for target
'_module_/data/ICOP/buildroot-2016.02/output/build/rtai-4.0.1/base/math'
failed
make[1]: ***
[_module_/data/ICOP/buildroot-2016.02/output/build/rtai-4.0.1/base/math]
Error 2
make[1]: Leaving directory
'/data/ICOP/buildroot-2016.02/output/build/linux-3.8.13'
GNUmakefile:877: recipe for target 'rtai_math.ko' failed



Regards,
Thiyagarajan.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160915/b8a161c5/attachment.html>

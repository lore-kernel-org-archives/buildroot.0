From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 11 Aug 2019 22:30:51 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5webengine: fix build error
In-Reply-To: <ff0a929f-f321-7eb6-a9ea-91abd85bacf5@grinn-global.com>
References: <20190730115832.21008-1-b.bilas@grinn-global.com>
 <20190730233029.7360e1bd@gmx.net>
 <ff0a929f-f321-7eb6-a9ea-91abd85bacf5@grinn-global.com>
Message-ID: <20190811223051.707ac1a8@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 31 Jul 2019 09:15:13 +0200
Bartosz Bi?as <b.bilas@grinn-global.com> wrote:

> --sysroot=../../../../../host/arm-buildroot-linux-gnueabihf/sysroot 
> -fvisibility-inlines-hidden -c 
> ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc -o 
> obj/skia/skcms/skcms.o
> ../../3rdparty/chromium/third_party/skia/third_party/skcms/src/Transform_inl.h: 
> In function ?void exec_ops(const Op*, const void**, const char*, char*, 
> int)?:
> ../../3rdparty/chromium/third_party/skia/third_party/skcms/src/Transform_inl.h:560:16: 
> internal compiler error: in convert_move, at expr.c:231
>  ?static void NS(exec_ops)(const Op* ops, const void** args,
>  ??????????????? ^
> ../../3rdparty/chromium/third_party/skia/third_party/skcms/skcms.cc:1909:16: 
> note: in definition of macro ?NS?
>  ?#define NS(id) id
>  ??????????????? ^~
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See <http://bugs.buildroot.net/> for instructions.
> [1902/14080] CXX obj/skia/skia_core_and_effects/SkMipMap.o
> ninja: build stopped: subcommand failed.

Then I'm still confused.

What is the relationship between the patch you're posting and the build
error ? It seems entirely unrelated at first sight.

Is it the requirement of gcc >= 8.x that works around the compiler
bug ? Is there a gcc bug report for this compiler bug ?

Some googling leads to
https://github.com/OSSystems/meta-browser/issues/135, which itself
links to https://gcc.gnu.org/bugzilla/show_bug.cgi?id=83623.

It seems like the bug has been fixed in both the gcc 6.x (fix was in gcc 6.5.0) and gcc 7.x
branches (fix was in gcc 7.3.0).

So, could you give more details about the situation in which you're
encountering this build failure ? Which toolchain are you using ? How
is the patch related to the build failure ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 20 May 2014 14:43:48 +0200
Subject: [Buildroot] Fwd: Fwd: how to assign cpp and c++ in buildroot?
In-Reply-To: <CAMm5YqqioD+6fDWrTW+Jo=wxpCWRet33MJ_OL7=pyFCgbL1ojQ@mail.gmail.com>
References: <52E9D80E-B9AD-417A-BC0F-66A69C39FC21@gmail.com>
 <5F503FD3-3FBC-4ADB-9D17-BA0CB5606B6D@gmail.com>
 <20140520000920.20ae6b5b@free-electrons.com>
 <0727D305-97AD-471C-BA2D-D6A251B4FA90@gmail.com>
 <CAMm5YqqFDD0a_hA0fGdiLDuHLoaCVVgf2L_-wzQikpF4cm7FJw@mail.gmail.com>
 <CAAXf6LUF7eXsQvJRLoO0oHcefs9PGnUOVXGCNNhZ2YKV_SkGVA@mail.gmail.com>
 <20140520113955.475370b3@free-electrons.com>
 <CAMm5YqoPu1QDkzdpoFfZfNCj0V+VeVkYcUPW=xzzqLB-eYAAuQ@mail.gmail.com>
 <CAMm5YqqZjnWaNQ+S5a+huY+tOfHgqv51St9HhQZ=69i-4u9PQw@mail.gmail.com>
 <CAAXf6LUC7Vki85_4iVr-AhijdjpXxHQoYOVSgUAdJcta4-jb6A@mail.gmail.com>
 <CAMm5YqqioD+6fDWrTW+Jo=wxpCWRet33MJ_OL7=pyFCgbL1ojQ@mail.gmail.com>
Message-ID: <CAAXf6LU+UjV3-xWQa5K8CNu79z-2cOoHZgAhmCrxbgth_YFLiw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Cem,

(please keep the buildroot list in copy)

On Tue, May 20, 2014 at 2:24 PM, cem akpolat <akpolatcem@gmail.com> wrote:
> Hi Thomas,
>
> the results are :
>
> env | grep -i cpp
>
>     returns nothing
>
> echo $TARGET_CPP
>
>    returns nothing
>
>
> grep -rn TARGET_CPP package/Makefile.in
>
>
> 110:TARGET_CPPFLAGS += -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> -D_FILE_OFFSET_BITS=64
> 113:TARGET_CFLAGS = $(TARGET_CPPFLAGS) $(TARGET_ABI) $(TARGET_OPTIMIZATION)
> $(TARGET_DEBUGGING)
> 154:TARGET_CPP      = $(TARGET_CROSS)cpp
> 218: CPP="$(TARGET_CPP)"\
> 240: CPPFLAGS="$(TARGET_CPPFLAGS)" \

Thanks, nothing odd here.

Could you also try changing the package/Makefile.in as requested in my
last e-mail?

Thanks,
Thomas

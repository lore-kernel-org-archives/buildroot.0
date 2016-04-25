From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 25 Apr 2016 22:56:54 +0200
Subject: [Buildroot] [PATCH 1/2] package/openjpeg: bump to version 2.1
In-Reply-To: <CA+TH9VnoURBMTiDRPcbj-uEQ9bK7qXXgjmkTvxgyZO7yBUn+3Q@mail.gmail.com>
References: <1461597623-14629-1-git-send-email-angelo.compagnucci@gmail.com>
 <1461597623-14629-2-git-send-email-angelo.compagnucci@gmail.com>
 <20160425212827.07703ac2@free-electrons.com>
 <CA+TH9Vkf-=t2iS7ep1J3ejZ+LREVprQ+AN6wNn39MDAYVV58uw@mail.gmail.com>
 <CAHXCMMJVXtfZjy153Q82+VyrnOF3nT5ZdAMNsK2zxgdQX3X+3g@mail.gmail.com>
 <CA+TH9VnoURBMTiDRPcbj-uEQ9bK7qXXgjmkTvxgyZO7yBUn+3Q@mail.gmail.com>
Message-ID: <CAHXCMMKnW85h-k9waOk_F+tJ4eL-4FOSFcOVZF9_9Rim-ZZB+g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo,

On Mon, Apr 25, 2016 at 10:43 PM, Angelo Compagnucci
<angelo.compagnucci@gmail.com> wrote:
> Dear Samuel Martin
>
[...]
>
> I reviewed the logic a little bit more and I can confirm that keeping
> the default is sensible:
>
> [1] if (BUILD_CODEC OR BUILD_MJ2)
> [2] option(BUILD_THIRDPARTY "Build the thirdparty executables if it is
> needed" OFF)
> [3] ELSE (BUILD_THIRDPARTY)
> [4] IF(ZLIB_FOUND)
>     SET(Z_LIBNAME ${ZLIB_LIBRARIES} PARENT_SCOPE)
>     SET(Z_INCLUDE_DIRNAME ${ZLIB_INCLUDE_DIRS} PARENT_SCOPE)
>     message(STATUS "Your system seems to have a Z lib available, we
> will use it to generate PNG lib")
>     ELSE (ZLIB_FOUND) # not found
>     message(STATUS "Z lib not found, activate BUILD_THIRDPARTY if you
> want build it (necessary to build libPNG)")
>
> So at the end if BUILD_CODEC is ON (default) system libraries will
> only be used if found.
> Is not this the intended behaviuor?
Certainly.
However, they may exist or not, depending on the package selection and
the build order, so my questions are:
- are they required or optional stuff?
- if optional, can we force using or not using them? (from build
reproducibility perspective)


Regards,

-- 
Samuel

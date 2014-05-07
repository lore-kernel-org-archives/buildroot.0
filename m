From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Wed, 7 May 2014 17:32:38 +0200
Subject: [Buildroot] CMake requires ncurses
In-Reply-To: <20140507164753.48c13d65@free-electrons.com>
References: <CAHkwnC-kaMHjsD9GjPiDLdx5vda2CKAnDVXPX-qAUx+r01MCAQ@mail.gmail.com>
 <20140507164753.48c13d65@free-electrons.com>
Message-ID: <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, May 7, 2014 at 4:47 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Wed, 7 May 2014 13:53:07 +0200, Fabio Porcedda wrote:
>
>> because the cmake package requires the ncurses library, what is best
>> thing to do?
>
> Huh? I built CMake just yesterday, and I don't think ncurses was
> needed. Isn't it an optional dependency?

Are you sure that In your system there isn't installed the ncurses
development package?

On my ubuntu distribution if i uninstall the libncurses5-dev package i got:

make defconfig && make allyespackageconfig

make host-cmake

make[3]: Leaving directory `/e/buildroot/br/output/build/host-cmake-2.8.12.2'
In file included from
/home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesWidget.h:16:0,
                 from
/home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesBoolWidget.h:15,
                 from
/home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesBoolWidget.cxx:12:
/home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesStandardIncludes.h:32:31:
fatal error: ncurses/ncurses.h: No such file or directory
 #  include <ncurses/ncurses.h>
                               ^
compilation terminated.

It seems to me that is a required dependency but I'm not sure.

Regards
-- 
Fabio Porcedda

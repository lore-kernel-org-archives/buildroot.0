From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 07 May 2014 17:47:41 +0200
Subject: [Buildroot] CMake requires ncurses
In-Reply-To: <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
References: <CAHkwnC-kaMHjsD9GjPiDLdx5vda2CKAnDVXPX-qAUx+r01MCAQ@mail.gmail.com>
 <20140507164753.48c13d65@free-electrons.com>
 <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
Message-ID: <536A559D.5090009@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio, Thomas,

Fabio Porcedda wrote:
> On Wed, May 7, 2014 at 4:47 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Dear Fabio Porcedda,
>>
>> On Wed, 7 May 2014 13:53:07 +0200, Fabio Porcedda wrote:
>>
>>> because the cmake package requires the ncurses library, what is best
>>> thing to do?
>>
>> Huh? I built CMake just yesterday, and I don't think ncurses was
>> needed. Isn't it an optional dependency?
>
> Are you sure that In your system there isn't installed the ncurses
> development package?
>
> On my ubuntu distribution if i uninstall the libncurses5-dev package i got:
>
> make defconfig && make allyespackageconfig
>
> make host-cmake
>
> make[3]: Leaving directory `/e/buildroot/br/output/build/host-cmake-2.8.12.2'
> In file included from
> /home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesWidget.h:16:0,
>                   from
> /home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesBoolWidget.h:15,
>                   from
> /home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesBoolWidget.cxx:12:
> /home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesStandardIncludes.h:32:31:
> fatal error: ncurses/ncurses.h: No such file or directory
>   #  include <ncurses/ncurses.h>
>                                 ^
> compilation terminated.

Not sure, but the only use of ncurses in CMake is in the ccmake
interactive tool AFAIK. It can probably be disabled at configure time,
it's useless in Buildroot.

-- 
Luca

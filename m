From: Alexander Potashev <aspotashev@gmail.com>
Date: Wed, 7 May 2014 19:39:41 +0400
Subject: [Buildroot] CMake requires ncurses
In-Reply-To: <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
References: <CAHkwnC-kaMHjsD9GjPiDLdx5vda2CKAnDVXPX-qAUx+r01MCAQ@mail.gmail.com>
 <20140507164753.48c13d65@free-electrons.com>
 <CAHkwnC_7GBG+a4oh1aLSc7QeaEsC-N0qROcaNuGSE+Wp0=z34g@mail.gmail.com>
Message-ID: <CADMG6+9asWeE7QYkB7DqPAa1fxgFKMn_fegpb7noq2szYxT3qQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-05-07 19:32 GMT+04:00 Fabio Porcedda <fabio.porcedda@gmail.com>:
> make[3]: Leaving directory `/e/buildroot/br/output/build/host-cmake-2.8.12.2'
> In file included from
> /home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesWidget.h:16:0,
>                  from
> /home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesBoolWidget.h:15,
>                  from
> /home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesBoolWidget.cxx:12:
> /home/fabiopo/buildroot/br/output/build/host-cmake-2.8.12.2/Source/CursesDialog/cmCursesStandardIncludes.h:32:31:
> fatal error: ncurses/ncurses.h: No such file or directory
>  #  include <ncurses/ncurses.h>
>                                ^
> compilation terminated.
>
> It seems to me that is a required dependency but I'm not sure.

Hi Fabio,

Build of "CursesDialog" is optional, see in
output/build/host-cmake-2.8.12.2/Source/CMakeLists.txt:
569 # Curses GUI
570 if(BUILD_CursesDialog)
571   include(${CMake_SOURCE_DIR}/Source/CursesDialog/CMakeLists.txt)
572 endif()

-- 
Alexander Potashev

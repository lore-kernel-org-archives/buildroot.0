From: Vijay <techvd@gmail.com>
Date: Sat, 8 Aug 2020 12:14:45 -0700
Subject: [Buildroot] Having trouble getting a simple cmake based custom
 package to wok
In-Reply-To: <20200808053829.kvyu3lfddv6fsqe2@falbala.internal.home.lespocky.de>
References: <CAOnXkYtSxw2+0VKtNTVsD8Eb36nGfAdBNY3hnSWg2tFtM_wwAg@mail.gmail.com>
 <20200807060851.djtpcq5skahtz2gi@falbala.internal.home.lespocky.de>
 <CAOnXkYt=C1E3-04_A6RaUDBTn-iojOiz=ZWRo6zk0KR5NBRs3Q@mail.gmail.com>
 <20200808053829.kvyu3lfddv6fsqe2@falbala.internal.home.lespocky.de>
Message-ID: <CAOnXkYu+5tHNBPy718b8t=ShL=X4+sK9SsZ0FYPbjRwSW8dbRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry, I hit Reply instead of Reply All.

On Fri, Aug 7, 2020 at 10:38 PM Alexander Dahl <post@lespocky.de> wrote:

> Hello Vijay,
>
> On Fri, Aug 07, 2020 at 05:31:51PM -0700, Vijay wrote:
> > Thank you Alex! Sorry I should've noticed this problem myself. I had C++
> > enabled in a prior version but forgot to do that in this version. After a
> > clean rebuild the project is compiled correctly now.
>
> Good.  However, please answer to the mailinglist, not to me personally
> only.  I don't like to be responsible for personal support. ;-)
>
> > However, when it is
> > trying to install my package I have a new error. The system seems to be
> > looking for a install/fast target, which the Makefil does not have.
>
> I have no idea on that problem.  Maybe read the CMake docs again?
>
> https://cmake.org/cmake/help/latest/command/install.html
>
> Greets
> Alex
>
> > Thanks again,
> > Vijay
> >
> > >>> mytools 1.0 Building
> >
> PATH="/home/foo/buildroot/output/host/bin:/home/foo/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
> >  /usr/bin/make -j9  -C /home/foo/buildroot/output/build/mytools-1.0/
> > Scanning dependencies of target mytools
> > [ 50%] Building CXX object CMakeFiles/mytools.dir/mytools.cpp.o
> > [100%] Linking CXX executable mytools
> > [100%] Built target mytools
> > >>> mytools 1.0 Installing to target
> >
> PATH="/home/foo/buildroot/output/host/bin:/home/foo/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
> >  /usr/bin/make -j9  DESTDIR=/home/foo/buildroot/output/target
> install/fast
> > -C /home/foo/buildroot/output/build/mytools-1.0/
> > make[2]: *** No rule to make target 'install/fast'.  Stop.
> > make[1]: *** [package/pkg-generic.mk:364:
> > /home/foo/buildroot/output/build/mytools-1.0/.stamp_target_installed]
> Error
> > 2
> > make: *** [Makefile:84: _all] Error 2
> >
> >
> > On Thu, Aug 6, 2020 at 11:08 PM Alexander Dahl <post@lespocky.de> wrote:
> >
> > > Hello Vijay,
> > >
> > > On Thu, Aug 06, 2020 at 07:44:53PM -0700, Vijay wrote:
> > > > I'm trying to add a simple, custom cmake based package to my
> buildroot
> > > > build. It's just a simple hello world program so that's not very
> > > > interesting. Here is my .mk file, which is the minimum version
> required I
> > > > believe.
> > > >
> > > > MYTOOLS_VERSION=1.0
> > > > MYTOOLS_SITE=$(HOME)/Work/mytools
> > > > MYTOOLS_SITE_METHOD=local
> > > >
> > > > $(eval $(cmake-package))
> > >
> > > Looks okay I guess?
> > >
> > > > When I configure this and kick off the build, Cmake seems to be
> having
> > > > trouble with the cross compiler. Below is the output: Is there any
> > > > additional configuration that I need to do?
> > > >
> > > > I'm using the latest 2020.05.01 version of buildroot.
> > > >
> > > > Any help is appreciated.
> > > >
> > > > Thanks,
> > > > Vijay
> > > >
> > > > >>> mytools 1.0 Configuring
> > > > (mkdir -p /home/foo/buildroot/output/build/mytools-1.0/ && cd
> > > > /home/foo/buildroot/output/build/mytools-1.0/ && rm -f
> CMakeCache.txt &&
> > > >
> > >
> PATH="/home/foo/buildroot/output/host/bin:/home/foo/buildroot/output/host/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
> > > >  /home/foo/buildroot/output/host/bin/cmake
> > > > /home/foo/buildroot/output/build/mytools-1.0/
> > > >
> > >
> -DCMAKE_TOOLCHAIN_FILE="/home/foo/buildroot/output/host/share/buildroot/toolchainfile.cmake"
> > > > -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_COLOR_MAKEFILE=OFF
> -DBUILD_DOC=OFF
> > > > -DBUILD_DOCS=OFF -DBUILD_EXAMPLE=OFF -DBUILD_EXAMPLES=OFF
> > > -DBUILD_TEST=OFF
> > > > -DBUILD_TESTS=OFF -DBUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON   )
> > > > -- The C compiler identification is GNU 8.4.0
> > > > -- The CXX compiler identification is unknown
> > >
> > > CMake does not find a C++ compiler.
> > >
> > > > -- Check for working C compiler:
> > > > /home/foo/buildroot/output/host/bin/x86_64-buildroot-linux-uclibc-gcc
> > > > -- Check for working C compiler:
> > > >
> /home/foo/buildroot/output/host/bin/x86_64-buildroot-linux-uclibc-gcc --
> > > > works
> > > > -- Detecting C compiler ABI info
> > > > -- Detecting C compiler ABI info - done
> > > > -- Detecting C compile features
> > > > -- Detecting C compile features - done
> > > > CMake Error at CMakeLists.txt:3 (project):
> > > >   The CMAKE_CXX_COMPILER:
> > > >
> > > >
>  /home/foo/buildroot/output/host/bin/x86_64-buildroot-linux-uclibc-g++
> > > >
> > > >   is not a full path to an existing compiler tool.
> > > >
> > > >   Tell CMake where to find the compiler by setting either the
> environment
> > > >   variable "CXX" or the CMake cache entry CMAKE_CXX_COMPILER to the
> full
> > > > path
> > > >   to the compiler, or to the compiler name if it is in the PATH.
> > >
> > > Again: there seems to bee no C++ compiler in your cross toolchain.
> > >
> > > I think you have two possibilities:
> > >
> > > If your hello world project is C only, tell CMake like this in your
> > > CMakeLists.txt file:
> > >
> > >   project(hello C)
> > >
> > > or
> > >
> > >   project(hello
> > >     LANGUAGES C
> > >   )
> > >
> > > (CMake assumes "C CXX" by default here.)
> > >
> > > Or if your hello world uses C++ tell buildroot you need C++ support in
> > > the toolchain:
> > >
> > > make menuconfig -> Toolchain -> Enable C++ support
> > >
> > > HTH & Greets
> > > Alex
> > >
> > > >
> > > >
> > > > -- Configuring incomplete, errors occurred!
> > > > See also
> > > >
> > >
> "/home/foo/buildroot/output/build/mytools-1.0/CMakeFiles/CMakeOutput.log".
> > > > See also
> > > >
> "/home/foo/buildroot/output/build/mytools-1.0/CMakeFiles/CMakeError.log".
> > > > make[1]: *** [package/pkg-generic.mk:259:
> > > > /home/foo/buildroot/output/build/mytools-1.0/.stamp_configured]
> Error 1
> > > > make: *** [Makefile:84: _all] Error 2
> > >
> > > > _______________________________________________
> > > > buildroot mailing list
> > > > buildroot at busybox.net
> > > > http://lists.busybox.net/mailman/listinfo/buildroot
> > >
> > >
> > > --
> > > /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> > > \ / CAMPAIGN     | speech censured, the first thought forbidden, the
> > >  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> > > / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
> > >
>
> --
> /"\ ASCII RIBBON | ?With the first link, the chain is forged. The first
> \ / CAMPAIGN     | speech censured, the first thought forbidden, the
>  X  AGAINST      | first freedom denied, chains us all irrevocably.?
> / \ HTML MAIL    | (Jean-Luc Picard, quoting Judge Aaron Satie)
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200808/13ab9df3/attachment.html>

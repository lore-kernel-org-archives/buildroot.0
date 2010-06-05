From: Chris Kerios <ckerios@gmail.com>
Date: Sat, 5 Jun 2010 07:10:09 -0400
Subject: [Buildroot] make xconfig on Fedora 13 and buildroot-2010.05
Message-ID: <AANLkTinF5cJ0T_ALpJN6uqlj9-E2fIjzLqYH0pcxWan0@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey guys,
        I just upgraded my laptop to Fedora 13 and ran into a problem with the
        make configurator.  I have all the QT3 and libstdc++ compatibility
        libraries installed.  Anyone else run into this yet?  Works fine on my
        Fedora 12 box.
        Regards,
        Chris


        [chris at corney buildroot-2010.05]$ make xconfig
        make CC="/usr/lib/ccache/gcc" -C package/config qconf
        make[1]: Entering directory
        `/home/chris/buildroot-2010.05/package/config'   CHECK   qt
        make[1]: Leaving directory
        `/home/chris/buildroot-2010.05/package/config'
        make[1]: Entering directory
        `/home/chris/buildroot-2010.05/package/config'
        /usr/lib/qt-3.3/bin/moc -i qconf.h -o qconf.moc
        sed < lkc_proto.h > lkc_defs.h 's/P(\([^,]*\),.*/#define \1 (\*\1_p)/'
        /usr/lib/ccache/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"
        -DLOCALE  -g -O2 -DQT_SHARED -DQT_TABLET_SUPPORT -DQT_NO_DEBUG
        -DQT_THREAD_SUPPORT -D_REENTRANT -I/usr/lib/qt-3.3/include   -D
        LKC_DIRECT_LINK -c qconf.cc -o qconf.o
        /usr/lib/ccache/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"
        -DLOCALE  -g -O2  -c conf.c -o conf.o
        /usr/lib/ccache/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"
        -DLOCALE  -g -O2  -c kconfig_load.c -o kconfig_load.o
        /usr/lib/ccache/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"
        -DLOCALE  -g -O2  -c kxgettext.c -o kxgettext.o
        /usr/lib/ccache/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"
        -DLOCALE  -g -O2 -I. -c zconf.tab.c -o zconf.tab.o
        /usr/lib/ccache/gcc -I/usr/include/ncurses -DCURSES_LOC="<ncurses.h>"
        -DLOCALE  -g -O2  kconfig_load.o zconf.tab.o qconf.o
        -L/usr/lib/qt-3.3/lib -lqt-mt -lmng -ljpeg -lpng -lz -lXi -lXrender
        -lXrandr -lXcursor -lXinerama -lXft -lfreetype -lfontconfig -lXext -lX11
        -lm -lSM -lICE -ldl -lpthread   -ldl -o qconf
        /usr/bin/ld: qconf.o: undefined reference to symbol
        '__cxa_guard_abort@@CXXABI_1.3'
        /usr/bin/ld: note: '__cxa_guard_abort@@CXXABI_1.3' is defined in
        DSO /usr/lib/libstdc++.so.6 so try adding it to the linker command line
        /usr/lib/libstdc++.so.6: could not read symbols: Invalid operation
        collect2: ld returned 1 exit status
        make[1]: *** [qconf] Error 1
        make[1]: Leaving directory
        `/home/chris/buildroot-2010.05/package/config'
        make: *** [package/config/qconf] Error 2

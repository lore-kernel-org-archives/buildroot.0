From: Michael J. Hammel <buildroot@graphics-muse.org>
Date: Mon, 25 Apr 2011 10:37:57 -0600
Subject: [Buildroot] tic compile stops
Message-ID: <1303749477.1283.5.camel@feynman.coloradoengineeringinc.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've got a 2010.11 build that I run under Fedora.  It works fine there.
I was asked to make sure it builds under CentOS.  I built a CentOS vm
(kvm) and ran the build.  For some reason it stops with ncurses tic
compile.  No errors, strace just shows it sitting there.  I can't tell
what the problem is.

I max'ed the memory and cpu's available to the VM but that had no
effect.

Here is the output where it hangs:

make[3]: Entering directory
`/home/mjhammel/src/cei/system_build/bld/buildroot-2010.11/output/build/ncurses-5.7/misc'
DESTDIR=/home/mjhammel/src/cei/system_build/src/../bld/buildroot-2010.11.bld/staging/ \
        prefix=/usr \
        exec_prefix=/usr \
        bindir=/usr/bin \
        top_srcdir=.. \
        srcdir=. \
        datadir=/usr/share \
        ticdir=/usr/share/terminfo \
        source=terminfo.tmp \
        THIS_CC="/opt/ceippc/bin/powerpc-440-linux-gnu-gcc
--sysroot=/home/mjhammel/src/cei/system_build/src/../bld/buildroot-2010.11.bld/staging/" \
        THAT_CC="gcc" \
        /bin/sh ./run_tic.sh
/usr/bin/install -c
ncurses-config /home/mjhammel/src/cei/system_build/src/../bld/buildroot-2010.11.bld/staging//usr/bin/ncurses5-config
** Building terminfo database, please wait...
Running tic to
install /home/mjhammel/src/cei/system_build/src/../bld/buildroot-2010.11.bld/staging//usr/share/terminfo ...

        You may see messages regarding extended capabilities, e.g., AX.
        These are extended terminal capabilities which are compiled
        using
                tic -x
        If you have ncurses 4.2 applications, you should read the
INSTALL
        document, and install the terminfo without the -x option.

Anyone have any tips on how to determine what tic is unhappy about?

-- 
Michael J. Hammel <buildroot@graphics-muse.org>

From: izak marais <izakmarais@yahoo.com>
Date: Mon, 12 Feb 2007 05:43:14 -0800 (PST)
Subject: [Buildroot] strange error during make
Message-ID: <585346.36396.qm@web50902.mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all

I'm trying to build a toolchain for my SH4-based board. It already has a version of uClinux installed, so I only want the compilation tool chain. I've  run make config, selecting 'No' for most of the non-toolchain related options (if you think this is causing me trouble, I can include the .config in a future post).

Eventually make exists with an error that I can't decipher (see below). There's a warning about makeinfo that doesn't make sense (I didn't alter any .texi of .texinfo files and reinstalled GNU make just to be on the safe side), but I don't know if it is the cause of the error. It appeards as if something has gone awry in the generated directory structure...

If anybody can help I would greatly appreciate it! Sorry if this is a newbie question; I did search the archives but found nothing similar.

Thanks
Izak

Here's the output:

izak at izak-desktop:~/buildroot$ make

Checking build system dependencies:
CC clean:                                       Ok
CXX clean:                                      Ok
CPP clean:                                      Ok
CFLAGS clean:                                   Ok
CXXFLAGS clean:                                 Ok
sed works:                                      Ok
which installed:                                Ok
GNU make version '3.81beta4':                   Ok
C compiler '/usr/bin/gcc'
C compiler version '4.0.3':                     Ok
bison installed:                                Ok
flex installed:                                 Ok
gettext installed:                              Ok
Build system dependencies:                      Ok

make -j1 -C /home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build all
make[1]: Entering directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build'
make[2]: Entering directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build'
make[3]: Entering directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/libiberty'
make[4]: Entering directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/libiberty/testsuite'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/libiberty/testsuite'
make[3]: Leaving directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/libiberty'
make[3]: Entering directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/intl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/intl'
make[3]: Entering directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd'
Making info in doc
make[4]: Entering directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd/doc'
restore=: && backupdir=".am$$" && \
        am__cwd=`pwd` && cd /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc && \
        rm -rf $backupdir && mkdir $backupdir && \
        for f in /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info-[0-9] /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info-[0-9][0-9] /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.i[0-9] /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.i[0-9][0-9]; do \
          if test -f $f; then mv $f $backupdir; restore=mv; else :; fi; \
        done; \
        cd "$am__cwd"; \
        if /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/missing makeinfo --split-sizeP00000 --split-sizeP00000   -I /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc \
         -o /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.texinfo; \
        then \
          rc=0; \
          cd /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc; \
        else \
          rc=$?; \
          cd /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc && \
          $restore $backupdir/* `echo ".//home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info" | sed 's|[^/]*$||'`; \
        fi; \
        rm -rf $backupdir; exit $rc
WARNING: `makeinfo' is missing on your system.  You should only need it if
         you modified a `.texi' or `.texinfo' file, or any other file
         indirectly affecting the aspect of the manual.  The spurious
         call might also be the consequence of using a buggy `make' (AIX,
         DU, IRIX).  You might want to install the `Texinfo' package or
         the `GNU make' package.  Grab either from any GNU archive site.
make[4]: *** [/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info] Error 1
make[4]: Leaving directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd/doc'
Making info in po
make[4]: Entering directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd/po'
make[4]: Nothing to be done for `info'.
make[4]: Leaving directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd/po'
make[4]: Entering directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd'
make[4]: Nothing to be done for `info-am'.
make[4]: Leaving directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd'
make[3]: *** [info-recursive] Error 1
make[3]: Leaving directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd'
make[2]: *** [all-bfd] Error 2
make[2]: Leaving directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build'
make[1]: *** [all] Error 2
make[1]: Leaving directory `/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build'
make: *** [/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/binutils/objdump] Error 2


 
---------------------------------
 Get your own web address.
 Have a HUGE year through Yahoo! Small Business.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070212/e777a3d3/attachment-0001.html 

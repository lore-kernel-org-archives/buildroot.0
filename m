From: Jonathan Dumaresq <jdumaresq@cimeq.qc.ca>
Date: Thu, 16 Aug 2007 15:07:32 -0400
Subject: [Buildroot] problem with the build process
References: <002b01c7df6d$5f065bb0$6e00a8c0@JONATHAN>
Message-ID: <001601c7e038$b2a4be80$6e00a8c0@JONATHAN>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok I found the problem.

The first time i do the make, the config file is updated with the path of makeinfo. But if makeinfo is not installed it is filled with something that is not very interesting. So I have try to do a make clean, no help, make distclean, not help. So i have delete the buildroot directory and restart the process and now it' seam to work.

I have installed the texinfo package. 

Jonathan
  ----- Original Message ----- 
  From: Jonathan Dumaresq 
  To: buildroot at uclibc.org 
  Sent: Wednesday, August 15, 2007 2:52 PM
  Subject: [Buildroot] problem with the build process


  hi all,

  I have a problem with the building process. I have snapped the info et put it here as reference. I don't know why this deosn't work. It have something bad with makeinfo.

  jonathan

  Checking build system dependencies:
  CC clean:     Ok
  CXX clean:     Ok
  CPP clean:     Ok
  CFLAGS clean:     Ok
  INCLUDES clean:     Ok
  CXXFLAGS clean:     Ok
  which installed:    Ok
  sed works:     Ok (/bin/sed)
  GNU make version '3.81':   Ok
  C compiler '/usr/bin/gcc'
  C compiler version '4.1.2':   Ok
  [: 227: 3: unexpected operator
  C++ compiler 'Usage: /usr/bin/which [-a] args'
  C++ compiler version './/toolchain/dependencies/dependencies.sh:':   Ok
  bison installed:    Ok
  flex installed:     Ok
  gettext installed:    Ok
  makeinfo installed:    Ok
  Build system dependencies:   Ok

  /usr/bin/make -j1 -C /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build all
  make[1]: Entering directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build'
  make[2]: Entering directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build'
  make[3]: Entering directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/libiberty'
  make[4]: Entering directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/libiberty/testsuite'
  make[4]: Nothing to be done for `all'.
  make[4]: Leaving directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/libiberty/testsuite'
  make[3]: Leaving directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/libiberty'
  make[3]: Entering directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/intl'
  make[3]: Nothing to be done for `all'.
  make[3]: Leaving directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/intl'
  make[3]: Entering directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/bfd'
  Making info in doc
  make[4]: Entering directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/bfd/doc'
  restore=: && backupdir=".am$$" && \
   am__cwd=`pwd` && cd /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc && \
   rm -rf $backupdir && mkdir $backupdir && \
   for f in /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc/bfd.info /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc/bfd.info-[0-9] /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc/bfd.info-[0-9][0-9] /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc/bfd.i[0-9] /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc/bfd.i[0-9][0-9]; do \
     if test -f $f; then mv $f $backupdir; restore=mv; else :; fi; \
   done; \
   cd "$am__cwd"; \
   if /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/missing makeinfo --split-size=5000000 --split-size=5000000   -I /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc \
    -o /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc/bfd.info /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc/bfd.texinfo; \
   then \
     rc=0; \
     cd /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc; \
   else \
     rc=$?; \
     cd /home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc && \
     $restore $backupdir/* `echo ".//home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc/bfd.info" | sed 's|[^/]*$||'`; \
   fi; \
   rm -rf $backupdir; exit $rc
  WARNING: `makeinfo' is missing on your system.  You should only need it if
           you modified a `.texi' or `.texinfo' file, or any other file
           indirectly affecting the aspect of the manual.  The spurious
           call might also be the consequence of using a buggy `make' (AIX,
           DU, IRIX).  You might want to install the `Texinfo' package or
           the `GNU make' package.  Grab either from any GNU archive site.
  make[4]: *** [/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17/bfd/doc/bfd.info] Error 1
  make[4]: Leaving directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/bfd/doc'
  Making info in po
  make[4]: Entering directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/bfd/po'
  make[4]: Nothing to be done for `info'.
  make[4]: Leaving directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/bfd/po'
  make[4]: Entering directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/bfd'
  make[4]: Nothing to be done for `info-am'.
  make[4]: Leaving directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/bfd'
  make[3]: *** [info-recursive] Error 1
  make[3]: Leaving directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/bfd'
  make[2]: *** [all-bfd] Error 2
  make[2]: Leaving directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build'
  make[1]: *** [all] Error 2
  make[1]: Leaving directory `/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build'
  make: *** [/home/dumarjo/buildroot/toolchain_build_arm/binutils-2.17-build/binutils/objdump] Error 2





------------------------------------------------------------------------------


  _______________________________________________
  buildroot mailing list
  buildroot at uclibc.org
  http://busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070816/4a1d7cee/attachment.htm 

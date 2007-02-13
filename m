From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 13 Feb 2007 03:17:43 -0800
Subject: [Buildroot] [buildroot 0001212]: build stops after makeinfo warning
Message-ID: <a42c268a95fc6e9a25fee80b8b3d79e7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1212 
====================================================================== 
Reported By:                izak
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1212
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             02-13-2007 00:09 PST
Last Modified:              02-13-2007 03:17 PST
====================================================================== 
Summary:                    build stops after makeinfo warning
Description: 
I'm not sure if the warning is causing the issue. The output of the run:

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

make -j1 -C /home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build
all
make[1]: Entering directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build'
make[2]: Entering directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build'
make[3]: Entering directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/libiberty'
make[4]: Entering directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/libiberty/testsuite'
make[4]: Nothing to be done for `all'.
make[4]: Leaving directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/libiberty/testsuite'
make[3]: Leaving directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/libiberty'
make[3]: Entering directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/intl'
make[3]: Nothing to be done for `all'.
make[3]: Leaving directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/intl'
make[3]: Entering directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd'
Making info in doc
make[4]: Entering directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd/doc'
restore=: && backupdir=".am$$" && \
        am__cwd=`pwd` && cd
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc && \
        rm -rf $backupdir && mkdir $backupdir && \
        for f in
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info-[0-9]
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info-[0-9][0-9]
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.i[0-9]
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.i[0-9][0-9];
do \
          if test -f $f; then mv $f $backupdir; restore=mv; else :; fi; \
        done; \
        cd "$am__cwd"; \
        if /home/izak/buildroot/toolchain_build_sh4/binutils-2.17/missing
makeinfo --split-size=5000000 --split-size=5000000   -I
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc \
         -o
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.texinfo;
\
        then \
          rc=0; \
          cd
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc; \
        else \
          rc=$?; \
          cd
/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc && \
          $restore $backupdir/* `echo
".//home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info"
| sed 's|[^/]*$||'`; \
        fi; \
        rm -rf $backupdir; exit $rc
WARNING: `makeinfo' is missing on your system.  You should only need it
if
         you modified a `.texi' or `.texinfo' file, or any other file
         indirectly affecting the aspect of the manual.  The spurious
         call might also be the consequence of using a buggy `make' (AIX,
         DU, IRIX).  You might want to install the `Texinfo' package or
         the `GNU make' package.  Grab either from any GNU archive site.
make[4]: ***
[/home/izak/buildroot/toolchain_build_sh4/binutils-2.17/bfd/doc/bfd.info]
Error 1
make[4]: Leaving directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd/doc'
Making info in po
make[4]: Entering directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd/po'
make[4]: Nothing to be done for `info'.
make[4]: Leaving directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd/po'
make[4]: Entering directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd'
make[4]: Nothing to be done for `info-am'.
make[4]: Leaving directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd'
make[3]: *** [info-recursive] Error 1
make[3]: Leaving directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/bfd'
make[2]: *** [all-bfd] Error 2
make[2]: Leaving directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build'
make[1]: *** [all] Error 2
make[1]: Leaving directory
`/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build'
make: ***
[/home/izak/buildroot/toolchain_build_sh4/binutils-2.17-build/binutils/objdump]
Error 2
izak at izak-desktop:~/buildroot$ less .config
izak at izak-desktop:~/buildroot$ gcc --version
gcc (GCC) 4.0.3 (Ubuntu 4.0.3-1ubuntu5)

====================================================================== 

---------------------------------------------------------------------- 
 izak - 02-13-07 03:17  
---------------------------------------------------------------------- 
Aslo texinfo is installed on my system and makeinfo is apparently not
available for ubuntu. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-13-07 00:09  izak           New Issue                                    
02-13-07 00:09  izak           Status                   new => assigned     
02-13-07 00:09  izak           Assigned To               => buildroot       
02-13-07 00:09  izak           File Added: .config                          
02-13-07 00:10  izak           Issue Monitored: izak                        
02-13-07 03:17  izak           Note Added: 0002155                          
======================================================================

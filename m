From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 20 Mar 2007 10:29:35 -0700
Subject: [Buildroot] [buildroot 0001212]: build stops after makeinfo warning
Message-ID: <6a84f7dcfd70bbb22db64eb62c7faab6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             02-13-2007 00:09 PST
Last Modified:              03-20-2007 10:29 PDT
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

---------------------------------------------------------------------- 
 smitty_one_each - 03-16-07 18:37  
---------------------------------------------------------------------- 
Concur for a Ubuntu system.
Looking at the Makefile in the bfd subdirectory of the binutils build, I
tried to explicitely set the path to makeinfo, with exactly the same
'texinfo not installed' error:

smitty at tiger:~/src/buildroot/toolchain_build_i686/binutils-2.17.50.0.10-build/bfd$
MAKEINFO=/usr/local/bin/makeinfo make 

---------------------------------------------------------------------- 
 smitty_one_each - 03-17-07 11:19  
---------------------------------------------------------------------- 
I think this is a configure-time problem.
After installing texinfo on my Ubuntu, I blew away the binutils-*-build
directory, did a make clean, and started again.
Having the binutils ./configure script run, with texinfo actually
installed, cured what ailed me. 

---------------------------------------------------------------------- 
 bernhardf - 03-20-07 10:29  
---------------------------------------------------------------------- 
fix binutils upstream.

Apart from that, we now have a check for an installed makeinfo for the
build-host which clearly states that you may have to install a working
makeinfo for your host.

thanks for the report 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
02-13-07 00:09  izak           New Issue                                    
02-13-07 00:09  izak           Status                   new => assigned     
02-13-07 00:09  izak           Assigned To               => buildroot       
02-13-07 00:09  izak           File Added: .config                          
02-13-07 00:10  izak           Issue Monitored: izak                        
02-13-07 03:17  izak           Note Added: 0002155                          
03-16-07 18:34  smitty_one_eachIssue Monitored: smitty_one_each                 
  
03-16-07 18:37  smitty_one_eachNote Added: 0002237                          
03-17-07 11:19  smitty_one_eachNote Added: 0002238                          
03-17-07 11:19  smitty_one_eachIssue End Monitor: smitty_one_each               
    
03-20-07 10:29  bernhardf      Status                   assigned => closed  
03-20-07 10:29  bernhardf      Note Added: 0002253                          
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:01 -0800
Subject: [Buildroot] [buildroot 0000490]: building c++ fails if largefile
	support disabled.
Message-ID: <08439be4abe606a80b18fe9afb411c29@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=490 
====================================================================== 
Reported By:                gnat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   490
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-17-2005 10:18 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    building c++ fails if largefile support disabled.
Description: 
Using buildroot, (for gcc 3.4.2, 3.4.3, 3.4.4, 4.0.4) With
i386/i586/i686.and/or Via C3/Cyrix and generic i386 processors. Each time
failing because of a missing template 'ftello64'. When I enable largefile
support the error message goes away.


I will post the actual error message once the current build completes.
====================================================================== 

---------------------------------------------------------------------- 
 gnat - 10-17-05 11:02  
---------------------------------------------------------------------- 
/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/gcc/xgcc
-shared-libgcc
-B/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/gcc/
-nostdinc++
-L/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3/src
-L/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3/src/.libs
-B/mnt/Projects/buildroot/nolargefile_build_i386/staging_dir/i386-linux-uclibc/bin/
-B/mnt/Projects/buildroot/nolargefile_build_i386/staging_dir/i386-linux-uclibc/lib/
-isystem
/mnt/Projects/buildroot/nolargefile_build_i386/staging_dir/i386-linux-uclibc/include
-isystem
/mnt/Projects/buildroot/nolargefile_build_i386/staging_dir/i386-linux-uclibc/sys-include
-I/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3/include/i386-linux-uclibc
-I/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3/include
-I/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3/libstdc++-v3/libsupc++
-g -Os -g -Os -fno-implicit-templates -Wall -W -Wwrite-strings -Wcast-qual
-fdiagnostics-show-location=once -ffunction-sections -fdata-sections -c
/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3/libstdc++-v3/src/globals_io.cc
 -fPIC -DPIC -o .libs/globals_io.o
In file included from
/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3/libstdc++-v3/src/globals_io.cc:34:
/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3/include/ext/stdio_sync_filebuf.h:
In member function `virtual std::streampos
__gnu_cxx::stdio_sync_filebuf<_CharT, _Traits>::seekoff(std::streamoff,
std::_Ios_Seekdir, std::_Ios_Openmode)':
/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3/include/ext/stdio_sync_filebuf.h:170:
error: there are no arguments to `fseeko64' that depend on a template
parameter, so a declaration of `fseeko64' must be available
/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3/include/ext/stdio_sync_filebuf.h:170:
error: (if you use `-fpermissive', G++ will accept your code, but allowing
the use of an undeclared name is deprecated)
/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3/include/ext/stdio_sync_filebuf.h:171:
error: there are no arguments to `ftello64' that depend on a template
parameter, so a declaration of `ftello64' must be available
make[4]: *** [globals_io.lo] Error 1
make[4]: Leaving directory
`/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3/src'
make[3]: *** [all-recursive] Error 1
make[3]: Leaving directory
`/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/i386-linux-uclibc/libstdc++-v3'
make[1]: *** [all-target-libstdc++-v3] Error 2
make[1]: Leaving directory
`/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final'
make: ***
[/mnt/Projects/buildroot/nolargefile_toolchain_build_i386/gcc-3.4.3-final/.compiled]
Error 2 

---------------------------------------------------------------------- 
 gnat - 10-17-05 11:30  
---------------------------------------------------------------------- 
I even added $(DISABLE_LARGEFILE) to the toochain/gcc/gcc-3.x..mk file at
all configure stages and still get the error below. enabling largefile
support allows it to complete the build properly. 

---------------------------------------------------------------------- 
 vapier - 10-17-05 15:12  
---------------------------------------------------------------------- 
dupe of http://busybox.net/bugs/view.php?id=51 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-17-05 10:18  gnat           New Issue                                    
10-17-05 10:18  gnat           Status                   new => assigned     
10-17-05 10:18  gnat           Assigned To               => uClibc          
10-17-05 11:02  gnat           Note Added: 0000628                          
10-17-05 11:30  gnat           Note Added: 0000629                          
10-17-05 15:12  vapier         Note Added: 0000632                          
10-17-05 15:12  vapier         Status                   assigned => closed  
10-17-05 15:12  vapier         Resolution               open => duplicate   
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================

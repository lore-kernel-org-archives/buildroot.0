From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:39 -0800
Subject: [Buildroot] [buildroot 0001107]: Gcc make failed
Message-ID: <6d35607f957bf1dc3ced3c8a860e3a23@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1107 
====================================================================== 
Reported By:                AndyI
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1107
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-30-2006 05:21 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Gcc make failed
Description: 
CYGWIN_NT-5.1 andrey 1.5.22(0.156/4/2) 2006-11-13 17:01 i686 Cygwin

mkdir -p /buildroot/toolchain_build_mips/gcc-3.4.2-initial
(cd /buildroot/toolchain_build_mips/gcc-3.4.2-initial;
PATH=/opt/toolchains/uclibc/bin:/buildroot/toolchain_build_mips/bin:/usr/local/bin:/usr/bin:/bin:/usr/X11R6/bin:/cygdrive/c/Program
Files/Far:/usr/bin:/cygdrive/c/WINDOWS/system32:/cygdrive/c/WINDOWS:/cygdrive/c/WINDOWS/System32/Wbem:/cygdrive/c/fpd26:/cygdrive/c/Program
Files/Support Tools/ \
		CC="gcc" \
		/buildroot/toolchain_build_mips/gcc-3.4.2/configure \
		--prefix=/opt/toolchains/uclibc \
		--build=i386-pc-cygwin \
		--host=i386-pc-cygwin \
		--target=mips-linux-uclibc \
		--enable-languages=c \
		--with-sysroot=/buildroot/toolchain_build_mips/uClibc_dev/ \
		--disable-__cxa_atexit \
		--enable-target-optspace \
		--with-gnu-ld \
		--disable-shared \
		--disable-nls \
		--enable-threads \
		--disable-multilib \
		 \
		   \
		);
/bin/sh:
Files/Far:/usr/bin:/cygdrive/c/WINDOWS/system32:/cygdrive/c/WINDOWS:/cygdrive/c/WINDOWS/System32/Wbem:/cygdrive/c/fpd26:/cygdrive/c/Program:
No such file or directory
make: *** [/buildroot/toolchain_build_mips/gcc-3.4.2-initial/.configured]
Error 127

====================================================================== 

---------------------------------------------------------------------- 
 AndyI - 11-30-06 06:26  
---------------------------------------------------------------------- 
gcc-uclibc-3.x.mk line 120
(cd $(GCC_BUILD_DIR1); PATH=$(TARGET_PATH) \
gcc-uclibc-3.x.mk line 142
PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) all-gcc
gcc-uclibc-3.x.mk line 146
PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR1) install-gcc
gcc-uclibc-3.x.mk line 176
(cd $(GCC_BUILD_DIR2); PATH='$(TARGET_PATH)' \
gcc-uclibc-3.x.mk line 198
PATH=$(TARGET_PATH) $(MAKE) -C $(GCC_BUILD_DIR2) all

PATH='$(TARGET_PATH)' ?

 

---------------------------------------------------------------------- 
 bernhardf - 12-01-06 09:54  
---------------------------------------------------------------------- 
AFAIK windows is not supported. Either you provide patches to fix the
problem while not breaking unix or i'll close this report.

Thanks for your understanding.
cheers, 

---------------------------------------------------------------------- 
 AndyI - 12-01-06 12:16  
---------------------------------------------------------------------- 
Here a patch. 

---------------------------------------------------------------------- 
 bernhardf - 12-08-06 04:46  
---------------------------------------------------------------------- 
Fixed in r16813. Thanks for the report. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-30-06 05:21  AndyI          New Issue                                    
11-30-06 05:21  AndyI          Status                   new => assigned     
11-30-06 05:21  AndyI          Assigned To               => uClibc          
11-30-06 05:22  AndyI          Issue Monitored: AndyI                       
11-30-06 05:30  AndyI          Issue End Monitor: AndyI                     
11-30-06 05:36  AndyI          Note Added: 0001844                          
11-30-06 05:40  AndyI          Note Edited: 0001844                         
11-30-06 05:51  AndyI          Note Edited: 0001844                         
11-30-06 06:19  AndyI          Note Edited: 0001844                         
11-30-06 06:26  AndyI          Note Edited: 0001844                         
12-01-06 09:54  bernhardf      Note Added: 0001845                          
12-01-06 10:07  bernhardf      Status                   assigned => feedback
12-01-06 12:15  AndyI          File Added: cygwin_path.patch                    
12-01-06 12:16  AndyI          Note Added: 0001852                          
12-08-06 04:46  bernhardf      Status                   feedback => closed  
12-08-06 04:46  bernhardf      Note Added: 0001858                          
12-08-06 04:46  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================

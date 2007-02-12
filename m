From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:31 -0800
Subject: [Buildroot] [buildroot 0001127]: Cramfs make failed
Message-ID: <57c5809ddc6423158f57b6bf30899865@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1127 
====================================================================== 
Reported By:                AndyI
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1127
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-22-2006 04:12 PST
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    Cramfs make failed
Description: 
CYGWIN_NT-5.1 andrey 1.5.23(0.156/4/2) 2006-12-19 10:52 i686 Cygwin

make -j1 CFLAGS="-Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFF
SET_BITS=64" -C /opt/buildroot/build_mips/cramfs-1.1;
make[1]: Entering directory `/opt/buildroot/build_mips/cramfs-1.1'
gcc -Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -
I.   mkcramfs.c  -lz -o mkcramfs
mkcramfs.c: In function `parse_directory':
mkcramfs.c:390: warning: passing arg 4 of `scandir' from incompatible
pointer ty
pe
gcc -Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
-D_FILE_OFFSET_BITS=64 -
I.   cramfsck.c  -lz -o cramfsck
cramfsck.c: In function `test_super':
cramfsck.c:152: warning: implicit declaration of function `_IO'
/cygdrive/d/TEMP/ccIA2xOB.o:cramfsck.c:(.text+0x17f7): undefined reference
to `_
_IO'
collect2: ld returned 1 exit status
make[1]: *** [cramfsck] Error 1
make[1]: Leaving directory `/opt/buildroot/build_mips/cramfs-1.1'
make: *** [/opt/buildroot/build_mips/cramfs-1.1/mkcramfs] Error 2
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 12-22-06 04:22  
---------------------------------------------------------------------- 
Fixed in r17049. Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-22-06 04:12  AndyI          New Issue                                    
12-22-06 04:12  AndyI          Status                   new => assigned     
12-22-06 04:12  AndyI          Assigned To               => uClibc          
12-22-06 04:12  AndyI          File Added: cramfs-03-cygwin.patch               
    
12-22-06 04:22  bernhardf      Status                   assigned => closed  
12-22-06 04:22  bernhardf      Note Added: 0001913                          
12-22-06 04:22  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:43:08 -0800
Subject: [Buildroot] [buildroot 0000970]: microcom 1.02 compile errors
Message-ID: <dc63974289b8cbd002258d8659888de6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=970 
====================================================================== 
Reported By:                bowerymarc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   970
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-25-2006 06:52 PDT
Last Modified:              02-12-2007 05:43 PST
====================================================================== 
Summary:                    microcom 1.02 compile errors
Description: 
wget --passive-ftp -P /home/tools/buildroot/dl
http://microcom.port5.com//m102.tar.gz
--09:36:44--  http://microcom.port5.com//m102.tar.gz
           => `/home/tools/buildroot/dl/m102.tar.gz'
Resolving microcom.port5.com... 212.15.85.21
Connecting to microcom.port5.com|212.15.85.21|:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 21,777 (21K) [application/x-tar]

100%[========================================================>] 21,777    
   28.51K/s

09:36:45 (28.48 KB/s) - `/home/tools/buildroot/dl/m102.tar.gz' saved
[21777/21777]

mkdir -p /home/tools/buildroot/build_arm_nofpu/microcom-1.02
zcat /home/tools/buildroot/dl/m102.tar.gz | tar -C
/home/tools/buildroot/build_arm_nofpu/microcom-1.02   -xf -
touch /home/tools/buildroot/build_arm_nofpu/microcom-1.02/.unpacked
/home/tools/buildroot/toolchain_build_arm_nofpu/bin/sed -i -e
's~gcc~/home/tools/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc~'
/home/tools/buildroot/build_arm_nofpu/microcom-1.02/Makefile
touch /home/tools/buildroot/build_arm_nofpu/microcom-1.02/.configured
make -j1 -C /home/tools/buildroot/build_arm_nofpu/microcom-1.02
make[1]: Entering directory
`/home/tools/buildroot/build_arm_nofpu/microcom-1.02'
/home/tools/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc
-O -c microcom.c
microcom.c:28: warning: built-in function 'log' declared as non-function
/home/tools/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc
-O -c mux.c
mux.c:27: warning: built-in function 'log' declared as non-function
/home/tools/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc
-O -c script.c
/home/tools/buildroot/build_arm_nofpu/staging_dir/bin/arm-linux-uclibc-gcc
-O -c help.c
help.c:26: warning: built-in function 'log' declared as non-function
help.c: In function `help_set_speed':
help.c:277: error: `B230400' undeclared (first use in this function)
help.c:277: error: (Each undeclared identifier is reported only once
help.c:277: error: for each function it appears in.)
help.c:279: error: `B460800' undeclared (first use in this function)
make[1]: *** [help.o] Error 1
make[1]: Leaving directory
`/home/tools/buildroot/build_arm_nofpu/microcom-1.02'
make: *** [/home/tools/buildroot/build_arm_nofpu/microcom-1.02/microcom]
Error 2

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 01-19-07 11:15  
---------------------------------------------------------------------- 
Fixed in r17386 but i only compiled it and did not try if it works.
Please file a bug if it's broken.

thanks, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-25-06 06:52  bowerymarc     New Issue                                    
07-25-06 06:52  bowerymarc     Status                   new => assigned     
07-25-06 06:52  bowerymarc     Assigned To               => uClibc          
01-19-07 11:15  bernhardf      Status                   assigned => closed  
01-19-07 11:15  bernhardf      Note Added: 0002007                          
01-19-07 11:15  bernhardf      Resolution               open => fixed       
02-12-07 05:43  vapier         Status                   closed => assigned  
02-12-07 05:43  vapier         Assigned To              uClibc => buildroot 
======================================================================

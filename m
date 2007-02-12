From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:54 -0800
Subject: [Buildroot] [buildroot 0000492]: Compile of gcc3.4.4 libgcc fails
	for armeb with no FPU
Message-ID: <f8311e6265ccd39b55f12fab6fc4337d@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=492 
====================================================================== 
Reported By:                thraxisp
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   492
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-19-2005 12:40 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    Compile of gcc3.4.4 libgcc fails for armeb with no
FPU
Description: 
The second phase of the gcc compile fails when configuring libstc++.

checking for float.h... (cached) yes
checking for stdint.h... (cached) yes
checking for main in -lm... configure: error: Link tests are not allowed
after GCC_NO_EXECUTABLES.
make[1]: *** [configure-target-libstdc++-v3] Error 1

gcc 3.4.3 works.
====================================================================== 

---------------------------------------------------------------------- 
 thraxisp - 11-23-05 11:49  
---------------------------------------------------------------------- 
Here are the details from the config.log file.

configure:2368: 
/home/freewater/ghenshaw/buildroot/toolchain_build_armeb_nofpu/gcc-3.4.4-final/gcc/xgcc
-B/home/freewater/ghenshaw/buildroot/toolchain_build_armeb_nofpu/gcc-3.4.4-final/gcc/
-B/home/freewater/ghenshaw/buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibc/bin/
-B/home/freewater/ghenshaw/buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibc/lib/
-isystem
/home/freewater/ghenshaw/buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibc/include
-isystem
/home/freewater/ghenshaw/buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibc/sys-include
-V </dev/null >&5
xgcc: `-V' must come at the start of the command line
configure:2371: $? = 1
configure:2390: 
/home/freewater/ghenshaw/buildroot/toolchain_build_armeb_nofpu/gcc-3.4.4-final/gcc/xgcc
-B/home/freewater/ghenshaw/buildroot/toolchain_build_armeb_nofpu/gcc-3.4.4-final/gcc/
-B/home/freewater/ghenshaw/buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibc/bin/
-B/home/freewater/ghenshaw/buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibc/lib/
-isystem
/home/freewater/ghenshaw/buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibc/include
-isystem
/home/freewater/ghenshaw/buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibc/sys-include
-o conftest -g -Os -g -Os  conftest.c  >&5
/home/freewater/ghenshaw/buildroot/build_armeb_nofpu/staging_dir/armeb-linux-uclibc/bin/ld:
cannot find -lfloat
collect2: ld returned 1 exit status
configure:2393: $? = 1
configure:2559: checking for suffix of object files
configure:2605: result: o 

---------------------------------------------------------------------- 
 thraxisp - 12-07-05 12:58  
---------------------------------------------------------------------- 
This also occurs with 3.4.5.

It appears that the patch "arm-softfloat.patch.conditional" is missing and
causes this error. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-19-05 12:40  thraxisp       New Issue                                    
10-19-05 12:40  thraxisp       Status                   new => assigned     
10-19-05 12:40  thraxisp       Assigned To               => uClibc          
11-23-05 11:49  thraxisp       Note Added: 0000688                          
12-07-05 12:58  thraxisp       Note Added: 0000730                          
01-23-06 08:11  prpplague      Status                   assigned => resolved
01-23-06 08:11  prpplague      Resolution               open => fixed       
01-23-06 08:11  prpplague      Additional Information Updated                   

03-08-06 16:56  vapier         Status                   resolved => closed  
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================

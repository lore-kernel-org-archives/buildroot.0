From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:33:54 -0800
Subject: [Buildroot] [buildroot 0000781]: Errors with precompiled headers
	during the compilation of libstdc++
Message-ID: <3847f52a2c869a83132b60fe96396957@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=781 
====================================================================== 
Reported By:                blurgk
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   781
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-09-2006 01:35 PST
Last Modified:              02-12-2007 05:33 PST
====================================================================== 
Summary:                    Errors with precompiled headers during the
compilation of libstdc++
Description: 
Gcc segfaults during the compilation of precompiled headers for
libstdc++-v3.

Here are the error messages:

/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/gcc/xgcc
-shared-libgcc
-B/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/gcc/
-nostdinc++
-L/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/src
-L/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/src/.libs
-B/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/bin/
-B/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/lib/
-isystem
/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/include
-isystem
/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/sys-include
-Winvalid-pch -Wno-deprecated -x c++-header -g -Os
-I/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/include/arm-linux-uclibc
-I/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/include
-I/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5/libstdc++-v3/libsupc++
/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5/libstdc++-v3/include/stdc++.h
-O0 -g -o ./arm-linux-uclibc/bits/stdc++.h.gch/O0g; \
/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/gcc/xgcc
-shared-libgcc
-B/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/gcc/
-nostdinc++
-L/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/src
-L/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/src/.libs
-B/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/bin/
-B/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/lib/
-isystem
/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/include
-isystem
/usr/src/buildroot/build_arm_nofpu/staging_dir/arm-linux-uclibc/sys-include
-Winvalid-pch -Wno-deprecated -x c++-header -g -Os
-I/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/include/arm-linux-uclibc
-I/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/include
-I/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5/libstdc++-v3/libsupc++
/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5/libstdc++-v3/include/stdc++.h
-O2 -g -o ./arm-linux-uclibc/bits/stdc++.h.gch/O2g;
/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5/libstdc++-v3/include/stdc++.h:82:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5/libstdc++-v3/include/stdc++.h:82:
internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://gcc.gnu.org/bugs.html> for instructions.
make[2]: *** [arm-linux-uclibc/bits/stdc++.h] Error 1
make[2]: Leaving directory


This results in the following error later:


mkdir -p --
/usr/src/buildroot/build_arm_nofpu/staging_dir/include/c++/3.4.5/./arm-linux-uclibc/bits/stdc++.h.gch
for file in ./arm-linux-uclibc/bits/stdc++.h.gch/*; do \
  /bin/install -c -m 644 $file
/usr/src/buildroot/build_arm_nofpu/staging_dir/include/c++/3.4.5/./arm-linux-uclibc/bits/stdc++.h.gch;
done
/bin/install: cannot stat `./arm-linux-uclibc/bits/stdc++.h.gch/*': No
such file or directory
make[4]: *** [install-pch] Error 1
make[4]: Leaving directory
`/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/include'
make[3]: *** [install-am] Error 2
make[3]: Leaving directory
`/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3/include'
make[2]: *** [install-recursive] Error 1
make[2]: Leaving directory
`/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/arm-linux-uclibc/libstdc++-v3'
make[1]: *** [install-target-libstdc++-v3] Error 2
make[1]: Leaving directory
`/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final'
make: ***
[/usr/src/buildroot/toolchain_build_arm_nofpu/gcc-3.4.5-final/.installed]
Error 2

Attached is my buildroot configuration file. Is it possible to disable the
use of precompiled headers?
====================================================================== 

---------------------------------------------------------------------- 
 blurgk - 03-09-06 01:53  
---------------------------------------------------------------------- 
Sorry, this is a buildroot bug...

The build of precompiled headers is disablable through the use of the
following configure flag: --disable-libstdcxx-pch 

---------------------------------------------------------------------- 
 bernhardf - 12-28-06 01:07  
---------------------------------------------------------------------- 
Works for me with the fixes i just installed (revision 17099) for gcc-4.2
on i386. Please try 4.2 and report back. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-09-06 01:35  blurgk         New Issue                                    
03-09-06 01:35  blurgk         Status                   new => assigned     
03-09-06 01:35  blurgk         Assigned To               => uClibc          
03-09-06 01:35  blurgk         File Added: .config                          
03-09-06 01:53  blurgk         Note Added: 0001179                          
12-28-06 01:07  bernhardf      Note Added: 0001943                          
12-28-06 01:07  bernhardf      Status                   assigned => feedback
02-12-07 05:33  vapier         Status                   feedback => assigned
02-12-07 05:33  vapier         Assigned To              uClibc => buildroot 
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:48:18 -0800
Subject: [Buildroot] [buildroot 0000491]: uClibc builds to fail with
	softfloat arm
Message-ID: <015ac5b63e93af5bd752eb91a1c8a156@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=491 
====================================================================== 
Reported By:                thraxisp
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   491
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-19-2005 12:19 PDT
Last Modified:              02-12-2007 05:48 PST
====================================================================== 
Summary:                    uClibc builds to fail with softfloat arm
Description: 
Compile of library using buildroot fails when shared libraries are enabled.
The messaces look like:

 
/home/freewater/ghenshaw/Desktop/buildroot/build_armeb_nofpu/staging_dir/bin/armeb-linux-uclibc-ld
-EB -shared --warn-common --warn-once -z combreloc -z defs -s 
-soname=libc.so.0 \
         -o ../lib/libuClibc-0.9.28.so --whole-archive shared_libc.a \
        --no-whole-archive ../libc/misc/internals/interp.o \
         -init __uClibc_init ../lib/ld-uClibc.so.0 
/home/freewater/ghenshaw/Desktop/buildroot/build_armeb_nofpu/staging_dir/lib/gcc/armeb-linux-uclibc/3.4.4/libgcc.a
 shared_libc.a(difftime.o): In function `difftime':
 time.c:(.text+0x8): undefined reference to `__floatsidf'
 time.c:(.text+0x2c): undefined reference to `__subdf3'


 using gcc 3.4.4, latest uClibc and buildroot snapshots
====================================================================== 

---------------------------------------------------------------------- 
 prpplague - 02-13-06 07:51  
---------------------------------------------------------------------- 
this is fixed in the uClibc svn as of 20051230 snapshot. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-19-05 12:19  thraxisp       New Issue                                    
10-19-05 12:19  thraxisp       Status                   new => assigned     
10-19-05 12:19  thraxisp       Assigned To               => uClibc          
01-05-06 19:05  vapier         Summary                  Failure to create shared
libuClibc-0.9.28.so due to missing files => uClibc builds to fail with softfloat
arm
01-05-06 19:05  vapier         Project                  uClibc => buildroot 
02-13-06 07:51  prpplague      Note Added: 0001087                          
02-13-06 07:51  prpplague      Status                   assigned => resolved
02-13-06 07:51  prpplague      Resolution               open => fixed       
02-13-06 07:51  prpplague      version                  0.9.28 =>           
03-08-06 16:52  vapier         Status                   resolved => closed  
01-09-07 05:39  stephaneC      Issue Monitored: stephaneC                    
01-09-07 05:40  stephaneC      Issue End Monitor: stephaneC                    
01-09-07 05:40  stephaneC      Issue Monitored: stephaneC                    
02-12-07 05:48  vapier         Status                   closed => assigned  
02-12-07 05:48  vapier         Assigned To              uClibc => buildroot 
======================================================================

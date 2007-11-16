From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 16 Nov 2007 02:53:16 -0800
Subject: [Buildroot] [buildroot 0001588]: undefined reference to fmsub when
	using ppc405 + soft-float + c++
Message-ID: <16ac636d67967e7c3cbe108708fcb884@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1588 
====================================================================== 
Reported By:                glikely
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1588
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   crash
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-12-2007 20:36 PST
Last Modified:              11-16-2007 02:53 PST
====================================================================== 
Summary:                    undefined reference to fmsub when using ppc405 +
soft-float + c++
Description: 
C++ seems to be brpken on ppc405 toolchains using softfloat and uClibc. 
Issue seen on current buildroot top-of-tree.

I see the error on the iperf configure script.  Here's the relevant error
message:

configure:1936: checking for C++ compiler default output file name
configure:1939:
/home/grant/hacking/buildroot/build_powerpc/staging_dir/usr/bin/powerpc-linux-uclibc-g++
-Os -pipe 
-I/home/grant/hacking/buildroot/build_powerpc/staging_dir/usr/include
-I/home/grant/hacking/buildroot/build_powerpc/staging_dir/include
--sysroot=/home/grant/hacking/buildroot/build_powerpc/staging_dir/
-isysroot /home/grant/hacking/buildroot/build_powerpc/staging_dir
-mtune=405 -msoft-float    conftest.cc  >&5
/home/grant/hacking/buildroot/build_powerpc/staging_dir/usr/bin-ccache/../lib/gcc/powerpc-linux-uclibc/4.2.1/../../../../powerpc-linux-uclibc/lib/libgcc_s.so:
undefined reference to `fmsub'
collect2: ld returned 1 exit status
configure:1942: $? = 1
configure: failed program was:
| /* confdefs.h.  */
|
| #define PACKAGE_NAME "Iperf"
| #define PACKAGE_TARNAME "iperf"
| #define PACKAGE_VERSION "2.0.2"
| #define PACKAGE_STRING "Iperf 2.0.2"
| #define PACKAGE_BUGREPORT ""
| #define PACKAGE "iperf"
| #define VERSION "2.0.2"
| /* end confdefs.h.  */
|
| int
| main ()
| {
|
|   ;
|   return 0;
| }
configure:1981: error: C++ compiler cannot create executables
See `config.log' for more details.

I've attached my .config file
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 11-16-07 02:53  
---------------------------------------------------------------------- 
Do you have a fix for it? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-12-07 20:36  glikely        New Issue                                    
11-12-07 20:36  glikely        Status                   new => assigned     
11-12-07 20:36  glikely        Assigned To               => buildroot       
11-12-07 20:36  glikely        File Added: .config                          
11-16-07 02:53  vanokuten      Note Added: 0002933                          
======================================================================

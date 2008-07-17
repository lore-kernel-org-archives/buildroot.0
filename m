From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 17 Jul 2008 03:40:20 -0700
Subject: [Buildroot] [buildroot 0001479]: enabling coreutils in revision
	19733 results in fatal build errors
Message-ID: <f0bf6f35e0ebfcbf18c7f38b452551c9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1479 
====================================================================== 
Reported By:                spditner
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1479
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 fixed
Fixed in Version:           
====================================================================== 
Date Submitted:             08-29-2007 12:05 PDT
Last Modified:              07-17-2008 03:40 PDT
====================================================================== 
Summary:                    enabling coreutils in revision 19733 results in
fatal build errors
Description: 
with BR2_PACKAGE_COREUTILS=y,
make fails with the following:

In file included from mbchar.h:157,
                 from mbchar.c:22:
./wchar.h:41:12: error: empty filename in #include
In file included from mbchar.c:22:
mbchar.h:242: error: expected ')' before 'wc'
make[3]: *** [mbchar.o] Error 1
make[3]: Leaving directory
`/home/simon/buildroot/build_i386/coreutils-6.9/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/simon/buildroot/build_i386/coreutils-6.9/lib'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/simon/buildroot/build_i386/coreutils-6.9'
make: *** [/home/simon/buildroot/build_i386/coreutils-6.9/src/vdir] Error
2


Ubuntu 7.04, kernel 2.6.20-16-generic, gcc version 4.1.2 (Ubuntu
4.1.2-0ubuntu4)

====================================================================== 

---------------------------------------------------------------------- 
 hwstar - 10-02-07 18:19  
---------------------------------------------------------------------- 
I'm having the same exact problem. Here's the output from the failed
build:

/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/staging_dir/usr/bin/i586-linux-uclibc-gcc
-Os -pipe 
-I/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/staging_dir/usr/include
-I/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/staging_dir/include
--sysroot=/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/staging_dir/
-isysroot
/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/staging_dir
-mtune=i586 -march=i586  -I.      -g -O2 -c mbchar.c
In file included from mbchar.h:157,
                 from mbchar.c:22:
./wchar.h:41:12: error: empty filename in #include
In file included from mbchar.c:22:
mbchar.h:242: error: expected ')' before 'wc'
make[3]: *** [mbchar.o] Error 1
make[3]: Leaving directory
`/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/coreutils-6.9/lib'
make[2]: *** [all] Error 2
make[2]: Leaving directory
`/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/coreutils-6.9/lib'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory
`/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/coreutils-6.9'
make: ***
[/home/srodgers/projects/limey-linux/limey-linux-test/buildroot/build_i586/coreutils-6.9/src/vdir]
Error 2

Target: i586, Host OS: Ubuntu 7.04, Host CC: GCC 4.1.2 (Ubuntu
4.1.2-0ubuntu4)

 

---------------------------------------------------------------------- 
 hwstar - 10-15-07 20:17  
---------------------------------------------------------------------- 
Enabling WCHAR support in menuconfig resolves this issue. However,
selecting the "development system" in menuconfig should automatically
enable WCHAR support as the development system build findutils and
coreutils 

---------------------------------------------------------------------- 
 UlfSamuelsson - 10-16-07 22:56  
---------------------------------------------------------------------- 
Coreutils, requires toolchain to be built with WCHAR support 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-29-07 12:05  spditner       New Issue                                    
08-29-07 12:05  spditner       Status                   new => assigned     
08-29-07 12:05  spditner       Assigned To               => buildroot       
10-02-07 18:13  hwstar         Note Added: 0002808                          
10-02-07 18:19  hwstar         Note Edited: 0002808                         
10-13-07 16:59  hwstar         Issue Monitored: hwstar                      
10-15-07 20:17  hwstar         Note Added: 0002825                          
10-16-07 06:04  tim            Issue Monitored: tim                         
10-16-07 22:56  UlfSamuelsson  Status                   assigned => resolved
10-16-07 22:56  UlfSamuelsson  Resolution               open => fixed       
10-16-07 22:56  UlfSamuelsson  Note Added: 0002828                          
07-16-08 08:02  bernhardf      Status                   resolved => new     
07-17-08 03:40  bernhardf      Status                   new => closed       
======================================================================

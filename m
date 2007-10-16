From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 15 Oct 2007 20:17:56 -0700
Subject: [Buildroot] [buildroot 0001479]: enabling coreutils in revision
	19733 results in fatal build errors
Message-ID: <27bd05fac6ecfb8740b9e2aa9297574a@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             08-29-2007 12:05 PDT
Last Modified:              10-15-2007 20:17 PDT
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
======================================================================

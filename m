From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 3 Sep 2008 21:27:35 -0700
Subject: [Buildroot] [buildroot 0002724]: freetype-2.3.5 configure fails
Message-ID: <4a3c532043c71c129dd7051626aaf533@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2724 
====================================================================== 
Reported By:                seek
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2724
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-02-2008 06:54 PDT
Last Modified:              09-03-2008 21:27 PDT
====================================================================== 
Summary:                    freetype-2.3.5 configure fails
Description: 
Building of freetype-2.3.5 stops with this error:

checking for x86_64-pc-linux-gnu-gcc... x86_64-pc-linux-gnu
checking for x86_64-pc-linux-gnu-gcc... (cached) x86_64-pc-linux-gnu
checking for x86_64-pc-linux-gnu-gcc... (cached) x86_64-pc-linux-gnu
checking for suffix of native executables... ./configure: line 3392:
x86_64-pc-linux-gnu: command not found
configure: error: native C compiler is not working
make[1]: *** [setup] Fehler 1

freetype-2.2.1 works as expected.



====================================================================== 

---------------------------------------------------------------------- 
 antialize - 08-17-08 01:54  
---------------------------------------------------------------------- 
The bug is still there:

cd builds/unix; ./configure  "--target=i686-linux" "--host=i686-linux"
"--build=x86_64-pc-linux-gnu" "--prefix=/usr" "--exec-prefix=/usr"
"--bindir=/usr/bin" "--sbindir=/usr/sbin" "--libdir=/usr/lib"
"--libexecdir=/usr/lib" "--sysconfdir=/etc" "--datadir=/usr/share"
"--localstatedir=/var" "--includedir=/usr/include" "--mandir=/usr/man"
"--infodir=/usr/info" " "
configure: WARNING: you should use --build, --host, --target
configure: WARNING: invalid host type:
...
checking for suffix of native executables... ./configure: line 3392:
x86_64-pc-linux-gnu: command not found
configure: error: native C compiler is not working

 

---------------------------------------------------------------------- 
 antialize - 08-07-08 11:47  
---------------------------------------------------------------------- 
The bug is on line 43 in build/configure.raw
It saies
AC_CHECK_PROG(CC_BUILD, ${build}-gcc, ${build-gcc})
It should be
AC_CHECK_PROG(CC_BUILD, ${build}-gcc, ${build}-gcc)

It seems this bug has already been fixed upstream, can we get a vertion
bump? 

---------------------------------------------------------------------- 
 hmoffatt - 09-03-08 21:27  
---------------------------------------------------------------------- 
Can you modify your package/freetype/Config.in to change 2.3.5 to 2.3.7,
run "make menuconfig" and save, then try a build and tell us if it works? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-02-08 06:54  seek           New Issue                                    
04-02-08 06:54  seek           Status                   new => assigned     
04-02-08 06:54  seek           Assigned To               => buildroot       
08-07-08 09:43  antialize      Note Added: 0010314                          
08-07-08 09:45  antialize      Note Edited: 0010314                         
08-07-08 10:25  antialize      Issue Monitored: antialize                    
08-07-08 11:47  antialize      Note Added: 0010324                          
08-17-08 01:54  antialize      Note Edited: 0010314                         
09-03-08 21:27  hmoffatt       Note Added: 0010984                          
======================================================================

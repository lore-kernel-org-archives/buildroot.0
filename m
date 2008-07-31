From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 31 Jul 2008 10:24:30 -0700
Subject: [Buildroot] [buildroot 0004404]: PHP 5.2.6 fails with SQLite
	compatibility, missing -ldl
Message-ID: <213778656e736190161968143ef7dcc2@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=4404 
====================================================================== 
Reported By:                kreuters
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   4404
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             07-31-2008 10:24 PDT
Last Modified:              07-31-2008 10:24 PDT
====================================================================== 
Summary:                    PHP 5.2.6 fails with SQLite compatibility, missing
-ldl
Description: 
selecting to include php with default settings fails with the following
error messages:

ext/pdo_sqlite/sqlite/src/os_unix.o: In function `sqlite3UnixDlclose':
/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/php-5.2.6/ext/pdo_sqlite/sqlite/src/os_unix.c:2627:
undefined reference to `dlclose'
ext/pdo_sqlite/sqlite/src/os_unix.o: In function `sqlite3UnixDlsym':
/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/php-5.2.6/ext/pdo_sqlite/sqlite/src/os_unix.c:2624:
undefined reference to `dlsym'
ext/pdo_sqlite/sqlite/src/os_unix.o: In function `sqlite3UnixDlopen':
/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/php-5.2.6/ext/pdo_sqlite/sqlite/src/os_unix.c:2621:
undefined reference to `dlopen'
collect2: ld returned 1 exit status
make[1]: *** [sapi/cgi/php-cgi] Error 1
make[1]: Leaving directory
`/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/php-5.2.6'
make: ***
[/home/dikkie/Documents/dns323/uclibc/buildroot/build_arm/php-5.2.6/.built]
Error 2

the build_arm/php/Makefile needs -ldl added to EXTRA_LIBS= , works fine
after that

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
07-31-08 10:24  kreuters       New Issue                                    
07-31-08 10:24  kreuters       Status                   new => assigned     
07-31-08 10:24  kreuters       Assigned To               => buildroot       
07-31-08 10:24  kreuters       File Added: config                           
======================================================================

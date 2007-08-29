From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 29 Aug 2007 12:05:11 -0700
Subject: [Buildroot] [buildroot 0001479]: enabling coreutils in revision
	19733 results in fatal build errors
Message-ID: <792faa3b3687832d449658d8c6f2b045@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Last Modified:              08-29-2007 12:05 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-29-07 12:05  spditner       New Issue                                    
08-29-07 12:05  spditner       Status                   new => assigned     
08-29-07 12:05  spditner       Assigned To               => buildroot       
======================================================================

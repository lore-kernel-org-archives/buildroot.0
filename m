From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:51:12 -0800
Subject: [Buildroot] [buildroot 0000176]: buildroot - libraries libpng
	incorrectly linked
Message-ID: <08e8254f7237e822b4864217c19ef9f6@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=176 
====================================================================== 
Reported By:                gnat
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   176
Category:                   Shared Library Support
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-20-2005 17:11 PST
Last Modified:              02-12-2007 05:51 PST
====================================================================== 
Summary:                    buildroot - libraries libpng incorrectly linked
Description: 
running ldd usr/lib/* shows that many libaries are linked to the host
machine. The packages so far that I've noticed with this problem so far
are libpng, openssl, libcrypto,libbz2 as well as other programs &
libraries whose packagename.mk I patterned after libpng and a couple
others.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 03-20-05 18:21  
---------------------------------------------------------------------- 
they all look fine to me:
$ readelf -d build_armeb/root/usr/lib/libpng.so.3.1.2.8 | grep NEEDED
 0x00000001 (NEEDED)                     Shared library: [libgcc_s.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

do you have CC or CXX set in the host env ? 

---------------------------------------------------------------------- 
 vapier - 03-20-05 19:28  
---------------------------------------------------------------------- 
dont use the ldd provided by glibc 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-20-05 17:11  gnat           New Issue                                    
03-20-05 18:21  vapier         Note Added: 0000105                          
03-20-05 19:28  vapier         Status                   assigned => resolved
03-20-05 19:28  vapier         Resolution               open => not fixable 
03-20-05 19:28  vapier         Note Added: 0000113                          
03-20-05 19:28  vapier         Status                   resolved => closed  
02-12-07 05:51  vapier         Status                   closed => assigned  
02-12-07 05:51  vapier         Assigned To              uClibc => buildroot 
======================================================================

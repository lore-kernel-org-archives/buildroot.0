From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 7 Jul 2007 12:01:45 -0700
Subject: [Buildroot] [buildroot 0001290]: linux header & libc header files
	should go in /usr/include
Message-ID: <82ec0873215847d0d17b471b619c0def@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1290 
====================================================================== 
Reported By:                Franck78
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1290
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             03-25-2007 17:25 PDT
Last Modified:              07-07-2007 12:01 PDT
====================================================================== 
Summary:                    linux header & libc header files should go in
/usr/include
Description: 
Hello,
Inside the toolchain (fakeroot.0000), the header files (linux&uclibc) are
not in the correct subdir.
They reside in "/include" but should reside in "/usr/include"

It is annoying because the toolchain tools (gcc,cpp,..) look in "/include"
and package build with classic options (just a simple configure
--prefix=/usr) put them in what is correct for most of them,
"/usr/include".

I'm not absolute certain on the correct standart but what is sure, is that
there is no "/include" dir on my linuxes (ubuntu, mandrake, suse).


Franck
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 07-07-07 12:01  
---------------------------------------------------------------------- 
This is now being fixed in svn. Quite some packages still try to wrongly
install to staging_dir/ directly, please send patches (one per package) to
the list.

thanks, 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-25-07 17:25  Franck78       New Issue                                    
03-25-07 17:25  Franck78       Status                   new => assigned     
03-25-07 17:25  Franck78       Assigned To               => buildroot       
03-25-07 18:19  Franck78       Issue Monitored: Franck78                    
07-07-07 12:01  bernhardf      Status                   assigned => closed  
07-07-07 12:01  bernhardf      Note Added: 0002562                          
======================================================================

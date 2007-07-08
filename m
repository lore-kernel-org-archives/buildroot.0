From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 8 Jul 2007 04:07:01 -0700
Subject: [Buildroot] [buildroot 0001363]: make clean does not rm
	.compiled/.built
Message-ID: <92c5e7808d2548775c4f52961e9b463b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1363 
====================================================================== 
Reported By:                bobwired
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1363
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             05-21-2007 12:52 PDT
Last Modified:              07-08-2007 04:07 PDT
====================================================================== 
Summary:                    make clean does not rm .compiled/.built
Description: 
The pciutils.mk file does not remove the .compiled flag when the pciutls is
cleaned. Thereafter, the buildroot make will fail, until the .compiled file
is removed. Removing the .compiled file in the clean target fixes this.

Patch file attached.
====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 07-08-07 04:07  
---------------------------------------------------------------------- 
Yes, i know. This is a generic problem, unfortunately.. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
05-21-07 12:52  bobwired       New Issue                                    
05-21-07 12:52  bobwired       Status                   new => assigned     
05-21-07 12:52  bobwired       Assigned To               => buildroot       
05-21-07 12:52  bobwired       File Added: mypatch                          
07-08-07 04:06  bernhardf      Summary                  buildroot pciutils
pciutils.mk  doesn't clean the .compiled flag => make clean does not rm
.compiled/.built
07-08-07 04:07  bernhardf      Note Added: 0002566                          
======================================================================

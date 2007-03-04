From: bugs at busybox.net <bugs@busybox.net>
Date: Sun, 4 Mar 2007 05:38:15 -0800
Subject: [Buildroot] [buildroot 0001257]: Some build targets use hard-coded
	library names, which causes forced rebuild on Mac OS X
Message-ID: <c6aea0d61b36c91c06060bd7e3c891e4@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1257 
====================================================================== 
Reported By:                holin
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1257
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-04-2007 05:38 PST
Last Modified:              03-04-2007 05:38 PST
====================================================================== 
Summary:                    Some build targets use hard-coded library names,
which causes forced rebuild on Mac OS X
Description: 
Library names ending with .so should have .dylib in makefile targets on OS
X. Otherwise, the build system always thinks that the library isn't built
and tries to (re-)build it on every make invocation. Attached a patch that
adds a config option for library filename extension and fixes the packages
that seemed to suffer from this. 
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-04-07 05:38  holin          New Issue                                    
03-04-07 05:38  holin          Status                   new => assigned     
03-04-07 05:38  holin          Assigned To               => buildroot       
03-04-07 05:38  holin          File Added: buildroot-070304-dlext.patch         
          
======================================================================

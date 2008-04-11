From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 11 Apr 2008 00:59:29 -0700
Subject: [Buildroot] [buildroot 0002524]: kernel symlinks broken
Message-ID: <b44b392157a82c44d537d57be00440fb@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2524 
====================================================================== 
Reported By:                KHAksnes
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2524
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-12-2008 02:03 PDT
Last Modified:              04-11-2008 00:59 PDT
====================================================================== 
Summary:                    kernel symlinks broken
Description: 
This bug is present in current trunk versions of buildroot. 
I am at revision 21311 in subversion.

I am building a fairly plain i686 system.  The kernel builds nicely after
applying my workaround for bug 0002504, but it doesn't install well under
binaries. A symlink is installed pointing to a nonexisting file. This
symlink also breaks previous naming conventions as it doesn't add the .bz
suffix for a bzImage kernel.

At least 3 things are wrong.
1) The binaries directory should contain physical copies not symlinks.
2) The right kernel file must be copied to the binaries/$PROJECTNAME
3) Changing naming strategy shouldn't be done unless strictly necessary,
some of us have installation scripts that stops working 
====================================================================== 

---------------------------------------------------------------------- 
 KHAksnes - 04-11-08 00:59  
---------------------------------------------------------------------- 
This bug seems to be fixed now. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-12-08 02:03  KHAksnes       New Issue                                    
03-12-08 02:03  KHAksnes       Status                   new => assigned     
03-12-08 02:03  KHAksnes       Assigned To               => buildroot       
03-12-08 02:03  KHAksnes       File Added: FW.config                        
04-11-08 00:59  KHAksnes       Note Added: 0006564                          
======================================================================

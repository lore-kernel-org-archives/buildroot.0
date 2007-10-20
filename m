From: bugs at busybox.net <bugs@busybox.net>
Date: Sat, 20 Oct 2007 11:15:15 -0700
Subject: [Buildroot] [buildroot 0001543]: gcc 4.1.2 libmudflap fails to
	build due to missing execinfo.h
Message-ID: <1eb31c9871ea48b988c625e9dd2a9257@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
====================================================================== 
http://busybox.net/bugs/view.php?id=1543 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1543
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             10-19-2007 01:21 PDT
Last Modified:              10-20-2007 11:15 PDT
====================================================================== 
Summary:                    gcc 4.1.2 libmudflap fails to build due to missing
execinfo.h
Description: 
During the gcc-4.1.2-final build, libmudflap files to compile due to
missing execinfo.h. configure detects that execinfo.h exists but is
unusable, but that's because it used the wrong cpp and found the host
version instead.

The fix is to pass CPP=<target_cpp>, as in the attached patch.
====================================================================== 

---------------------------------------------------------------------- 
 vanokuten - 10-20-07 11:15  
---------------------------------------------------------------------- 
fixed in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-19-07 01:21  hmoffatt       New Issue                                    
10-19-07 01:21  hmoffatt       Status                   new => assigned     
10-19-07 01:21  hmoffatt       Assigned To               => buildroot       
10-19-07 01:21  hmoffatt       File Added: br-gcc412-cpp-fix                    
10-20-07 11:15  vanokuten      Status                   assigned => closed  
10-20-07 11:15  vanokuten      Note Added: 0002850                          
======================================================================

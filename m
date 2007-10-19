From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 19 Oct 2007 01:21:20 -0700
Subject: [Buildroot] [buildroot 0001543]: gcc 4.1.2 libmudflap fails to
	build due to missing execinfo.h
Message-ID: <e73b1f587b0c993034a1396b7e2cc5d3@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
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
Status:                     assigned
====================================================================== 
Date Submitted:             10-19-2007 01:21 PDT
Last Modified:              10-19-2007 01:21 PDT
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

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-19-07 01:21  hmoffatt       New Issue                                    
10-19-07 01:21  hmoffatt       Status                   new => assigned     
10-19-07 01:21  hmoffatt       Assigned To               => buildroot       
10-19-07 01:21  hmoffatt       File Added: br-gcc412-cpp-fix                    
======================================================================

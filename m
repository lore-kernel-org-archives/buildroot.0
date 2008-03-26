From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 25 Mar 2008 20:45:11 -0700
Subject: [Buildroot] [buildroot 0002674]: patch-kernel.sh failes on newer
	versions of Ubuntu
Message-ID: <5bb6a2fd210abaa08061822182ced615@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=2674 
====================================================================== 
Reported By:                antab
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   2674
Category:                   Standards Compliance
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             03-25-2008 08:20 PDT
Last Modified:              03-25-2008 20:45 PDT
====================================================================== 
Summary:                    patch-kernel.sh failes on newer versions of Ubuntu
Description: 
The patch-kernel.sh script fails on newer versions of Ubuntu (and debian)
where the /bin/sh link has been changed form /bin/bash to /bin/dash. The
script will fail at line 23:
for i in `cd ${patchdir}; ls -d ${patchpattern} 2> /dev/null` ; do

where dash dosen't expand the ${patchpattern} but passes it directly to
ls. Quick fix is to relink /bin/sh to bash, but scripts that depend on
bash only features should NOT use /bin/sh but /bin/bash directly.

more about the difference between dash and bash at:
https://wiki.ubuntu.com/DashAsBinSh.
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 03-25-08 20:45  
---------------------------------------------------------------------- 
Can't reproduce this on Debian (changed top of script to #!/bin/dash
instead). Which package?

Mind you there doesn't seem to be any need to use ${x} throughout the
script rather than $x. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
03-25-08 08:20  antab          New Issue                                    
03-25-08 08:20  antab          Status                   new => assigned     
03-25-08 08:20  antab          Assigned To               => buildroot       
03-25-08 20:45  hmoffatt       Note Added: 0005944                          
======================================================================

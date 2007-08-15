From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 15 Aug 2007 01:54:16 -0700
Subject: [Buildroot] [buildroot 0001465]: installing dropbear does not check
	for etc/init.d/ directory
Message-ID: <8c07353ff4499c66456fe525254d4bce@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1465 
====================================================================== 
Reported By:                vogelchr
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1465
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-15-2007 01:54 PDT
Last Modified:              08-15-2007 01:54 PDT
====================================================================== 
Summary:                    installing dropbear does not check for etc/init.d/
directory
Description: 
When installing dropbear the install makefile just copies the init-script
to etc/init.d without making sure that etc/init.d is a existing
directory:

cp -dpf /home/chris/buildroot/build_i586/dropbear-0.50/S50dropbear
/home/chris/buildroot/project_build_i586//root/etc/init.d/
cp: target `/home/chris/buildroot/project_build_i586//root/etc/init.d/' is
not a directory: No such file or directory
make: ***
[/home/chris/buildroot/project_build_i586//root/usr/sbin/dropbear] Error
1

The proposed fix makes the install go through...

====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-15-07 01:54  vogelchr       New Issue                                    
08-15-07 01:54  vogelchr       Status                   new => assigned     
08-15-07 01:54  vogelchr       Assigned To               => buildroot       
======================================================================

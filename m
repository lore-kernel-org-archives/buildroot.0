From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 19 Sep 2007 07:11:59 -0700
Subject: [Buildroot] [buildroot 0001465]: installing dropbear does not check
	for etc/init.d/ directory
Message-ID: <4af2c096449a69d7ea4c35a459884782@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been CLOSED 
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
Status:                     closed
Resolution:                 open
Fixed in Version:           
====================================================================== 
Date Submitted:             08-15-2007 01:54 PDT
Last Modified:              09-19-2007 07:11 PDT
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

---------------------------------------------------------------------- 
 bernhardf - 09-19-07 07:11  
---------------------------------------------------------------------- 
Fixed in r19892.
Thanks! 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-15-07 01:54  vogelchr       New Issue                                    
08-15-07 01:54  vogelchr       Status                   new => assigned     
08-15-07 01:54  vogelchr       Assigned To               => buildroot       
09-19-07 07:11  bernhardf      Status                   assigned => closed  
09-19-07 07:11  bernhardf      Note Added: 0002757                          
======================================================================

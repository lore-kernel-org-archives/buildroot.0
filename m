From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 31 Oct 2007 22:52:33 -0700
Subject: [Buildroot] [buildroot 0001568]: "make BOARD=xyz menuconfig" /
	oldconfig etc does not work
Message-ID: <7e2c6439e3f37477e47880a753fc585b@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1568 
====================================================================== 
Reported By:                hmoffatt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1568
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             10-31-2007 22:52 PDT
Last Modified:              10-31-2007 22:52 PDT
====================================================================== 
Summary:                    "make BOARD=xyz menuconfig" / oldconfig etc does not
work
Description: 
buildroot allows you to do "make BOARD=xyz world" to compile using the
configuration file in local/xyz/xyz.config, but you can't call menuconfig,
oldconfig etc in this way.

The problem is that the name of the configuration file isn't being passed
to the kconfig tool (package/config/conf). kconfig uses $BUILDROOT_CONFIG,
so all that is needed is to set that environment variable.

Patch attached fixes this so that "make BOARD=xyz oldconfig" works.
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-31-07 22:52  hmoffatt       New Issue                                    
10-31-07 22:52  hmoffatt       Status                   new => assigned     
10-31-07 22:52  hmoffatt       Assigned To               => buildroot       
10-31-07 22:52  hmoffatt       File Added: br-board-config.diff                 
  
======================================================================

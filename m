From: bugs at busybox.net <bugs@busybox.net>
Date: Thu, 1 Nov 2007 18:02:14 -0700
Subject: [Buildroot] [buildroot 0001568]: "make BOARD=xyz menuconfig" /
	oldconfig etc does not work
Message-ID: <cd085d6318919d32ce0e59a47934afa1@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
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
Last Modified:              11-01-2007 18:02 PDT
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

---------------------------------------------------------------------- 
 hmoffatt - 11-01-07 18:02  
---------------------------------------------------------------------- 
"make BOARD=xyz world" also fails due to a few more hard-coded references
to .config. br2-board-config2.diff fixes those. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
10-31-07 22:52  hmoffatt       New Issue                                    
10-31-07 22:52  hmoffatt       Status                   new => assigned     
10-31-07 22:52  hmoffatt       Assigned To               => buildroot       
10-31-07 22:52  hmoffatt       File Added: br-board-config.diff                 
  
11-01-07 18:01  hmoffatt       File Added: br-board-config2.diff                
   
11-01-07 18:02  hmoffatt       Note Added: 0002885                          
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:45:36 -0800
Subject: [Buildroot] [buildroot 0000303]: Sym links in skel.tar.gz
Message-ID: <07a4968b83767b9fb1c92dab3b1a843c@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=303 
====================================================================== 
Reported By:                lmt
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   303
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   tweak
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             06-20-2005 12:25 PDT
Last Modified:              02-12-2007 05:45 PST
====================================================================== 
Summary:                    Sym links in skel.tar.gz
Description: 
Suggestion:

Change all of the following symbolic links:

From:                               To:

./dev/log -> /tmp/log           -> ../tmp/log
./etc/mtab -> /proc/mounts      -> ../proc/mounts
./var/lib/pcmcia -> /tmp        -> ../../tmp
./var/lock -> /tmp              -> ../tmp 
./var/log -> /tmp               -> ../tmp
./var/pcmcia -> /tmp            -> ../tmp 
./var/run -> /tmp               -> ../tmp
./var/spool -> /tmp             -> ../tmp
./var/tmp -> /tmp               -> ../tmp

This way, when the target file system is staged in a workspace, a
recursive search in that workspace will not follow the links to the host
/tmp or /proc directory.

====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-14-06 12:11  
---------------------------------------------------------------------- 
good point.  fixed 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
06-20-05 12:25  lmt            New Issue                                    
04-14-06 12:11  andersen       Note Added: 0001296                          
04-14-06 12:11  andersen       Status                   assigned => closed  
04-14-06 12:11  andersen       Resolution               open => fixed       
02-12-07 05:45  vapier         Status                   closed => assigned  
02-12-07 05:45  vapier         Assigned To              uClibc => buildroot 
======================================================================

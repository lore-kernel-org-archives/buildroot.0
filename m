From: bugs at busybox.net <bugs@busybox.net>
Date: Fri, 7 Nov 2008 01:31:06 -0800
Subject: [Buildroot] [buildroot 0006004]: [PATCH] kdrive/tinyx: mouse
	protocolo initialization
Message-ID: <99089c84fd62fbd594403ba41f6723f5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been SUBMITTED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=6004 
====================================================================== 
Reported By:                robang74
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   6004
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-07-2008 01:31 PST
Last Modified:              11-07-2008 01:31 PST
====================================================================== 
Summary:                    [PATCH] kdrive/tinyx: mouse protocolo initialization
Description: 
This patch fix the mouse protocol initialization which actually cause the
kdrive to switch mouse protocol (init of tty flag did not happen
correctly) some times without any necessity. This patch add the -mouse
mouse,,protocol= option too in order to test/use a specified mouse
protocol. Thanks for applying.

NOTA BENE: without this patch kdrive mouse, in many system, seem crazy at
the startup and NO ANY solution based on psmouse.proto=bare [1] or similar
like psmouse.resetafter=8 could fix the problem without this patch. This
patch usually solve the problem itself too (apart 1 second of initial
inertia of the mouse pointer).

[1] http://kerneltrap.org/node/2199
====================================================================== 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-07-08 01:31  robang74       New Issue                                    
11-07-08 01:31  robang74       Status                   new => assigned     
11-07-08 01:31  robang74       Assigned To               => buildroot       
11-07-08 01:31  robang74       File Added:
xserver_xorg-server-1.4-mouse-protocol.patch                    
======================================================================

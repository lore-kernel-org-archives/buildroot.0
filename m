From: bugs at busybox.net <bugs@busybox.net>
Date: Tue, 25 Mar 2008 20:55:31 -0700
Subject: [Buildroot] [buildroot 0001613]: mtd-utils external toolchain fix;
	lzo dependency fix
Message-ID: <4a1ba633ba8252df029382f77ba5752e@bugs.uclibc.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


A NOTE has been added to this issue. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1613 
====================================================================== 
Reported By:                ikonst
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1613
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             11-27-2007 06:19 PST
Last Modified:              03-25-2008 20:55 PDT
====================================================================== 
Summary:                    mtd-utils external toolchain fix; lzo dependency fix
Description: 
mtd-utils has a few problems:
1. $(TARGET_LDFLAGS) missing from make command, which makes it impossible
to build in an external toolchain configuration.
2. lzo is missing from the dependency chain, while mtd-utils use lzo.

The attached patch fixes the problems.
====================================================================== 

---------------------------------------------------------------------- 
 hmoffatt - 03-25-08 20:55  
---------------------------------------------------------------------- 
I'm using mtd-utils with an external toolchain and I don't seem to need
$(TARGET_LDFLAGS). Which arch are you using? 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 06:19  ikonst         New Issue                                    
11-27-07 06:19  ikonst         Status                   new => assigned     
11-27-07 06:19  ikonst         Assigned To               => buildroot       
11-27-07 06:19  ikonst         File Added: mtd-utils.patch                    
03-25-08 20:55  hmoffatt       Note Added: 0005964                          
======================================================================

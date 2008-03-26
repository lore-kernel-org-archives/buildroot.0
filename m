From: bugs at busybox.net <bugs@busybox.net>
Date: Wed, 26 Mar 2008 02:39:38 -0700
Subject: [Buildroot] [buildroot 0001613]: mtd-utils external toolchain fix;
	lzo dependency fix
Message-ID: <6faf5b94e19d9a60defe127f8b014569@busybox.net>
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
Last Modified:              03-26-2008 02:39 PDT
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

---------------------------------------------------------------------- 
 ikonst - 03-26-08 02:39  
---------------------------------------------------------------------- 
I'm using the arm arch.
I'm not developing in this project anymore, so I don't even have an
environment to test it. Just note that we pass $(TARGET_CFLAGS) to the
$(MAKE) in the original code, so also passing $(TARGET_LDFLAGS) seems to
be logical (and it's not only logical - it also allowed the package to be
built in my external toolchain configuration). 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
11-27-07 06:19  ikonst         New Issue                                    
11-27-07 06:19  ikonst         Status                   new => assigned     
11-27-07 06:19  ikonst         Assigned To               => buildroot       
11-27-07 06:19  ikonst         File Added: mtd-utils.patch                    
03-25-08 20:55  hmoffatt       Note Added: 0005964                          
03-26-08 02:39  ikonst         Note Added: 0005984                          
======================================================================

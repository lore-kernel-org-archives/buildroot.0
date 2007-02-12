From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:44:48 -0800
Subject: [Buildroot] [buildroot 0001042]: package/Makefile.in sets wrong
	TARGET_PATH
Message-ID: <8b6d264dac516ee09f94feb31694ce1a@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=1042 
====================================================================== 
Reported By:                belandor
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   1042
Category:                   Other
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             09-21-2006 06:23 PDT
Last Modified:              02-12-2007 05:44 PST
====================================================================== 
Summary:                    package/Makefile.in sets wrong TARGET_PATH
Description: 
in buildroot svn revision {2006-09-21}, package/Makefile.in sets 

TARGET_PATH=$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:/bin:/sbin:/usr/bin:/usr/sbin:$(PATH)

This makes it impossible to use a gcc which is not installed in the system
to compile uClibc (e.g. if /usr/bin/gcc does not support ada, it is not
possible to provide an ada capable gcc in the path and install)

This should be changed into
TARGET_PATH=$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(PATH)

If /bin:/sbin:/usr/bin:/usr/sbin are not in PATH, then this has probably
good reasons and buildroot should not attempt to include them in the
TARGET_PATH. - Otherwise they should come _AFTER_ the inclusion of PATH.

====================================================================== 

---------------------------------------------------------------------- 
 bernhardf - 09-30-06 14:09  
---------------------------------------------------------------------- 
Sounds reasonable. Done. 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
09-21-06 06:23  belandor       New Issue                                    
09-21-06 06:23  belandor       Status                   new => assigned     
09-21-06 06:23  belandor       Assigned To               => uClibc          
09-30-06 14:09  bernhardf      Status                   assigned => closed  
09-30-06 14:09  bernhardf      Note Added: 0001673                          
09-30-06 14:09  bernhardf      Resolution               open => fixed       
02-12-07 05:44  vapier         Status                   closed => assigned  
02-12-07 05:44  vapier         Assigned To              uClibc => buildroot 
======================================================================

From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:49:43 -0800
Subject: [Buildroot] [buildroot 0000598]: [patch] Host CPP used rather than
	toolchain CPP
Message-ID: <40035ab1a0235bab4e03b915558f2542@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=598 
====================================================================== 
Reported By:                crafterm
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   598
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             12-12-2005 03:02 PST
Last Modified:              02-12-2007 05:49 PST
====================================================================== 
Summary:                    [patch] Host CPP used rather than toolchain CPP
Description: 
Hi All,

Hope all is going well.

buildroot/packages/Makefile.in defines $(TARGET_CONFIGURE_OPTS) to be:

TARGET_CONFIGURE_OPTS=PATH=$(TARGET_PATH) \
                AR=$(TARGET_CROSS)ar \
                AS=$(TARGET_CROSS)as \
                LD=$(TARGET_CROSS)ld \
                NM=$(TARGET_CROSS)nm \
                CC=$(TARGET_CROSS)gcc \
                GCC=$(TARGET_CROSS)gcc \
                CXX=$(TARGET_CROSS)g++ \
                RANLIB=$(TARGET_CROSS)ranlib \
                OBJCOPY=$(TARGET_CROSS)objcopy

but doesn't set CPP. This results in the host CPP be used rather than the
toolchain version and various configure scripts break when this happens,
thinking that a certain header exists in the staging filesystem when they
don't (eg. strace, coreutils, and others).

The attached patch fixes this.

Cheers,

Marcus
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 12-16-05 17:34  
---------------------------------------------------------------------- 
that doesnt really make much sense ... configure scripts default CPP to
doing `$(CC) -E` which we override

fixed in svn anyways as it shouldnt break anything 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
12-12-05 03:02  crafterm       New Issue                                    
12-12-05 03:02  crafterm       Status                   new => assigned     
12-12-05 03:02  crafterm       Assigned To               => uClibc          
12-12-05 03:02  crafterm       File Added: cpp.diff                         
12-16-05 17:34  vapier         Note Added: 0000792                          
12-16-05 17:34  vapier         Status                   assigned => closed  
12-16-05 17:34  vapier         Resolution               open => fixed       
02-12-07 05:49  vapier         Status                   closed => assigned  
02-12-07 05:49  vapier         Assigned To              uClibc => buildroot 
======================================================================

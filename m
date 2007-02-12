From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:50:29 -0800
Subject: [Buildroot] [buildroot 0000380]: uClibc no longer uses a parameter
	that buildroot configures for threads
Message-ID: <4fed4809c5219617dc5f72bd646f9113@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=380 
====================================================================== 
Reported By:                allanc
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   380
Category:                   Architecture Specific
Reproducibility:            always
Severity:                   minor
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             08-12-2005 00:47 PDT
Last Modified:              02-12-2007 05:50 PST
====================================================================== 
Summary:                    uClibc no longer uses a parameter that buildroot
configures for threads
Description: 
uClibc does this:

ifeq ($(BR2_PTHREADS_NATIVE),y)
        $(SED) 's,# PTHREADS_NATIVE is not set,PTHREADS_NATIVE=y,g'
$(UCLIBC_DIR)/.config
endif

...but PTHREADS_NATIVE doesn't seem to be in the .config anymore.  Patch
adds setting UCLIBC_HAS_THREADS instead, one-liner.
====================================================================== 

---------------------------------------------------------------------- 
 vapier - 08-28-05 01:00  
---------------------------------------------------------------------- 
thanks, fixed in svn 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
08-12-05 00:47  allanc         New Issue                                    
08-12-05 00:47  allanc         Status                   new => assigned     
08-12-05 00:47  allanc         Assigned To               => uClibc          
08-12-05 00:47  allanc         File Added: uclibc-thread.patch                  
 
08-13-05 11:03  swth           Issue Monitored: swth                        
08-28-05 01:00  vapier         Note Added: 0000450                          
08-28-05 01:00  vapier         Status                   assigned => closed  
08-28-05 01:00  vapier         Resolution               open => fixed       
02-12-07 05:50  vapier         Status                   closed => assigned  
02-12-07 05:50  vapier         Assigned To              uClibc => buildroot 
======================================================================

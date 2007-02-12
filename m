From: bugs at busybox.net <bugs@busybox.net>
Date: Mon, 12 Feb 2007 05:46:02 -0800
Subject: [Buildroot] [buildroot 0000824]: svn 14777 broke
	cramfs/squashfs/tarroot ($IMAGE is the absolute path)
Message-ID: <90f9492ffd46d706a1c7dafdb0368cfe@bugs.busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


The following issue has been ASSIGNED. 
====================================================================== 
http://busybox.net/bugs/view.php?id=824 
====================================================================== 
Reported By:                jacmet
Assigned To:                buildroot
====================================================================== 
Project:                    buildroot
Issue ID:                   824
Category:                   Other
Reproducibility:            always
Severity:                   major
Priority:                   normal
Status:                     assigned
====================================================================== 
Date Submitted:             04-10-2006 07:57 PDT
Last Modified:              02-12-2007 05:46 PST
====================================================================== 
Summary:                    svn 14777 broke cramfs/squashfs/tarroot ($IMAGE is
the absolute path)
Description: 
svn 14777 seems to have broken cramfs/squashfs/tarroot.

The problem is that $(IMAGE) is the absolute path of the image including
directories, so the build tries to access
$(STAGING_DIR)/_fakeroot.</full/path/to/buildroot/directory> which doesn't
exist. 

The fix is to define CRAMFS/SQUASHFS/TAR_TARGET as $(notdir
$(IMAGE).<extension>) instead.


====================================================================== 

---------------------------------------------------------------------- 
 andersen - 04-10-06 16:35  
---------------------------------------------------------------------- 
appears to be working now, thanks 

Issue History 
Date Modified   Username       Field                    Change               
====================================================================== 
04-10-06 07:57  jacmet         New Issue                                    
04-10-06 07:57  jacmet         Status                   new => assigned     
04-10-06 07:57  jacmet         Assigned To               => uClibc          
04-10-06 07:57  jacmet         File Added: buildroot-IMAGE-is-absolute.patch    
               
04-10-06 16:35  andersen       Note Added: 0001246                          
04-10-06 16:35  andersen       Status                   assigned => closed  
04-10-06 16:35  andersen       Resolution               open => fixed       
02-12-07 05:46  vapier         Status                   closed => assigned  
02-12-07 05:46  vapier         Assigned To              uClibc => buildroot 
======================================================================
